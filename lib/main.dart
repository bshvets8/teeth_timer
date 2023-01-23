import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:teeth_timer/state_model.dart';
import 'package:teeth_timer/timer_widget.dart';

void main() async {
  await Isar.open([StateModelSchema]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teeth Timer',
      theme: ThemeData(
        primaryColor: Colors.cyan[200],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  static const maxDuration = Duration(hours: 2);

  late StateModel _stateModel;

  Timer? _timer;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _isLoading = true;

    Future.microtask(
      () async {
        _stateModel = await _getStateModel();

        if (_stateModel.startedAtMillis != null) {
          _startTimer();
        } else {
          _stopTimer();
        }

        _isLoading = false;
        setState(() {});
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      _isLoading = true;
      setState(() {});
      _stateModel = await _getStateModel();

      if (_stateModel.startedAtMillis != null) {
        _startTimer();
      } else {
        _stopTimer();
      }

      _isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final nowMillis = DateTime.now().millisecondsSinceEpoch;
    final usedMillis = nowMillis - (_stateModel.startedAtMillis ?? nowMillis);
    final remindedMillis = _stateModel.currentReminderMillis - usedMillis;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: TimerWidget(
                      currentMillis: remindedMillis,
                      maxMillis: maxDuration.inMilliseconds,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: _timer != null
                      ? null
                      : () async {
                          Duration selected = Duration(
                            milliseconds: remindedMillis,
                          );
                          await showModalBottomSheet<void>(
                            context: context,
                            builder: (context) {
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CupertinoTimerPicker(
                                          onTimerDurationChanged: (value) {
                                            selected = value;
                                          },
                                          initialTimerDuration: selected,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  FractionallySizedBox(
                                    widthFactor: 0.8,
                                    child: SizedBox(
                                      height: 60,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (selected.inMilliseconds >
                                              maxDuration.inMilliseconds) {
                                            return;
                                          }

                                          _stateModel.currentReminderMillis =
                                              selected.inMilliseconds;
                                          _saveStateModel(_stateModel);
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Text(
                                          'Зберегти',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              );
                            },
                          );

                          setState(() {});
                        },
                ),
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: SizedBox(
                      height: 60,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: remindedMillis >= 0
                              ? Theme.of(context).primaryColor
                              : Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: switchTimer,
                        child: Text(
                          _timer == null ? 'Старт' : 'Стоп',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<StateModel> _getStateModel() async {
    return await _loadStateModel() ?? await _createStateModel();
  }

  Future<StateModel> _createStateModel() async {
    final now = DateTime.now().subtract(const Duration(hours: 12));

    final stateModel = StateModel()
      ..year = now.year
      ..month = now.month
      ..day = now.day
      ..currentReminderMillis = maxDuration.inMilliseconds;

    await _saveStateModel(stateModel);

    return stateModel;
  }

  Future<StateModel?> _loadStateModel() {
    final now = DateTime.now().subtract(const Duration(hours: 12));

    return Isar.getInstance()!
        .stateModels
        .where(sort: Sort.desc)
        .filter()
        .yearEqualTo(now.year)
        .monthEqualTo(now.month)
        .dayEqualTo(now.day)
        .findFirst();
  }

  Future<void> _saveStateModel(StateModel stateModel) async {
    final isar = Isar.getInstance()!;
    await isar.writeTxn(() => isar.stateModels.put(stateModel));
  }

  Future<void> _saveStateModelOnStart() async {
    final nowMillis = DateTime.now().millisecondsSinceEpoch;

    _stateModel.startedAtMillis = nowMillis;
    await _saveStateModel(_stateModel);
  }

  Future<void> _saveStateModelOnStop() async {
    final nowMillis = DateTime.now().millisecondsSinceEpoch;
    final staredAt = _stateModel.startedAtMillis ?? nowMillis;

    _stateModel
      ..currentReminderMillis -= nowMillis - staredAt
      ..startedAtMillis = null;

    await _saveStateModel(_stateModel);
  }

  void switchTimer() => setState(() {
        if (_timer != null) {
          _stopTimer();

          _saveStateModelOnStop();
          return;
        }

        _saveStateModelOnStart();
        _startTimer();
      });

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        setState(() {});
      },
    );
  }
}
