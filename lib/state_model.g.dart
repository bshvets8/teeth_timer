// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetStateModelCollection on Isar {
  IsarCollection<StateModel> get stateModels => this.collection();
}

const StateModelSchema = CollectionSchema(
  name: r'StateModel',
  id: 7073699290220819961,
  properties: {
    r'currentReminderMillis': PropertySchema(
      id: 0,
      name: r'currentReminderMillis',
      type: IsarType.long,
    ),
    r'day': PropertySchema(
      id: 1,
      name: r'day',
      type: IsarType.long,
    ),
    r'month': PropertySchema(
      id: 2,
      name: r'month',
      type: IsarType.long,
    ),
    r'startedAtMillis': PropertySchema(
      id: 3,
      name: r'startedAtMillis',
      type: IsarType.long,
    ),
    r'year': PropertySchema(
      id: 4,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _stateModelEstimateSize,
  serialize: _stateModelSerialize,
  deserialize: _stateModelDeserialize,
  deserializeProp: _stateModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stateModelGetId,
  getLinks: _stateModelGetLinks,
  attach: _stateModelAttach,
  version: '3.0.5',
);

int _stateModelEstimateSize(
  StateModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _stateModelSerialize(
  StateModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentReminderMillis);
  writer.writeLong(offsets[1], object.day);
  writer.writeLong(offsets[2], object.month);
  writer.writeLong(offsets[3], object.startedAtMillis);
  writer.writeLong(offsets[4], object.year);
}

StateModel _stateModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StateModel();
  object.currentReminderMillis = reader.readLong(offsets[0]);
  object.day = reader.readLong(offsets[1]);
  object.id = id;
  object.month = reader.readLong(offsets[2]);
  object.startedAtMillis = reader.readLongOrNull(offsets[3]);
  object.year = reader.readLong(offsets[4]);
  return object;
}

P _stateModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stateModelGetId(StateModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stateModelGetLinks(StateModel object) {
  return [];
}

void _stateModelAttach(IsarCollection<dynamic> col, Id id, StateModel object) {
  object.id = id;
}

extension StateModelQueryWhereSort
    on QueryBuilder<StateModel, StateModel, QWhere> {
  QueryBuilder<StateModel, StateModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StateModelQueryWhere
    on QueryBuilder<StateModel, StateModel, QWhereClause> {
  QueryBuilder<StateModel, StateModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StateModelQueryFilter
    on QueryBuilder<StateModel, StateModel, QFilterCondition> {
  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      currentReminderMillisEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentReminderMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      currentReminderMillisGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentReminderMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      currentReminderMillisLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentReminderMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      currentReminderMillisBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentReminderMillis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> dayEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> dayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> dayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> dayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> monthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> monthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> monthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> monthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      startedAtMillisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAtMillis',
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      startedAtMillisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAtMillis',
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      startedAtMillisEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      startedAtMillisGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      startedAtMillisLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAtMillis',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition>
      startedAtMillisBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAtMillis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> yearEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StateModelQueryObject
    on QueryBuilder<StateModel, StateModel, QFilterCondition> {}

extension StateModelQueryLinks
    on QueryBuilder<StateModel, StateModel, QFilterCondition> {}

extension StateModelQuerySortBy
    on QueryBuilder<StateModel, StateModel, QSortBy> {
  QueryBuilder<StateModel, StateModel, QAfterSortBy>
      sortByCurrentReminderMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReminderMillis', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy>
      sortByCurrentReminderMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReminderMillis', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> sortByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> sortByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> sortByStartedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAtMillis', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy>
      sortByStartedAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAtMillis', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension StateModelQuerySortThenBy
    on QueryBuilder<StateModel, StateModel, QSortThenBy> {
  QueryBuilder<StateModel, StateModel, QAfterSortBy>
      thenByCurrentReminderMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReminderMillis', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy>
      thenByCurrentReminderMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReminderMillis', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByStartedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAtMillis', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy>
      thenByStartedAtMillisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAtMillis', Sort.desc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<StateModel, StateModel, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension StateModelQueryWhereDistinct
    on QueryBuilder<StateModel, StateModel, QDistinct> {
  QueryBuilder<StateModel, StateModel, QDistinct>
      distinctByCurrentReminderMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentReminderMillis');
    });
  }

  QueryBuilder<StateModel, StateModel, QDistinct> distinctByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day');
    });
  }

  QueryBuilder<StateModel, StateModel, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<StateModel, StateModel, QDistinct> distinctByStartedAtMillis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAtMillis');
    });
  }

  QueryBuilder<StateModel, StateModel, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension StateModelQueryProperty
    on QueryBuilder<StateModel, StateModel, QQueryProperty> {
  QueryBuilder<StateModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StateModel, int, QQueryOperations>
      currentReminderMillisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentReminderMillis');
    });
  }

  QueryBuilder<StateModel, int, QQueryOperations> dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day');
    });
  }

  QueryBuilder<StateModel, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<StateModel, int?, QQueryOperations> startedAtMillisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAtMillis');
    });
  }

  QueryBuilder<StateModel, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
