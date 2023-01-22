import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:teeth_timer/state_model.dart';

void main() async {
  await Isar.open([StateModelSchema]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teeth Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

    _isLoading = true;
    setState(() {});

    if (state == AppLifecycleState.resumed) {
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
    final isOverdue = remindedMillis < 0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_formatDuration(Duration(milliseconds: remindedMillis)),
                style: Theme.of(context).textTheme.headline4),
            ElevatedButton(
              onPressed: switchTimer,
              child: Text(_timer == null ? 'Start' : 'Stop'),
            ),
          ],
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
    final now = DateTime.now();

    final stateModel = StateModel()
      ..year = now.year
      ..month = now.month
      ..day = now.day
      ..currentReminderMillis = const Duration(seconds: 10).inMilliseconds;

    await _saveStateModel(stateModel);

    return stateModel;
  }

  Future<StateModel?> _loadStateModel() {
    final now = DateTime.now();

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
      const Duration(milliseconds: 300),
      (timer) {
        setState(() {});
      },
    );
  }

  String _formatDuration(Duration duration) {
    final String hours = duration.inHours.abs().toString().padLeft(2, '0');
    final String minutes =
        duration.inMinutes.remainder(60).abs().toString().padLeft(2, '0');
    final String seconds =
        duration.inSeconds.remainder(60).abs().toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }
}
