// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, username, password, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String password;
  final DateTime createdAt;
  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? password,
    DateTime? createdAt,
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    password: password ?? this.password,
    createdAt: createdAt ?? this.createdAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<DateTime> createdAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    this.createdAt = const Value.absent(),
  }) : username = Value(username),
       password = Value(password);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<String>? password,
    Value<DateTime>? createdAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $VehicleTypesTable extends VehicleTypes
    with TableInfo<$VehicleTypesTable, VehicleType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeNameMeta = const VerificationMeta(
    'typeName',
  );
  @override
  late final GeneratedColumn<String> typeName = GeneratedColumn<String>(
    'type_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, typeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type_name')) {
      context.handle(
        _typeNameMeta,
        typeName.isAcceptableOrUnknown(data['type_name']!, _typeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_typeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      typeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type_name'],
      )!,
    );
  }

  @override
  $VehicleTypesTable createAlias(String alias) {
    return $VehicleTypesTable(attachedDatabase, alias);
  }
}

class VehicleType extends DataClass implements Insertable<VehicleType> {
  final int id;
  final String typeName;
  const VehicleType({required this.id, required this.typeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type_name'] = Variable<String>(typeName);
    return map;
  }

  VehicleTypesCompanion toCompanion(bool nullToAbsent) {
    return VehicleTypesCompanion(id: Value(id), typeName: Value(typeName));
  }

  factory VehicleType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleType(
      id: serializer.fromJson<int>(json['id']),
      typeName: serializer.fromJson<String>(json['typeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'typeName': serializer.toJson<String>(typeName),
    };
  }

  VehicleType copyWith({int? id, String? typeName}) =>
      VehicleType(id: id ?? this.id, typeName: typeName ?? this.typeName);
  VehicleType copyWithCompanion(VehicleTypesCompanion data) {
    return VehicleType(
      id: data.id.present ? data.id.value : this.id,
      typeName: data.typeName.present ? data.typeName.value : this.typeName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleType(')
          ..write('id: $id, ')
          ..write('typeName: $typeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, typeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleType &&
          other.id == this.id &&
          other.typeName == this.typeName);
}

class VehicleTypesCompanion extends UpdateCompanion<VehicleType> {
  final Value<int> id;
  final Value<String> typeName;
  const VehicleTypesCompanion({
    this.id = const Value.absent(),
    this.typeName = const Value.absent(),
  });
  VehicleTypesCompanion.insert({
    this.id = const Value.absent(),
    required String typeName,
  }) : typeName = Value(typeName);
  static Insertable<VehicleType> custom({
    Expression<int>? id,
    Expression<String>? typeName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (typeName != null) 'type_name': typeName,
    });
  }

  VehicleTypesCompanion copyWith({Value<int>? id, Value<String>? typeName}) {
    return VehicleTypesCompanion(
      id: id ?? this.id,
      typeName: typeName ?? this.typeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (typeName.present) {
      map['type_name'] = Variable<String>(typeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleTypesCompanion(')
          ..write('id: $id, ')
          ..write('typeName: $typeName')
          ..write(')'))
        .toString();
  }
}

class $ParkingStatusTable extends ParkingStatus
    with TableInfo<$ParkingStatusTable, ParkingStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParkingStatusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _statusNameMeta = const VerificationMeta(
    'statusName',
  );
  @override
  late final GeneratedColumn<String> statusName = GeneratedColumn<String>(
    'status_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, statusName, colorHex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parking_status';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParkingStatusData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status_name')) {
      context.handle(
        _statusNameMeta,
        statusName.isAcceptableOrUnknown(data['status_name']!, _statusNameMeta),
      );
    } else if (isInserting) {
      context.missing(_statusNameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParkingStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParkingStatusData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      statusName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_name'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      )!,
    );
  }

  @override
  $ParkingStatusTable createAlias(String alias) {
    return $ParkingStatusTable(attachedDatabase, alias);
  }
}

class ParkingStatusData extends DataClass
    implements Insertable<ParkingStatusData> {
  final int id;
  final String statusName;
  final String colorHex;
  const ParkingStatusData({
    required this.id,
    required this.statusName,
    required this.colorHex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['status_name'] = Variable<String>(statusName);
    map['color_hex'] = Variable<String>(colorHex);
    return map;
  }

  ParkingStatusCompanion toCompanion(bool nullToAbsent) {
    return ParkingStatusCompanion(
      id: Value(id),
      statusName: Value(statusName),
      colorHex: Value(colorHex),
    );
  }

  factory ParkingStatusData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParkingStatusData(
      id: serializer.fromJson<int>(json['id']),
      statusName: serializer.fromJson<String>(json['statusName']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statusName': serializer.toJson<String>(statusName),
      'colorHex': serializer.toJson<String>(colorHex),
    };
  }

  ParkingStatusData copyWith({int? id, String? statusName, String? colorHex}) =>
      ParkingStatusData(
        id: id ?? this.id,
        statusName: statusName ?? this.statusName,
        colorHex: colorHex ?? this.colorHex,
      );
  ParkingStatusData copyWithCompanion(ParkingStatusCompanion data) {
    return ParkingStatusData(
      id: data.id.present ? data.id.value : this.id,
      statusName: data.statusName.present
          ? data.statusName.value
          : this.statusName,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParkingStatusData(')
          ..write('id: $id, ')
          ..write('statusName: $statusName, ')
          ..write('colorHex: $colorHex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, statusName, colorHex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParkingStatusData &&
          other.id == this.id &&
          other.statusName == this.statusName &&
          other.colorHex == this.colorHex);
}

class ParkingStatusCompanion extends UpdateCompanion<ParkingStatusData> {
  final Value<int> id;
  final Value<String> statusName;
  final Value<String> colorHex;
  const ParkingStatusCompanion({
    this.id = const Value.absent(),
    this.statusName = const Value.absent(),
    this.colorHex = const Value.absent(),
  });
  ParkingStatusCompanion.insert({
    this.id = const Value.absent(),
    required String statusName,
    required String colorHex,
  }) : statusName = Value(statusName),
       colorHex = Value(colorHex);
  static Insertable<ParkingStatusData> custom({
    Expression<int>? id,
    Expression<String>? statusName,
    Expression<String>? colorHex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statusName != null) 'status_name': statusName,
      if (colorHex != null) 'color_hex': colorHex,
    });
  }

  ParkingStatusCompanion copyWith({
    Value<int>? id,
    Value<String>? statusName,
    Value<String>? colorHex,
  }) {
    return ParkingStatusCompanion(
      id: id ?? this.id,
      statusName: statusName ?? this.statusName,
      colorHex: colorHex ?? this.colorHex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (statusName.present) {
      map['status_name'] = Variable<String>(statusName.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParkingStatusCompanion(')
          ..write('id: $id, ')
          ..write('statusName: $statusName, ')
          ..write('colorHex: $colorHex')
          ..write(')'))
        .toString();
  }
}

class $ObservationTypesTable extends ObservationTypes
    with TableInfo<$ObservationTypesTable, ObservationType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObservationTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeNameMeta = const VerificationMeta(
    'typeName',
  );
  @override
  late final GeneratedColumn<String> typeName = GeneratedColumn<String>(
    'type_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, typeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'observation_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<ObservationType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type_name')) {
      context.handle(
        _typeNameMeta,
        typeName.isAcceptableOrUnknown(data['type_name']!, _typeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_typeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ObservationType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObservationType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      typeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type_name'],
      )!,
    );
  }

  @override
  $ObservationTypesTable createAlias(String alias) {
    return $ObservationTypesTable(attachedDatabase, alias);
  }
}

class ObservationType extends DataClass implements Insertable<ObservationType> {
  final int id;
  final String typeName;
  const ObservationType({required this.id, required this.typeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type_name'] = Variable<String>(typeName);
    return map;
  }

  ObservationTypesCompanion toCompanion(bool nullToAbsent) {
    return ObservationTypesCompanion(id: Value(id), typeName: Value(typeName));
  }

  factory ObservationType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObservationType(
      id: serializer.fromJson<int>(json['id']),
      typeName: serializer.fromJson<String>(json['typeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'typeName': serializer.toJson<String>(typeName),
    };
  }

  ObservationType copyWith({int? id, String? typeName}) =>
      ObservationType(id: id ?? this.id, typeName: typeName ?? this.typeName);
  ObservationType copyWithCompanion(ObservationTypesCompanion data) {
    return ObservationType(
      id: data.id.present ? data.id.value : this.id,
      typeName: data.typeName.present ? data.typeName.value : this.typeName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ObservationType(')
          ..write('id: $id, ')
          ..write('typeName: $typeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, typeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObservationType &&
          other.id == this.id &&
          other.typeName == this.typeName);
}

class ObservationTypesCompanion extends UpdateCompanion<ObservationType> {
  final Value<int> id;
  final Value<String> typeName;
  const ObservationTypesCompanion({
    this.id = const Value.absent(),
    this.typeName = const Value.absent(),
  });
  ObservationTypesCompanion.insert({
    this.id = const Value.absent(),
    required String typeName,
  }) : typeName = Value(typeName);
  static Insertable<ObservationType> custom({
    Expression<int>? id,
    Expression<String>? typeName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (typeName != null) 'type_name': typeName,
    });
  }

  ObservationTypesCompanion copyWith({
    Value<int>? id,
    Value<String>? typeName,
  }) {
    return ObservationTypesCompanion(
      id: id ?? this.id,
      typeName: typeName ?? this.typeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (typeName.present) {
      map['type_name'] = Variable<String>(typeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObservationTypesCompanion(')
          ..write('id: $id, ')
          ..write('typeName: $typeName')
          ..write(')'))
        .toString();
  }
}

class $ParkingSpotsTable extends ParkingSpots
    with TableInfo<$ParkingSpotsTable, ParkingSpot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParkingSpotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _vehicleTypeIdMeta = const VerificationMeta(
    'vehicleTypeId',
  );
  @override
  late final GeneratedColumn<int> vehicleTypeId = GeneratedColumn<int>(
    'vehicle_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicle_types (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    userId,
    vehicleTypeId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parking_spots';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParkingSpot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('vehicle_type_id')) {
      context.handle(
        _vehicleTypeIdMeta,
        vehicleTypeId.isAcceptableOrUnknown(
          data['vehicle_type_id']!,
          _vehicleTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleTypeIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParkingSpot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParkingSpot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
      vehicleTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_type_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ParkingSpotsTable createAlias(String alias) {
    return $ParkingSpotsTable(attachedDatabase, alias);
  }
}

class ParkingSpot extends DataClass implements Insertable<ParkingSpot> {
  final int id;
  final String name;
  final int? userId;
  final int vehicleTypeId;
  final DateTime createdAt;
  const ParkingSpot({
    required this.id,
    required this.name,
    this.userId,
    required this.vehicleTypeId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    map['vehicle_type_id'] = Variable<int>(vehicleTypeId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ParkingSpotsCompanion toCompanion(bool nullToAbsent) {
    return ParkingSpotsCompanion(
      id: Value(id),
      name: Value(name),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      vehicleTypeId: Value(vehicleTypeId),
      createdAt: Value(createdAt),
    );
  }

  factory ParkingSpot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParkingSpot(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userId: serializer.fromJson<int?>(json['userId']),
      vehicleTypeId: serializer.fromJson<int>(json['vehicleTypeId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userId': serializer.toJson<int?>(userId),
      'vehicleTypeId': serializer.toJson<int>(vehicleTypeId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ParkingSpot copyWith({
    int? id,
    String? name,
    Value<int?> userId = const Value.absent(),
    int? vehicleTypeId,
    DateTime? createdAt,
  }) => ParkingSpot(
    id: id ?? this.id,
    name: name ?? this.name,
    userId: userId.present ? userId.value : this.userId,
    vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
    createdAt: createdAt ?? this.createdAt,
  );
  ParkingSpot copyWithCompanion(ParkingSpotsCompanion data) {
    return ParkingSpot(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      userId: data.userId.present ? data.userId.value : this.userId,
      vehicleTypeId: data.vehicleTypeId.present
          ? data.vehicleTypeId.value
          : this.vehicleTypeId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParkingSpot(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userId, vehicleTypeId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParkingSpot &&
          other.id == this.id &&
          other.name == this.name &&
          other.userId == this.userId &&
          other.vehicleTypeId == this.vehicleTypeId &&
          other.createdAt == this.createdAt);
}

class ParkingSpotsCompanion extends UpdateCompanion<ParkingSpot> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> userId;
  final Value<int> vehicleTypeId;
  final Value<DateTime> createdAt;
  const ParkingSpotsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
    this.vehicleTypeId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ParkingSpotsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.userId = const Value.absent(),
    required int vehicleTypeId,
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       vehicleTypeId = Value(vehicleTypeId);
  static Insertable<ParkingSpot> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? userId,
    Expression<int>? vehicleTypeId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
      if (vehicleTypeId != null) 'vehicle_type_id': vehicleTypeId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ParkingSpotsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? userId,
    Value<int>? vehicleTypeId,
    Value<DateTime>? createdAt,
  }) {
    return ParkingSpotsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (vehicleTypeId.present) {
      map['vehicle_type_id'] = Variable<int>(vehicleTypeId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParkingSpotsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ParkingLocationsTable extends ParkingLocations
    with TableInfo<$ParkingLocationsTable, ParkingLocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParkingLocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _parkingSpotIdMeta = const VerificationMeta(
    'parkingSpotId',
  );
  @override
  late final GeneratedColumn<int> parkingSpotId = GeneratedColumn<int>(
    'parking_spot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parking_spots (id)',
    ),
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parkingSpotId,
    latitude,
    longitude,
    address,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parking_locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParkingLocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parking_spot_id')) {
      context.handle(
        _parkingSpotIdMeta,
        parkingSpotId.isAcceptableOrUnknown(
          data['parking_spot_id']!,
          _parkingSpotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parkingSpotIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParkingLocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParkingLocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parkingSpotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parking_spot_id'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
    );
  }

  @override
  $ParkingLocationsTable createAlias(String alias) {
    return $ParkingLocationsTable(attachedDatabase, alias);
  }
}

class ParkingLocation extends DataClass implements Insertable<ParkingLocation> {
  final int id;
  final int parkingSpotId;
  final double latitude;
  final double longitude;
  final String? address;
  const ParkingLocation({
    required this.id,
    required this.parkingSpotId,
    required this.latitude,
    required this.longitude,
    this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parking_spot_id'] = Variable<int>(parkingSpotId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    return map;
  }

  ParkingLocationsCompanion toCompanion(bool nullToAbsent) {
    return ParkingLocationsCompanion(
      id: Value(id),
      parkingSpotId: Value(parkingSpotId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
    );
  }

  factory ParkingLocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParkingLocation(
      id: serializer.fromJson<int>(json['id']),
      parkingSpotId: serializer.fromJson<int>(json['parkingSpotId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      address: serializer.fromJson<String?>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parkingSpotId': serializer.toJson<int>(parkingSpotId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'address': serializer.toJson<String?>(address),
    };
  }

  ParkingLocation copyWith({
    int? id,
    int? parkingSpotId,
    double? latitude,
    double? longitude,
    Value<String?> address = const Value.absent(),
  }) => ParkingLocation(
    id: id ?? this.id,
    parkingSpotId: parkingSpotId ?? this.parkingSpotId,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    address: address.present ? address.value : this.address,
  );
  ParkingLocation copyWithCompanion(ParkingLocationsCompanion data) {
    return ParkingLocation(
      id: data.id.present ? data.id.value : this.id,
      parkingSpotId: data.parkingSpotId.present
          ? data.parkingSpotId.value
          : this.parkingSpotId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParkingLocation(')
          ..write('id: $id, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, parkingSpotId, latitude, longitude, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParkingLocation &&
          other.id == this.id &&
          other.parkingSpotId == this.parkingSpotId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address);
}

class ParkingLocationsCompanion extends UpdateCompanion<ParkingLocation> {
  final Value<int> id;
  final Value<int> parkingSpotId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String?> address;
  const ParkingLocationsCompanion({
    this.id = const Value.absent(),
    this.parkingSpotId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
  });
  ParkingLocationsCompanion.insert({
    this.id = const Value.absent(),
    required int parkingSpotId,
    required double latitude,
    required double longitude,
    this.address = const Value.absent(),
  }) : parkingSpotId = Value(parkingSpotId),
       latitude = Value(latitude),
       longitude = Value(longitude);
  static Insertable<ParkingLocation> custom({
    Expression<int>? id,
    Expression<int>? parkingSpotId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parkingSpotId != null) 'parking_spot_id': parkingSpotId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
    });
  }

  ParkingLocationsCompanion copyWith({
    Value<int>? id,
    Value<int>? parkingSpotId,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String?>? address,
  }) {
    return ParkingLocationsCompanion(
      id: id ?? this.id,
      parkingSpotId: parkingSpotId ?? this.parkingSpotId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parkingSpotId.present) {
      map['parking_spot_id'] = Variable<int>(parkingSpotId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParkingLocationsCompanion(')
          ..write('id: $id, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $ParkingPhotosTable extends ParkingPhotos
    with TableInfo<$ParkingPhotosTable, ParkingPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParkingPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _parkingSpotIdMeta = const VerificationMeta(
    'parkingSpotId',
  );
  @override
  late final GeneratedColumn<int> parkingSpotId = GeneratedColumn<int>(
    'parking_spot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parking_spots (id)',
    ),
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _takenAtMeta = const VerificationMeta(
    'takenAt',
  );
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
    'taken_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, parkingSpotId, photoPath, takenAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parking_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParkingPhoto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parking_spot_id')) {
      context.handle(
        _parkingSpotIdMeta,
        parkingSpotId.isAcceptableOrUnknown(
          data['parking_spot_id']!,
          _parkingSpotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parkingSpotIdMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    } else if (isInserting) {
      context.missing(_photoPathMeta);
    }
    if (data.containsKey('taken_at')) {
      context.handle(
        _takenAtMeta,
        takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParkingPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParkingPhoto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parkingSpotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parking_spot_id'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      )!,
      takenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}taken_at'],
      )!,
    );
  }

  @override
  $ParkingPhotosTable createAlias(String alias) {
    return $ParkingPhotosTable(attachedDatabase, alias);
  }
}

class ParkingPhoto extends DataClass implements Insertable<ParkingPhoto> {
  final int id;
  final int parkingSpotId;
  final String photoPath;
  final DateTime takenAt;
  const ParkingPhoto({
    required this.id,
    required this.parkingSpotId,
    required this.photoPath,
    required this.takenAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parking_spot_id'] = Variable<int>(parkingSpotId);
    map['photo_path'] = Variable<String>(photoPath);
    map['taken_at'] = Variable<DateTime>(takenAt);
    return map;
  }

  ParkingPhotosCompanion toCompanion(bool nullToAbsent) {
    return ParkingPhotosCompanion(
      id: Value(id),
      parkingSpotId: Value(parkingSpotId),
      photoPath: Value(photoPath),
      takenAt: Value(takenAt),
    );
  }

  factory ParkingPhoto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParkingPhoto(
      id: serializer.fromJson<int>(json['id']),
      parkingSpotId: serializer.fromJson<int>(json['parkingSpotId']),
      photoPath: serializer.fromJson<String>(json['photoPath']),
      takenAt: serializer.fromJson<DateTime>(json['takenAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parkingSpotId': serializer.toJson<int>(parkingSpotId),
      'photoPath': serializer.toJson<String>(photoPath),
      'takenAt': serializer.toJson<DateTime>(takenAt),
    };
  }

  ParkingPhoto copyWith({
    int? id,
    int? parkingSpotId,
    String? photoPath,
    DateTime? takenAt,
  }) => ParkingPhoto(
    id: id ?? this.id,
    parkingSpotId: parkingSpotId ?? this.parkingSpotId,
    photoPath: photoPath ?? this.photoPath,
    takenAt: takenAt ?? this.takenAt,
  );
  ParkingPhoto copyWithCompanion(ParkingPhotosCompanion data) {
    return ParkingPhoto(
      id: data.id.present ? data.id.value : this.id,
      parkingSpotId: data.parkingSpotId.present
          ? data.parkingSpotId.value
          : this.parkingSpotId,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParkingPhoto(')
          ..write('id: $id, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('photoPath: $photoPath, ')
          ..write('takenAt: $takenAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parkingSpotId, photoPath, takenAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParkingPhoto &&
          other.id == this.id &&
          other.parkingSpotId == this.parkingSpotId &&
          other.photoPath == this.photoPath &&
          other.takenAt == this.takenAt);
}

class ParkingPhotosCompanion extends UpdateCompanion<ParkingPhoto> {
  final Value<int> id;
  final Value<int> parkingSpotId;
  final Value<String> photoPath;
  final Value<DateTime> takenAt;
  const ParkingPhotosCompanion({
    this.id = const Value.absent(),
    this.parkingSpotId = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.takenAt = const Value.absent(),
  });
  ParkingPhotosCompanion.insert({
    this.id = const Value.absent(),
    required int parkingSpotId,
    required String photoPath,
    this.takenAt = const Value.absent(),
  }) : parkingSpotId = Value(parkingSpotId),
       photoPath = Value(photoPath);
  static Insertable<ParkingPhoto> custom({
    Expression<int>? id,
    Expression<int>? parkingSpotId,
    Expression<String>? photoPath,
    Expression<DateTime>? takenAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parkingSpotId != null) 'parking_spot_id': parkingSpotId,
      if (photoPath != null) 'photo_path': photoPath,
      if (takenAt != null) 'taken_at': takenAt,
    });
  }

  ParkingPhotosCompanion copyWith({
    Value<int>? id,
    Value<int>? parkingSpotId,
    Value<String>? photoPath,
    Value<DateTime>? takenAt,
  }) {
    return ParkingPhotosCompanion(
      id: id ?? this.id,
      parkingSpotId: parkingSpotId ?? this.parkingSpotId,
      photoPath: photoPath ?? this.photoPath,
      takenAt: takenAt ?? this.takenAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parkingSpotId.present) {
      map['parking_spot_id'] = Variable<int>(parkingSpotId.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParkingPhotosCompanion(')
          ..write('id: $id, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('photoPath: $photoPath, ')
          ..write('takenAt: $takenAt')
          ..write(')'))
        .toString();
  }
}

class $ObservationsTable extends Observations
    with TableInfo<$ObservationsTable, Observation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObservationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _parkingSpotIdMeta = const VerificationMeta(
    'parkingSpotId',
  );
  @override
  late final GeneratedColumn<int> parkingSpotId = GeneratedColumn<int>(
    'parking_spot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parking_spots (id)',
    ),
  );
  static const VerificationMeta _statusIdMeta = const VerificationMeta(
    'statusId',
  );
  @override
  late final GeneratedColumn<int> statusId = GeneratedColumn<int>(
    'status_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parking_status (id)',
    ),
  );
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<int> typeId = GeneratedColumn<int>(
    'type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES observation_types (id)',
    ),
  );
  static const VerificationMeta _observedAtMeta = const VerificationMeta(
    'observedAt',
  );
  @override
  late final GeneratedColumn<DateTime> observedAt = GeneratedColumn<DateTime>(
    'observed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    parkingSpotId,
    statusId,
    typeId,
    observedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'observations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Observation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('parking_spot_id')) {
      context.handle(
        _parkingSpotIdMeta,
        parkingSpotId.isAcceptableOrUnknown(
          data['parking_spot_id']!,
          _parkingSpotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parkingSpotIdMeta);
    }
    if (data.containsKey('status_id')) {
      context.handle(
        _statusIdMeta,
        statusId.isAcceptableOrUnknown(data['status_id']!, _statusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_statusIdMeta);
    }
    if (data.containsKey('type_id')) {
      context.handle(
        _typeIdMeta,
        typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('observed_at')) {
      context.handle(
        _observedAtMeta,
        observedAt.isAcceptableOrUnknown(data['observed_at']!, _observedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Observation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Observation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      parkingSpotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parking_spot_id'],
      )!,
      statusId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_id'],
      )!,
      typeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type_id'],
      )!,
      observedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}observed_at'],
      )!,
    );
  }

  @override
  $ObservationsTable createAlias(String alias) {
    return $ObservationsTable(attachedDatabase, alias);
  }
}

class Observation extends DataClass implements Insertable<Observation> {
  final int id;
  final int userId;
  final int parkingSpotId;
  final int statusId;
  final int typeId;
  final DateTime observedAt;
  const Observation({
    required this.id,
    required this.userId,
    required this.parkingSpotId,
    required this.statusId,
    required this.typeId,
    required this.observedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['parking_spot_id'] = Variable<int>(parkingSpotId);
    map['status_id'] = Variable<int>(statusId);
    map['type_id'] = Variable<int>(typeId);
    map['observed_at'] = Variable<DateTime>(observedAt);
    return map;
  }

  ObservationsCompanion toCompanion(bool nullToAbsent) {
    return ObservationsCompanion(
      id: Value(id),
      userId: Value(userId),
      parkingSpotId: Value(parkingSpotId),
      statusId: Value(statusId),
      typeId: Value(typeId),
      observedAt: Value(observedAt),
    );
  }

  factory Observation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Observation(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      parkingSpotId: serializer.fromJson<int>(json['parkingSpotId']),
      statusId: serializer.fromJson<int>(json['statusId']),
      typeId: serializer.fromJson<int>(json['typeId']),
      observedAt: serializer.fromJson<DateTime>(json['observedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'parkingSpotId': serializer.toJson<int>(parkingSpotId),
      'statusId': serializer.toJson<int>(statusId),
      'typeId': serializer.toJson<int>(typeId),
      'observedAt': serializer.toJson<DateTime>(observedAt),
    };
  }

  Observation copyWith({
    int? id,
    int? userId,
    int? parkingSpotId,
    int? statusId,
    int? typeId,
    DateTime? observedAt,
  }) => Observation(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    parkingSpotId: parkingSpotId ?? this.parkingSpotId,
    statusId: statusId ?? this.statusId,
    typeId: typeId ?? this.typeId,
    observedAt: observedAt ?? this.observedAt,
  );
  Observation copyWithCompanion(ObservationsCompanion data) {
    return Observation(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      parkingSpotId: data.parkingSpotId.present
          ? data.parkingSpotId.value
          : this.parkingSpotId,
      statusId: data.statusId.present ? data.statusId.value : this.statusId,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      observedAt: data.observedAt.present
          ? data.observedAt.value
          : this.observedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Observation(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('statusId: $statusId, ')
          ..write('typeId: $typeId, ')
          ..write('observedAt: $observedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, parkingSpotId, statusId, typeId, observedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Observation &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.parkingSpotId == this.parkingSpotId &&
          other.statusId == this.statusId &&
          other.typeId == this.typeId &&
          other.observedAt == this.observedAt);
}

class ObservationsCompanion extends UpdateCompanion<Observation> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> parkingSpotId;
  final Value<int> statusId;
  final Value<int> typeId;
  final Value<DateTime> observedAt;
  const ObservationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.parkingSpotId = const Value.absent(),
    this.statusId = const Value.absent(),
    this.typeId = const Value.absent(),
    this.observedAt = const Value.absent(),
  });
  ObservationsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int parkingSpotId,
    required int statusId,
    required int typeId,
    this.observedAt = const Value.absent(),
  }) : userId = Value(userId),
       parkingSpotId = Value(parkingSpotId),
       statusId = Value(statusId),
       typeId = Value(typeId);
  static Insertable<Observation> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? parkingSpotId,
    Expression<int>? statusId,
    Expression<int>? typeId,
    Expression<DateTime>? observedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (parkingSpotId != null) 'parking_spot_id': parkingSpotId,
      if (statusId != null) 'status_id': statusId,
      if (typeId != null) 'type_id': typeId,
      if (observedAt != null) 'observed_at': observedAt,
    });
  }

  ObservationsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? parkingSpotId,
    Value<int>? statusId,
    Value<int>? typeId,
    Value<DateTime>? observedAt,
  }) {
    return ObservationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      parkingSpotId: parkingSpotId ?? this.parkingSpotId,
      statusId: statusId ?? this.statusId,
      typeId: typeId ?? this.typeId,
      observedAt: observedAt ?? this.observedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (parkingSpotId.present) {
      map['parking_spot_id'] = Variable<int>(parkingSpotId.value);
    }
    if (statusId.present) {
      map['status_id'] = Variable<int>(statusId.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (observedAt.present) {
      map['observed_at'] = Variable<DateTime>(observedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObservationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('statusId: $statusId, ')
          ..write('typeId: $typeId, ')
          ..write('observedAt: $observedAt')
          ..write(')'))
        .toString();
  }
}

class $ReportsTable extends Reports with TableInfo<$ReportsTable, Report> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _parkingSpotIdMeta = const VerificationMeta(
    'parkingSpotId',
  );
  @override
  late final GeneratedColumn<int> parkingSpotId = GeneratedColumn<int>(
    'parking_spot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parking_spots (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reportedAtMeta = const VerificationMeta(
    'reportedAt',
  );
  @override
  late final GeneratedColumn<DateTime> reportedAt = GeneratedColumn<DateTime>(
    'reported_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    parkingSpotId,
    description,
    reportedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<Report> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('parking_spot_id')) {
      context.handle(
        _parkingSpotIdMeta,
        parkingSpotId.isAcceptableOrUnknown(
          data['parking_spot_id']!,
          _parkingSpotIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parkingSpotIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('reported_at')) {
      context.handle(
        _reportedAtMeta,
        reportedAt.isAcceptableOrUnknown(data['reported_at']!, _reportedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Report map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Report(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      parkingSpotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parking_spot_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      reportedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reported_at'],
      )!,
    );
  }

  @override
  $ReportsTable createAlias(String alias) {
    return $ReportsTable(attachedDatabase, alias);
  }
}

class Report extends DataClass implements Insertable<Report> {
  final int id;
  final int userId;
  final int parkingSpotId;
  final String description;
  final DateTime reportedAt;
  const Report({
    required this.id,
    required this.userId,
    required this.parkingSpotId,
    required this.description,
    required this.reportedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['parking_spot_id'] = Variable<int>(parkingSpotId);
    map['description'] = Variable<String>(description);
    map['reported_at'] = Variable<DateTime>(reportedAt);
    return map;
  }

  ReportsCompanion toCompanion(bool nullToAbsent) {
    return ReportsCompanion(
      id: Value(id),
      userId: Value(userId),
      parkingSpotId: Value(parkingSpotId),
      description: Value(description),
      reportedAt: Value(reportedAt),
    );
  }

  factory Report.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Report(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      parkingSpotId: serializer.fromJson<int>(json['parkingSpotId']),
      description: serializer.fromJson<String>(json['description']),
      reportedAt: serializer.fromJson<DateTime>(json['reportedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'parkingSpotId': serializer.toJson<int>(parkingSpotId),
      'description': serializer.toJson<String>(description),
      'reportedAt': serializer.toJson<DateTime>(reportedAt),
    };
  }

  Report copyWith({
    int? id,
    int? userId,
    int? parkingSpotId,
    String? description,
    DateTime? reportedAt,
  }) => Report(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    parkingSpotId: parkingSpotId ?? this.parkingSpotId,
    description: description ?? this.description,
    reportedAt: reportedAt ?? this.reportedAt,
  );
  Report copyWithCompanion(ReportsCompanion data) {
    return Report(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      parkingSpotId: data.parkingSpotId.present
          ? data.parkingSpotId.value
          : this.parkingSpotId,
      description: data.description.present
          ? data.description.value
          : this.description,
      reportedAt: data.reportedAt.present
          ? data.reportedAt.value
          : this.reportedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Report(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('description: $description, ')
          ..write('reportedAt: $reportedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, parkingSpotId, description, reportedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Report &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.parkingSpotId == this.parkingSpotId &&
          other.description == this.description &&
          other.reportedAt == this.reportedAt);
}

class ReportsCompanion extends UpdateCompanion<Report> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> parkingSpotId;
  final Value<String> description;
  final Value<DateTime> reportedAt;
  const ReportsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.parkingSpotId = const Value.absent(),
    this.description = const Value.absent(),
    this.reportedAt = const Value.absent(),
  });
  ReportsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int parkingSpotId,
    required String description,
    this.reportedAt = const Value.absent(),
  }) : userId = Value(userId),
       parkingSpotId = Value(parkingSpotId),
       description = Value(description);
  static Insertable<Report> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? parkingSpotId,
    Expression<String>? description,
    Expression<DateTime>? reportedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (parkingSpotId != null) 'parking_spot_id': parkingSpotId,
      if (description != null) 'description': description,
      if (reportedAt != null) 'reported_at': reportedAt,
    });
  }

  ReportsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? parkingSpotId,
    Value<String>? description,
    Value<DateTime>? reportedAt,
  }) {
    return ReportsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      parkingSpotId: parkingSpotId ?? this.parkingSpotId,
      description: description ?? this.description,
      reportedAt: reportedAt ?? this.reportedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (parkingSpotId.present) {
      map['parking_spot_id'] = Variable<int>(parkingSpotId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (reportedAt.present) {
      map['reported_at'] = Variable<DateTime>(reportedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('parkingSpotId: $parkingSpotId, ')
          ..write('description: $description, ')
          ..write('reportedAt: $reportedAt')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, Notification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, title, body, isRead];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Notification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notification(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  final int id;
  final int userId;
  final String title;
  final String body;
  final bool isRead;
  const Notification({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.isRead,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['is_read'] = Variable<bool>(isRead);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      body: Value(body),
      isRead: Value(isRead),
    );
  }

  factory Notification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notification(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      isRead: serializer.fromJson<bool>(json['isRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'isRead': serializer.toJson<bool>(isRead),
    };
  }

  Notification copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    bool? isRead,
  }) => Notification(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    body: body ?? this.body,
    isRead: isRead ?? this.isRead,
  );
  Notification copyWithCompanion(NotificationsCompanion data) {
    return Notification(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title, body, isRead);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.body == this.body &&
          other.isRead == this.isRead);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> body;
  final Value<bool> isRead;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.isRead = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String title,
    required String body,
    this.isRead = const Value.absent(),
  }) : userId = Value(userId),
       title = Value(title),
       body = Value(body);
  static Insertable<Notification> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<bool>? isRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (isRead != null) 'is_read': isRead,
    });
  }

  NotificationsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? title,
    Value<String>? body,
    Value<bool>? isRead,
  }) {
    return NotificationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }
}

class $ParkingSessionsTable extends ParkingSessions
    with TableInfo<$ParkingSessionsTable, ParkingSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParkingSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _entryTimeMeta = const VerificationMeta(
    'entryTime',
  );
  @override
  late final GeneratedColumn<DateTime> entryTime = GeneratedColumn<DateTime>(
    'entry_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exitTimeMeta = const VerificationMeta(
    'exitTime',
  );
  @override
  late final GeneratedColumn<DateTime> exitTime = GeneratedColumn<DateTime>(
    'exit_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feeMeta = const VerificationMeta('fee');
  @override
  late final GeneratedColumn<double> fee = GeneratedColumn<double>(
    'fee',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationNoteMeta = const VerificationMeta(
    'locationNote',
  );
  @override
  late final GeneratedColumn<String> locationNote = GeneratedColumn<String>(
    'location_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    entryTime,
    exitTime,
    fee,
    latitude,
    longitude,
    photoPath,
    locationNote,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parking_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParkingSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('entry_time')) {
      context.handle(
        _entryTimeMeta,
        entryTime.isAcceptableOrUnknown(data['entry_time']!, _entryTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_entryTimeMeta);
    }
    if (data.containsKey('exit_time')) {
      context.handle(
        _exitTimeMeta,
        exitTime.isAcceptableOrUnknown(data['exit_time']!, _exitTimeMeta),
      );
    }
    if (data.containsKey('fee')) {
      context.handle(
        _feeMeta,
        fee.isAcceptableOrUnknown(data['fee']!, _feeMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('location_note')) {
      context.handle(
        _locationNoteMeta,
        locationNote.isAcceptableOrUnknown(
          data['location_note']!,
          _locationNoteMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParkingSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParkingSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      entryTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}entry_time'],
      )!,
      exitTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}exit_time'],
      ),
      fee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fee'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      locationNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_note'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $ParkingSessionsTable createAlias(String alias) {
    return $ParkingSessionsTable(attachedDatabase, alias);
  }
}

class ParkingSession extends DataClass implements Insertable<ParkingSession> {
  final int id;
  final int userId;
  final DateTime entryTime;
  final DateTime? exitTime;
  final double? fee;
  final double? latitude;
  final double? longitude;
  final String? photoPath;
  final String? locationNote;
  final bool isActive;
  const ParkingSession({
    required this.id,
    required this.userId,
    required this.entryTime,
    this.exitTime,
    this.fee,
    this.latitude,
    this.longitude,
    this.photoPath,
    this.locationNote,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['entry_time'] = Variable<DateTime>(entryTime);
    if (!nullToAbsent || exitTime != null) {
      map['exit_time'] = Variable<DateTime>(exitTime);
    }
    if (!nullToAbsent || fee != null) {
      map['fee'] = Variable<double>(fee);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || locationNote != null) {
      map['location_note'] = Variable<String>(locationNote);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ParkingSessionsCompanion toCompanion(bool nullToAbsent) {
    return ParkingSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      entryTime: Value(entryTime),
      exitTime: exitTime == null && nullToAbsent
          ? const Value.absent()
          : Value(exitTime),
      fee: fee == null && nullToAbsent ? const Value.absent() : Value(fee),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      locationNote: locationNote == null && nullToAbsent
          ? const Value.absent()
          : Value(locationNote),
      isActive: Value(isActive),
    );
  }

  factory ParkingSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParkingSession(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      entryTime: serializer.fromJson<DateTime>(json['entryTime']),
      exitTime: serializer.fromJson<DateTime?>(json['exitTime']),
      fee: serializer.fromJson<double?>(json['fee']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      locationNote: serializer.fromJson<String?>(json['locationNote']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'entryTime': serializer.toJson<DateTime>(entryTime),
      'exitTime': serializer.toJson<DateTime?>(exitTime),
      'fee': serializer.toJson<double?>(fee),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'photoPath': serializer.toJson<String?>(photoPath),
      'locationNote': serializer.toJson<String?>(locationNote),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  ParkingSession copyWith({
    int? id,
    int? userId,
    DateTime? entryTime,
    Value<DateTime?> exitTime = const Value.absent(),
    Value<double?> fee = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    Value<String?> locationNote = const Value.absent(),
    bool? isActive,
  }) => ParkingSession(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    entryTime: entryTime ?? this.entryTime,
    exitTime: exitTime.present ? exitTime.value : this.exitTime,
    fee: fee.present ? fee.value : this.fee,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    locationNote: locationNote.present ? locationNote.value : this.locationNote,
    isActive: isActive ?? this.isActive,
  );
  ParkingSession copyWithCompanion(ParkingSessionsCompanion data) {
    return ParkingSession(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      entryTime: data.entryTime.present ? data.entryTime.value : this.entryTime,
      exitTime: data.exitTime.present ? data.exitTime.value : this.exitTime,
      fee: data.fee.present ? data.fee.value : this.fee,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      locationNote: data.locationNote.present
          ? data.locationNote.value
          : this.locationNote,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParkingSession(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('entryTime: $entryTime, ')
          ..write('exitTime: $exitTime, ')
          ..write('fee: $fee, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('photoPath: $photoPath, ')
          ..write('locationNote: $locationNote, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    entryTime,
    exitTime,
    fee,
    latitude,
    longitude,
    photoPath,
    locationNote,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParkingSession &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.entryTime == this.entryTime &&
          other.exitTime == this.exitTime &&
          other.fee == this.fee &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.photoPath == this.photoPath &&
          other.locationNote == this.locationNote &&
          other.isActive == this.isActive);
}

class ParkingSessionsCompanion extends UpdateCompanion<ParkingSession> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> entryTime;
  final Value<DateTime?> exitTime;
  final Value<double?> fee;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> photoPath;
  final Value<String?> locationNote;
  final Value<bool> isActive;
  const ParkingSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.exitTime = const Value.absent(),
    this.fee = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.locationNote = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ParkingSessionsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required DateTime entryTime,
    this.exitTime = const Value.absent(),
    this.fee = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.locationNote = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : userId = Value(userId),
       entryTime = Value(entryTime);
  static Insertable<ParkingSession> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? entryTime,
    Expression<DateTime>? exitTime,
    Expression<double>? fee,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? photoPath,
    Expression<String>? locationNote,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (entryTime != null) 'entry_time': entryTime,
      if (exitTime != null) 'exit_time': exitTime,
      if (fee != null) 'fee': fee,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (photoPath != null) 'photo_path': photoPath,
      if (locationNote != null) 'location_note': locationNote,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ParkingSessionsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<DateTime>? entryTime,
    Value<DateTime?>? exitTime,
    Value<double?>? fee,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<String?>? photoPath,
    Value<String?>? locationNote,
    Value<bool>? isActive,
  }) {
    return ParkingSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      entryTime: entryTime ?? this.entryTime,
      exitTime: exitTime ?? this.exitTime,
      fee: fee ?? this.fee,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      photoPath: photoPath ?? this.photoPath,
      locationNote: locationNote ?? this.locationNote,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (entryTime.present) {
      map['entry_time'] = Variable<DateTime>(entryTime.value);
    }
    if (exitTime.present) {
      map['exit_time'] = Variable<DateTime>(exitTime.value);
    }
    if (fee.present) {
      map['fee'] = Variable<double>(fee.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (locationNote.present) {
      map['location_note'] = Variable<String>(locationNote.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParkingSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('entryTime: $entryTime, ')
          ..write('exitTime: $exitTime, ')
          ..write('fee: $fee, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('photoPath: $photoPath, ')
          ..write('locationNote: $locationNote, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $VehicleTypesTable vehicleTypes = $VehicleTypesTable(this);
  late final $ParkingStatusTable parkingStatus = $ParkingStatusTable(this);
  late final $ObservationTypesTable observationTypes = $ObservationTypesTable(
    this,
  );
  late final $ParkingSpotsTable parkingSpots = $ParkingSpotsTable(this);
  late final $ParkingLocationsTable parkingLocations = $ParkingLocationsTable(
    this,
  );
  late final $ParkingPhotosTable parkingPhotos = $ParkingPhotosTable(this);
  late final $ObservationsTable observations = $ObservationsTable(this);
  late final $ReportsTable reports = $ReportsTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $ParkingSessionsTable parkingSessions = $ParkingSessionsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    vehicleTypes,
    parkingStatus,
    observationTypes,
    parkingSpots,
    parkingLocations,
    parkingPhotos,
    observations,
    reports,
    notifications,
    parkingSessions,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String username,
      required String password,
      Value<DateTime> createdAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<String> password,
      Value<DateTime> createdAt,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ParkingSpotsTable, List<ParkingSpot>>
  _parkingSpotsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.parkingSpots,
    aliasName: $_aliasNameGenerator(db.users.id, db.parkingSpots.userId),
  );

  $$ParkingSpotsTableProcessedTableManager get parkingSpotsRefs {
    final manager = $$ParkingSpotsTableTableManager(
      $_db,
      $_db.parkingSpots,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_parkingSpotsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ObservationsTable, List<Observation>>
  _observationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.observations,
    aliasName: $_aliasNameGenerator(db.users.id, db.observations.userId),
  );

  $$ObservationsTableProcessedTableManager get observationsRefs {
    final manager = $$ObservationsTableTableManager(
      $_db,
      $_db.observations,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_observationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReportsTable, List<Report>> _reportsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reports,
    aliasName: $_aliasNameGenerator(db.users.id, db.reports.userId),
  );

  $$ReportsTableProcessedTableManager get reportsRefs {
    final manager = $$ReportsTableTableManager(
      $_db,
      $_db.reports,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NotificationsTable, List<Notification>>
  _notificationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notifications,
    aliasName: $_aliasNameGenerator(db.users.id, db.notifications.userId),
  );

  $$NotificationsTableProcessedTableManager get notificationsRefs {
    final manager = $$NotificationsTableTableManager(
      $_db,
      $_db.notifications,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_notificationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ParkingSessionsTable, List<ParkingSession>>
  _parkingSessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.parkingSessions,
    aliasName: $_aliasNameGenerator(db.users.id, db.parkingSessions.userId),
  );

  $$ParkingSessionsTableProcessedTableManager get parkingSessionsRefs {
    final manager = $$ParkingSessionsTableTableManager(
      $_db,
      $_db.parkingSessions,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _parkingSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> parkingSpotsRefs(
    Expression<bool> Function($$ParkingSpotsTableFilterComposer f) f,
  ) {
    final $$ParkingSpotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableFilterComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> observationsRefs(
    Expression<bool> Function($$ObservationsTableFilterComposer f) f,
  ) {
    final $$ObservationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableFilterComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reportsRefs(
    Expression<bool> Function($$ReportsTableFilterComposer f) f,
  ) {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notificationsRefs(
    Expression<bool> Function($$NotificationsTableFilterComposer f) f,
  ) {
    final $$NotificationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationsTableFilterComposer(
            $db: $db,
            $table: $db.notifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> parkingSessionsRefs(
    Expression<bool> Function($$ParkingSessionsTableFilterComposer f) f,
  ) {
    final $$ParkingSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingSessions,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSessionsTableFilterComposer(
            $db: $db,
            $table: $db.parkingSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> parkingSpotsRefs<T extends Object>(
    Expression<T> Function($$ParkingSpotsTableAnnotationComposer a) f,
  ) {
    final $$ParkingSpotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> observationsRefs<T extends Object>(
    Expression<T> Function($$ObservationsTableAnnotationComposer a) f,
  ) {
    final $$ObservationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableAnnotationComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reportsRefs<T extends Object>(
    Expression<T> Function($$ReportsTableAnnotationComposer a) f,
  ) {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notificationsRefs<T extends Object>(
    Expression<T> Function($$NotificationsTableAnnotationComposer a) f,
  ) {
    final $$NotificationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationsTableAnnotationComposer(
            $db: $db,
            $table: $db.notifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> parkingSessionsRefs<T extends Object>(
    Expression<T> Function($$ParkingSessionsTableAnnotationComposer a) f,
  ) {
    final $$ParkingSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingSessions,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool parkingSpotsRefs,
            bool observationsRefs,
            bool reportsRefs,
            bool notificationsRefs,
            bool parkingSessionsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                password: password,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                required String password,
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                password: password,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                parkingSpotsRefs = false,
                observationsRefs = false,
                reportsRefs = false,
                notificationsRefs = false,
                parkingSessionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (parkingSpotsRefs) db.parkingSpots,
                    if (observationsRefs) db.observations,
                    if (reportsRefs) db.reports,
                    if (notificationsRefs) db.notifications,
                    if (parkingSessionsRefs) db.parkingSessions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (parkingSpotsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ParkingSpot
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._parkingSpotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).parkingSpotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (observationsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Observation
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._observationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).observationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reportsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Report>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._reportsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).reportsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notificationsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Notification
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._notificationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).notificationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (parkingSessionsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ParkingSession
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._parkingSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).parkingSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool parkingSpotsRefs,
        bool observationsRefs,
        bool reportsRefs,
        bool notificationsRefs,
        bool parkingSessionsRefs,
      })
    >;
typedef $$VehicleTypesTableCreateCompanionBuilder =
    VehicleTypesCompanion Function({Value<int> id, required String typeName});
typedef $$VehicleTypesTableUpdateCompanionBuilder =
    VehicleTypesCompanion Function({Value<int> id, Value<String> typeName});

final class $$VehicleTypesTableReferences
    extends BaseReferences<_$AppDatabase, $VehicleTypesTable, VehicleType> {
  $$VehicleTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ParkingSpotsTable, List<ParkingSpot>>
  _parkingSpotsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.parkingSpots,
    aliasName: $_aliasNameGenerator(
      db.vehicleTypes.id,
      db.parkingSpots.vehicleTypeId,
    ),
  );

  $$ParkingSpotsTableProcessedTableManager get parkingSpotsRefs {
    final manager = $$ParkingSpotsTableTableManager(
      $_db,
      $_db.parkingSpots,
    ).filter((f) => f.vehicleTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_parkingSpotsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehicleTypesTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleTypesTable> {
  $$VehicleTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typeName => $composableBuilder(
    column: $table.typeName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> parkingSpotsRefs(
    Expression<bool> Function($$ParkingSpotsTableFilterComposer f) f,
  ) {
    final $$ParkingSpotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.vehicleTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableFilterComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleTypesTable> {
  $$VehicleTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typeName => $composableBuilder(
    column: $table.typeName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleTypesTable> {
  $$VehicleTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get typeName =>
      $composableBuilder(column: $table.typeName, builder: (column) => column);

  Expression<T> parkingSpotsRefs<T extends Object>(
    Expression<T> Function($$ParkingSpotsTableAnnotationComposer a) f,
  ) {
    final $$ParkingSpotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.vehicleTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehicleTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehicleTypesTable,
          VehicleType,
          $$VehicleTypesTableFilterComposer,
          $$VehicleTypesTableOrderingComposer,
          $$VehicleTypesTableAnnotationComposer,
          $$VehicleTypesTableCreateCompanionBuilder,
          $$VehicleTypesTableUpdateCompanionBuilder,
          (VehicleType, $$VehicleTypesTableReferences),
          VehicleType,
          PrefetchHooks Function({bool parkingSpotsRefs})
        > {
  $$VehicleTypesTableTableManager(_$AppDatabase db, $VehicleTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> typeName = const Value.absent(),
              }) => VehicleTypesCompanion(id: id, typeName: typeName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String typeName,
              }) => VehicleTypesCompanion.insert(id: id, typeName: typeName),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehicleTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parkingSpotsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (parkingSpotsRefs) db.parkingSpots],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (parkingSpotsRefs)
                    await $_getPrefetchedData<
                      VehicleType,
                      $VehicleTypesTable,
                      ParkingSpot
                    >(
                      currentTable: table,
                      referencedTable: $$VehicleTypesTableReferences
                          ._parkingSpotsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$VehicleTypesTableReferences(
                            db,
                            table,
                            p0,
                          ).parkingSpotsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.vehicleTypeId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VehicleTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehicleTypesTable,
      VehicleType,
      $$VehicleTypesTableFilterComposer,
      $$VehicleTypesTableOrderingComposer,
      $$VehicleTypesTableAnnotationComposer,
      $$VehicleTypesTableCreateCompanionBuilder,
      $$VehicleTypesTableUpdateCompanionBuilder,
      (VehicleType, $$VehicleTypesTableReferences),
      VehicleType,
      PrefetchHooks Function({bool parkingSpotsRefs})
    >;
typedef $$ParkingStatusTableCreateCompanionBuilder =
    ParkingStatusCompanion Function({
      Value<int> id,
      required String statusName,
      required String colorHex,
    });
typedef $$ParkingStatusTableUpdateCompanionBuilder =
    ParkingStatusCompanion Function({
      Value<int> id,
      Value<String> statusName,
      Value<String> colorHex,
    });

final class $$ParkingStatusTableReferences
    extends
        BaseReferences<_$AppDatabase, $ParkingStatusTable, ParkingStatusData> {
  $$ParkingStatusTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ObservationsTable, List<Observation>>
  _observationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.observations,
    aliasName: $_aliasNameGenerator(
      db.parkingStatus.id,
      db.observations.statusId,
    ),
  );

  $$ObservationsTableProcessedTableManager get observationsRefs {
    final manager = $$ObservationsTableTableManager(
      $_db,
      $_db.observations,
    ).filter((f) => f.statusId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_observationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ParkingStatusTableFilterComposer
    extends Composer<_$AppDatabase, $ParkingStatusTable> {
  $$ParkingStatusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> observationsRefs(
    Expression<bool> Function($$ObservationsTableFilterComposer f) f,
  ) {
    final $$ObservationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.statusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableFilterComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParkingStatusTableOrderingComposer
    extends Composer<_$AppDatabase, $ParkingStatusTable> {
  $$ParkingStatusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ParkingStatusTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParkingStatusTable> {
  $$ParkingStatusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  Expression<T> observationsRefs<T extends Object>(
    Expression<T> Function($$ObservationsTableAnnotationComposer a) f,
  ) {
    final $$ObservationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.statusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableAnnotationComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParkingStatusTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParkingStatusTable,
          ParkingStatusData,
          $$ParkingStatusTableFilterComposer,
          $$ParkingStatusTableOrderingComposer,
          $$ParkingStatusTableAnnotationComposer,
          $$ParkingStatusTableCreateCompanionBuilder,
          $$ParkingStatusTableUpdateCompanionBuilder,
          (ParkingStatusData, $$ParkingStatusTableReferences),
          ParkingStatusData,
          PrefetchHooks Function({bool observationsRefs})
        > {
  $$ParkingStatusTableTableManager(_$AppDatabase db, $ParkingStatusTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParkingStatusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParkingStatusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParkingStatusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> statusName = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
              }) => ParkingStatusCompanion(
                id: id,
                statusName: statusName,
                colorHex: colorHex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String statusName,
                required String colorHex,
              }) => ParkingStatusCompanion.insert(
                id: id,
                statusName: statusName,
                colorHex: colorHex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ParkingStatusTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({observationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (observationsRefs) db.observations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (observationsRefs)
                    await $_getPrefetchedData<
                      ParkingStatusData,
                      $ParkingStatusTable,
                      Observation
                    >(
                      currentTable: table,
                      referencedTable: $$ParkingStatusTableReferences
                          ._observationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ParkingStatusTableReferences(
                            db,
                            table,
                            p0,
                          ).observationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.statusId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ParkingStatusTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParkingStatusTable,
      ParkingStatusData,
      $$ParkingStatusTableFilterComposer,
      $$ParkingStatusTableOrderingComposer,
      $$ParkingStatusTableAnnotationComposer,
      $$ParkingStatusTableCreateCompanionBuilder,
      $$ParkingStatusTableUpdateCompanionBuilder,
      (ParkingStatusData, $$ParkingStatusTableReferences),
      ParkingStatusData,
      PrefetchHooks Function({bool observationsRefs})
    >;
typedef $$ObservationTypesTableCreateCompanionBuilder =
    ObservationTypesCompanion Function({
      Value<int> id,
      required String typeName,
    });
typedef $$ObservationTypesTableUpdateCompanionBuilder =
    ObservationTypesCompanion Function({Value<int> id, Value<String> typeName});

final class $$ObservationTypesTableReferences
    extends
        BaseReferences<_$AppDatabase, $ObservationTypesTable, ObservationType> {
  $$ObservationTypesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ObservationsTable, List<Observation>>
  _observationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.observations,
    aliasName: $_aliasNameGenerator(
      db.observationTypes.id,
      db.observations.typeId,
    ),
  );

  $$ObservationsTableProcessedTableManager get observationsRefs {
    final manager = $$ObservationsTableTableManager(
      $_db,
      $_db.observations,
    ).filter((f) => f.typeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_observationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ObservationTypesTableFilterComposer
    extends Composer<_$AppDatabase, $ObservationTypesTable> {
  $$ObservationTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typeName => $composableBuilder(
    column: $table.typeName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> observationsRefs(
    Expression<bool> Function($$ObservationsTableFilterComposer f) f,
  ) {
    final $$ObservationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.typeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableFilterComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ObservationTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $ObservationTypesTable> {
  $$ObservationTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typeName => $composableBuilder(
    column: $table.typeName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ObservationTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ObservationTypesTable> {
  $$ObservationTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get typeName =>
      $composableBuilder(column: $table.typeName, builder: (column) => column);

  Expression<T> observationsRefs<T extends Object>(
    Expression<T> Function($$ObservationsTableAnnotationComposer a) f,
  ) {
    final $$ObservationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.typeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableAnnotationComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ObservationTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ObservationTypesTable,
          ObservationType,
          $$ObservationTypesTableFilterComposer,
          $$ObservationTypesTableOrderingComposer,
          $$ObservationTypesTableAnnotationComposer,
          $$ObservationTypesTableCreateCompanionBuilder,
          $$ObservationTypesTableUpdateCompanionBuilder,
          (ObservationType, $$ObservationTypesTableReferences),
          ObservationType,
          PrefetchHooks Function({bool observationsRefs})
        > {
  $$ObservationTypesTableTableManager(
    _$AppDatabase db,
    $ObservationTypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObservationTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObservationTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObservationTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> typeName = const Value.absent(),
              }) => ObservationTypesCompanion(id: id, typeName: typeName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String typeName,
              }) =>
                  ObservationTypesCompanion.insert(id: id, typeName: typeName),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ObservationTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({observationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (observationsRefs) db.observations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (observationsRefs)
                    await $_getPrefetchedData<
                      ObservationType,
                      $ObservationTypesTable,
                      Observation
                    >(
                      currentTable: table,
                      referencedTable: $$ObservationTypesTableReferences
                          ._observationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ObservationTypesTableReferences(
                            db,
                            table,
                            p0,
                          ).observationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.typeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ObservationTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ObservationTypesTable,
      ObservationType,
      $$ObservationTypesTableFilterComposer,
      $$ObservationTypesTableOrderingComposer,
      $$ObservationTypesTableAnnotationComposer,
      $$ObservationTypesTableCreateCompanionBuilder,
      $$ObservationTypesTableUpdateCompanionBuilder,
      (ObservationType, $$ObservationTypesTableReferences),
      ObservationType,
      PrefetchHooks Function({bool observationsRefs})
    >;
typedef $$ParkingSpotsTableCreateCompanionBuilder =
    ParkingSpotsCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> userId,
      required int vehicleTypeId,
      Value<DateTime> createdAt,
    });
typedef $$ParkingSpotsTableUpdateCompanionBuilder =
    ParkingSpotsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> userId,
      Value<int> vehicleTypeId,
      Value<DateTime> createdAt,
    });

final class $$ParkingSpotsTableReferences
    extends BaseReferences<_$AppDatabase, $ParkingSpotsTable, ParkingSpot> {
  $$ParkingSpotsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.parkingSpots.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager? get userId {
    final $_column = $_itemColumn<int>('user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VehicleTypesTable _vehicleTypeIdTable(_$AppDatabase db) =>
      db.vehicleTypes.createAlias(
        $_aliasNameGenerator(db.parkingSpots.vehicleTypeId, db.vehicleTypes.id),
      );

  $$VehicleTypesTableProcessedTableManager get vehicleTypeId {
    final $_column = $_itemColumn<int>('vehicle_type_id')!;

    final manager = $$VehicleTypesTableTableManager(
      $_db,
      $_db.vehicleTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ParkingLocationsTable, List<ParkingLocation>>
  _parkingLocationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.parkingLocations,
    aliasName: $_aliasNameGenerator(
      db.parkingSpots.id,
      db.parkingLocations.parkingSpotId,
    ),
  );

  $$ParkingLocationsTableProcessedTableManager get parkingLocationsRefs {
    final manager = $$ParkingLocationsTableTableManager(
      $_db,
      $_db.parkingLocations,
    ).filter((f) => f.parkingSpotId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _parkingLocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ParkingPhotosTable, List<ParkingPhoto>>
  _parkingPhotosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.parkingPhotos,
    aliasName: $_aliasNameGenerator(
      db.parkingSpots.id,
      db.parkingPhotos.parkingSpotId,
    ),
  );

  $$ParkingPhotosTableProcessedTableManager get parkingPhotosRefs {
    final manager = $$ParkingPhotosTableTableManager(
      $_db,
      $_db.parkingPhotos,
    ).filter((f) => f.parkingSpotId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_parkingPhotosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ObservationsTable, List<Observation>>
  _observationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.observations,
    aliasName: $_aliasNameGenerator(
      db.parkingSpots.id,
      db.observations.parkingSpotId,
    ),
  );

  $$ObservationsTableProcessedTableManager get observationsRefs {
    final manager = $$ObservationsTableTableManager(
      $_db,
      $_db.observations,
    ).filter((f) => f.parkingSpotId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_observationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReportsTable, List<Report>> _reportsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reports,
    aliasName: $_aliasNameGenerator(
      db.parkingSpots.id,
      db.reports.parkingSpotId,
    ),
  );

  $$ReportsTableProcessedTableManager get reportsRefs {
    final manager = $$ReportsTableTableManager(
      $_db,
      $_db.reports,
    ).filter((f) => f.parkingSpotId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ParkingSpotsTableFilterComposer
    extends Composer<_$AppDatabase, $ParkingSpotsTable> {
  $$ParkingSpotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleTypesTableFilterComposer get vehicleTypeId {
    final $$VehicleTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableFilterComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> parkingLocationsRefs(
    Expression<bool> Function($$ParkingLocationsTableFilterComposer f) f,
  ) {
    final $$ParkingLocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingLocations,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingLocationsTableFilterComposer(
            $db: $db,
            $table: $db.parkingLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> parkingPhotosRefs(
    Expression<bool> Function($$ParkingPhotosTableFilterComposer f) f,
  ) {
    final $$ParkingPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingPhotos,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingPhotosTableFilterComposer(
            $db: $db,
            $table: $db.parkingPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> observationsRefs(
    Expression<bool> Function($$ObservationsTableFilterComposer f) f,
  ) {
    final $$ObservationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableFilterComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reportsRefs(
    Expression<bool> Function($$ReportsTableFilterComposer f) f,
  ) {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParkingSpotsTableOrderingComposer
    extends Composer<_$AppDatabase, $ParkingSpotsTable> {
  $$ParkingSpotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleTypesTableOrderingComposer get vehicleTypeId {
    final $$VehicleTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingSpotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParkingSpotsTable> {
  $$ParkingSpotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VehicleTypesTableAnnotationComposer get vehicleTypeId {
    final $$VehicleTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleTypeId,
      referencedTable: $db.vehicleTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> parkingLocationsRefs<T extends Object>(
    Expression<T> Function($$ParkingLocationsTableAnnotationComposer a) f,
  ) {
    final $$ParkingLocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingLocations,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingLocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> parkingPhotosRefs<T extends Object>(
    Expression<T> Function($$ParkingPhotosTableAnnotationComposer a) f,
  ) {
    final $$ParkingPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.parkingPhotos,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> observationsRefs<T extends Object>(
    Expression<T> Function($$ObservationsTableAnnotationComposer a) f,
  ) {
    final $$ObservationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.observations,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationsTableAnnotationComposer(
            $db: $db,
            $table: $db.observations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reportsRefs<T extends Object>(
    Expression<T> Function($$ReportsTableAnnotationComposer a) f,
  ) {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.parkingSpotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParkingSpotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParkingSpotsTable,
          ParkingSpot,
          $$ParkingSpotsTableFilterComposer,
          $$ParkingSpotsTableOrderingComposer,
          $$ParkingSpotsTableAnnotationComposer,
          $$ParkingSpotsTableCreateCompanionBuilder,
          $$ParkingSpotsTableUpdateCompanionBuilder,
          (ParkingSpot, $$ParkingSpotsTableReferences),
          ParkingSpot,
          PrefetchHooks Function({
            bool userId,
            bool vehicleTypeId,
            bool parkingLocationsRefs,
            bool parkingPhotosRefs,
            bool observationsRefs,
            bool reportsRefs,
          })
        > {
  $$ParkingSpotsTableTableManager(_$AppDatabase db, $ParkingSpotsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParkingSpotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParkingSpotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParkingSpotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<int> vehicleTypeId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ParkingSpotsCompanion(
                id: id,
                name: name,
                userId: userId,
                vehicleTypeId: vehicleTypeId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> userId = const Value.absent(),
                required int vehicleTypeId,
                Value<DateTime> createdAt = const Value.absent(),
              }) => ParkingSpotsCompanion.insert(
                id: id,
                name: name,
                userId: userId,
                vehicleTypeId: vehicleTypeId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ParkingSpotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                vehicleTypeId = false,
                parkingLocationsRefs = false,
                parkingPhotosRefs = false,
                observationsRefs = false,
                reportsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (parkingLocationsRefs) db.parkingLocations,
                    if (parkingPhotosRefs) db.parkingPhotos,
                    if (observationsRefs) db.observations,
                    if (reportsRefs) db.reports,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$ParkingSpotsTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$ParkingSpotsTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (vehicleTypeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleTypeId,
                                    referencedTable:
                                        $$ParkingSpotsTableReferences
                                            ._vehicleTypeIdTable(db),
                                    referencedColumn:
                                        $$ParkingSpotsTableReferences
                                            ._vehicleTypeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (parkingLocationsRefs)
                        await $_getPrefetchedData<
                          ParkingSpot,
                          $ParkingSpotsTable,
                          ParkingLocation
                        >(
                          currentTable: table,
                          referencedTable: $$ParkingSpotsTableReferences
                              ._parkingLocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ParkingSpotsTableReferences(
                                db,
                                table,
                                p0,
                              ).parkingLocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parkingSpotId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (parkingPhotosRefs)
                        await $_getPrefetchedData<
                          ParkingSpot,
                          $ParkingSpotsTable,
                          ParkingPhoto
                        >(
                          currentTable: table,
                          referencedTable: $$ParkingSpotsTableReferences
                              ._parkingPhotosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ParkingSpotsTableReferences(
                                db,
                                table,
                                p0,
                              ).parkingPhotosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parkingSpotId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (observationsRefs)
                        await $_getPrefetchedData<
                          ParkingSpot,
                          $ParkingSpotsTable,
                          Observation
                        >(
                          currentTable: table,
                          referencedTable: $$ParkingSpotsTableReferences
                              ._observationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ParkingSpotsTableReferences(
                                db,
                                table,
                                p0,
                              ).observationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parkingSpotId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reportsRefs)
                        await $_getPrefetchedData<
                          ParkingSpot,
                          $ParkingSpotsTable,
                          Report
                        >(
                          currentTable: table,
                          referencedTable: $$ParkingSpotsTableReferences
                              ._reportsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ParkingSpotsTableReferences(
                                db,
                                table,
                                p0,
                              ).reportsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parkingSpotId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ParkingSpotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParkingSpotsTable,
      ParkingSpot,
      $$ParkingSpotsTableFilterComposer,
      $$ParkingSpotsTableOrderingComposer,
      $$ParkingSpotsTableAnnotationComposer,
      $$ParkingSpotsTableCreateCompanionBuilder,
      $$ParkingSpotsTableUpdateCompanionBuilder,
      (ParkingSpot, $$ParkingSpotsTableReferences),
      ParkingSpot,
      PrefetchHooks Function({
        bool userId,
        bool vehicleTypeId,
        bool parkingLocationsRefs,
        bool parkingPhotosRefs,
        bool observationsRefs,
        bool reportsRefs,
      })
    >;
typedef $$ParkingLocationsTableCreateCompanionBuilder =
    ParkingLocationsCompanion Function({
      Value<int> id,
      required int parkingSpotId,
      required double latitude,
      required double longitude,
      Value<String?> address,
    });
typedef $$ParkingLocationsTableUpdateCompanionBuilder =
    ParkingLocationsCompanion Function({
      Value<int> id,
      Value<int> parkingSpotId,
      Value<double> latitude,
      Value<double> longitude,
      Value<String?> address,
    });

final class $$ParkingLocationsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ParkingLocationsTable, ParkingLocation> {
  $$ParkingLocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ParkingSpotsTable _parkingSpotIdTable(_$AppDatabase db) =>
      db.parkingSpots.createAlias(
        $_aliasNameGenerator(
          db.parkingLocations.parkingSpotId,
          db.parkingSpots.id,
        ),
      );

  $$ParkingSpotsTableProcessedTableManager get parkingSpotId {
    final $_column = $_itemColumn<int>('parking_spot_id')!;

    final manager = $$ParkingSpotsTableTableManager(
      $_db,
      $_db.parkingSpots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parkingSpotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ParkingLocationsTableFilterComposer
    extends Composer<_$AppDatabase, $ParkingLocationsTable> {
  $$ParkingLocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  $$ParkingSpotsTableFilterComposer get parkingSpotId {
    final $$ParkingSpotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableFilterComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingLocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ParkingLocationsTable> {
  $$ParkingLocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  $$ParkingSpotsTableOrderingComposer get parkingSpotId {
    final $$ParkingSpotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableOrderingComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingLocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParkingLocationsTable> {
  $$ParkingLocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  $$ParkingSpotsTableAnnotationComposer get parkingSpotId {
    final $$ParkingSpotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingLocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParkingLocationsTable,
          ParkingLocation,
          $$ParkingLocationsTableFilterComposer,
          $$ParkingLocationsTableOrderingComposer,
          $$ParkingLocationsTableAnnotationComposer,
          $$ParkingLocationsTableCreateCompanionBuilder,
          $$ParkingLocationsTableUpdateCompanionBuilder,
          (ParkingLocation, $$ParkingLocationsTableReferences),
          ParkingLocation,
          PrefetchHooks Function({bool parkingSpotId})
        > {
  $$ParkingLocationsTableTableManager(
    _$AppDatabase db,
    $ParkingLocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParkingLocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParkingLocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParkingLocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> parkingSpotId = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String?> address = const Value.absent(),
              }) => ParkingLocationsCompanion(
                id: id,
                parkingSpotId: parkingSpotId,
                latitude: latitude,
                longitude: longitude,
                address: address,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int parkingSpotId,
                required double latitude,
                required double longitude,
                Value<String?> address = const Value.absent(),
              }) => ParkingLocationsCompanion.insert(
                id: id,
                parkingSpotId: parkingSpotId,
                latitude: latitude,
                longitude: longitude,
                address: address,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ParkingLocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parkingSpotId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parkingSpotId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parkingSpotId,
                                referencedTable:
                                    $$ParkingLocationsTableReferences
                                        ._parkingSpotIdTable(db),
                                referencedColumn:
                                    $$ParkingLocationsTableReferences
                                        ._parkingSpotIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ParkingLocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParkingLocationsTable,
      ParkingLocation,
      $$ParkingLocationsTableFilterComposer,
      $$ParkingLocationsTableOrderingComposer,
      $$ParkingLocationsTableAnnotationComposer,
      $$ParkingLocationsTableCreateCompanionBuilder,
      $$ParkingLocationsTableUpdateCompanionBuilder,
      (ParkingLocation, $$ParkingLocationsTableReferences),
      ParkingLocation,
      PrefetchHooks Function({bool parkingSpotId})
    >;
typedef $$ParkingPhotosTableCreateCompanionBuilder =
    ParkingPhotosCompanion Function({
      Value<int> id,
      required int parkingSpotId,
      required String photoPath,
      Value<DateTime> takenAt,
    });
typedef $$ParkingPhotosTableUpdateCompanionBuilder =
    ParkingPhotosCompanion Function({
      Value<int> id,
      Value<int> parkingSpotId,
      Value<String> photoPath,
      Value<DateTime> takenAt,
    });

final class $$ParkingPhotosTableReferences
    extends BaseReferences<_$AppDatabase, $ParkingPhotosTable, ParkingPhoto> {
  $$ParkingPhotosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ParkingSpotsTable _parkingSpotIdTable(_$AppDatabase db) =>
      db.parkingSpots.createAlias(
        $_aliasNameGenerator(
          db.parkingPhotos.parkingSpotId,
          db.parkingSpots.id,
        ),
      );

  $$ParkingSpotsTableProcessedTableManager get parkingSpotId {
    final $_column = $_itemColumn<int>('parking_spot_id')!;

    final manager = $$ParkingSpotsTableTableManager(
      $_db,
      $_db.parkingSpots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parkingSpotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ParkingPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $ParkingPhotosTable> {
  $$ParkingPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ParkingSpotsTableFilterComposer get parkingSpotId {
    final $$ParkingSpotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableFilterComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $ParkingPhotosTable> {
  $$ParkingPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ParkingSpotsTableOrderingComposer get parkingSpotId {
    final $$ParkingSpotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableOrderingComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParkingPhotosTable> {
  $$ParkingPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<DateTime> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  $$ParkingSpotsTableAnnotationComposer get parkingSpotId {
    final $$ParkingSpotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParkingPhotosTable,
          ParkingPhoto,
          $$ParkingPhotosTableFilterComposer,
          $$ParkingPhotosTableOrderingComposer,
          $$ParkingPhotosTableAnnotationComposer,
          $$ParkingPhotosTableCreateCompanionBuilder,
          $$ParkingPhotosTableUpdateCompanionBuilder,
          (ParkingPhoto, $$ParkingPhotosTableReferences),
          ParkingPhoto,
          PrefetchHooks Function({bool parkingSpotId})
        > {
  $$ParkingPhotosTableTableManager(_$AppDatabase db, $ParkingPhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParkingPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParkingPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParkingPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> parkingSpotId = const Value.absent(),
                Value<String> photoPath = const Value.absent(),
                Value<DateTime> takenAt = const Value.absent(),
              }) => ParkingPhotosCompanion(
                id: id,
                parkingSpotId: parkingSpotId,
                photoPath: photoPath,
                takenAt: takenAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int parkingSpotId,
                required String photoPath,
                Value<DateTime> takenAt = const Value.absent(),
              }) => ParkingPhotosCompanion.insert(
                id: id,
                parkingSpotId: parkingSpotId,
                photoPath: photoPath,
                takenAt: takenAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ParkingPhotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parkingSpotId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parkingSpotId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parkingSpotId,
                                referencedTable: $$ParkingPhotosTableReferences
                                    ._parkingSpotIdTable(db),
                                referencedColumn: $$ParkingPhotosTableReferences
                                    ._parkingSpotIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ParkingPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParkingPhotosTable,
      ParkingPhoto,
      $$ParkingPhotosTableFilterComposer,
      $$ParkingPhotosTableOrderingComposer,
      $$ParkingPhotosTableAnnotationComposer,
      $$ParkingPhotosTableCreateCompanionBuilder,
      $$ParkingPhotosTableUpdateCompanionBuilder,
      (ParkingPhoto, $$ParkingPhotosTableReferences),
      ParkingPhoto,
      PrefetchHooks Function({bool parkingSpotId})
    >;
typedef $$ObservationsTableCreateCompanionBuilder =
    ObservationsCompanion Function({
      Value<int> id,
      required int userId,
      required int parkingSpotId,
      required int statusId,
      required int typeId,
      Value<DateTime> observedAt,
    });
typedef $$ObservationsTableUpdateCompanionBuilder =
    ObservationsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> parkingSpotId,
      Value<int> statusId,
      Value<int> typeId,
      Value<DateTime> observedAt,
    });

final class $$ObservationsTableReferences
    extends BaseReferences<_$AppDatabase, $ObservationsTable, Observation> {
  $$ObservationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.observations.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ParkingSpotsTable _parkingSpotIdTable(_$AppDatabase db) =>
      db.parkingSpots.createAlias(
        $_aliasNameGenerator(db.observations.parkingSpotId, db.parkingSpots.id),
      );

  $$ParkingSpotsTableProcessedTableManager get parkingSpotId {
    final $_column = $_itemColumn<int>('parking_spot_id')!;

    final manager = $$ParkingSpotsTableTableManager(
      $_db,
      $_db.parkingSpots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parkingSpotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ParkingStatusTable _statusIdTable(_$AppDatabase db) =>
      db.parkingStatus.createAlias(
        $_aliasNameGenerator(db.observations.statusId, db.parkingStatus.id),
      );

  $$ParkingStatusTableProcessedTableManager get statusId {
    final $_column = $_itemColumn<int>('status_id')!;

    final manager = $$ParkingStatusTableTableManager(
      $_db,
      $_db.parkingStatus,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_statusIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ObservationTypesTable _typeIdTable(_$AppDatabase db) =>
      db.observationTypes.createAlias(
        $_aliasNameGenerator(db.observations.typeId, db.observationTypes.id),
      );

  $$ObservationTypesTableProcessedTableManager get typeId {
    final $_column = $_itemColumn<int>('type_id')!;

    final manager = $$ObservationTypesTableTableManager(
      $_db,
      $_db.observationTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ObservationsTableFilterComposer
    extends Composer<_$AppDatabase, $ObservationsTable> {
  $$ObservationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingSpotsTableFilterComposer get parkingSpotId {
    final $$ParkingSpotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableFilterComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingStatusTableFilterComposer get statusId {
    final $$ParkingStatusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statusId,
      referencedTable: $db.parkingStatus,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingStatusTableFilterComposer(
            $db: $db,
            $table: $db.parkingStatus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ObservationTypesTableFilterComposer get typeId {
    final $$ObservationTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.typeId,
      referencedTable: $db.observationTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationTypesTableFilterComposer(
            $db: $db,
            $table: $db.observationTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ObservationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ObservationsTable> {
  $$ObservationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingSpotsTableOrderingComposer get parkingSpotId {
    final $$ParkingSpotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableOrderingComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingStatusTableOrderingComposer get statusId {
    final $$ParkingStatusTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statusId,
      referencedTable: $db.parkingStatus,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingStatusTableOrderingComposer(
            $db: $db,
            $table: $db.parkingStatus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ObservationTypesTableOrderingComposer get typeId {
    final $$ObservationTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.typeId,
      referencedTable: $db.observationTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationTypesTableOrderingComposer(
            $db: $db,
            $table: $db.observationTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ObservationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ObservationsTable> {
  $$ObservationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingSpotsTableAnnotationComposer get parkingSpotId {
    final $$ParkingSpotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingStatusTableAnnotationComposer get statusId {
    final $$ParkingStatusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statusId,
      referencedTable: $db.parkingStatus,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingStatusTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingStatus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ObservationTypesTableAnnotationComposer get typeId {
    final $$ObservationTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.typeId,
      referencedTable: $db.observationTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObservationTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.observationTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ObservationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ObservationsTable,
          Observation,
          $$ObservationsTableFilterComposer,
          $$ObservationsTableOrderingComposer,
          $$ObservationsTableAnnotationComposer,
          $$ObservationsTableCreateCompanionBuilder,
          $$ObservationsTableUpdateCompanionBuilder,
          (Observation, $$ObservationsTableReferences),
          Observation,
          PrefetchHooks Function({
            bool userId,
            bool parkingSpotId,
            bool statusId,
            bool typeId,
          })
        > {
  $$ObservationsTableTableManager(_$AppDatabase db, $ObservationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObservationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObservationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObservationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> parkingSpotId = const Value.absent(),
                Value<int> statusId = const Value.absent(),
                Value<int> typeId = const Value.absent(),
                Value<DateTime> observedAt = const Value.absent(),
              }) => ObservationsCompanion(
                id: id,
                userId: userId,
                parkingSpotId: parkingSpotId,
                statusId: statusId,
                typeId: typeId,
                observedAt: observedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int parkingSpotId,
                required int statusId,
                required int typeId,
                Value<DateTime> observedAt = const Value.absent(),
              }) => ObservationsCompanion.insert(
                id: id,
                userId: userId,
                parkingSpotId: parkingSpotId,
                statusId: statusId,
                typeId: typeId,
                observedAt: observedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ObservationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                parkingSpotId = false,
                statusId = false,
                typeId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$ObservationsTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$ObservationsTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (parkingSpotId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.parkingSpotId,
                                    referencedTable:
                                        $$ObservationsTableReferences
                                            ._parkingSpotIdTable(db),
                                    referencedColumn:
                                        $$ObservationsTableReferences
                                            ._parkingSpotIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (statusId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.statusId,
                                    referencedTable:
                                        $$ObservationsTableReferences
                                            ._statusIdTable(db),
                                    referencedColumn:
                                        $$ObservationsTableReferences
                                            ._statusIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (typeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.typeId,
                                    referencedTable:
                                        $$ObservationsTableReferences
                                            ._typeIdTable(db),
                                    referencedColumn:
                                        $$ObservationsTableReferences
                                            ._typeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ObservationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ObservationsTable,
      Observation,
      $$ObservationsTableFilterComposer,
      $$ObservationsTableOrderingComposer,
      $$ObservationsTableAnnotationComposer,
      $$ObservationsTableCreateCompanionBuilder,
      $$ObservationsTableUpdateCompanionBuilder,
      (Observation, $$ObservationsTableReferences),
      Observation,
      PrefetchHooks Function({
        bool userId,
        bool parkingSpotId,
        bool statusId,
        bool typeId,
      })
    >;
typedef $$ReportsTableCreateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      required int userId,
      required int parkingSpotId,
      required String description,
      Value<DateTime> reportedAt,
    });
typedef $$ReportsTableUpdateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> parkingSpotId,
      Value<String> description,
      Value<DateTime> reportedAt,
    });

final class $$ReportsTableReferences
    extends BaseReferences<_$AppDatabase, $ReportsTable, Report> {
  $$ReportsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.reports.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ParkingSpotsTable _parkingSpotIdTable(_$AppDatabase db) =>
      db.parkingSpots.createAlias(
        $_aliasNameGenerator(db.reports.parkingSpotId, db.parkingSpots.id),
      );

  $$ParkingSpotsTableProcessedTableManager get parkingSpotId {
    final $_column = $_itemColumn<int>('parking_spot_id')!;

    final manager = $$ParkingSpotsTableTableManager(
      $_db,
      $_db.parkingSpots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parkingSpotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReportsTableFilterComposer
    extends Composer<_$AppDatabase, $ReportsTable> {
  $$ReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reportedAt => $composableBuilder(
    column: $table.reportedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingSpotsTableFilterComposer get parkingSpotId {
    final $$ParkingSpotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableFilterComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReportsTable> {
  $$ReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reportedAt => $composableBuilder(
    column: $table.reportedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingSpotsTableOrderingComposer get parkingSpotId {
    final $$ParkingSpotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableOrderingComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReportsTable> {
  $$ReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get reportedAt => $composableBuilder(
    column: $table.reportedAt,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParkingSpotsTableAnnotationComposer get parkingSpotId {
    final $$ParkingSpotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parkingSpotId,
      referencedTable: $db.parkingSpots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParkingSpotsTableAnnotationComposer(
            $db: $db,
            $table: $db.parkingSpots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReportsTable,
          Report,
          $$ReportsTableFilterComposer,
          $$ReportsTableOrderingComposer,
          $$ReportsTableAnnotationComposer,
          $$ReportsTableCreateCompanionBuilder,
          $$ReportsTableUpdateCompanionBuilder,
          (Report, $$ReportsTableReferences),
          Report,
          PrefetchHooks Function({bool userId, bool parkingSpotId})
        > {
  $$ReportsTableTableManager(_$AppDatabase db, $ReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> parkingSpotId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> reportedAt = const Value.absent(),
              }) => ReportsCompanion(
                id: id,
                userId: userId,
                parkingSpotId: parkingSpotId,
                description: description,
                reportedAt: reportedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int parkingSpotId,
                required String description,
                Value<DateTime> reportedAt = const Value.absent(),
              }) => ReportsCompanion.insert(
                id: id,
                userId: userId,
                parkingSpotId: parkingSpotId,
                description: description,
                reportedAt: reportedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReportsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, parkingSpotId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ReportsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ReportsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (parkingSpotId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parkingSpotId,
                                referencedTable: $$ReportsTableReferences
                                    ._parkingSpotIdTable(db),
                                referencedColumn: $$ReportsTableReferences
                                    ._parkingSpotIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReportsTable,
      Report,
      $$ReportsTableFilterComposer,
      $$ReportsTableOrderingComposer,
      $$ReportsTableAnnotationComposer,
      $$ReportsTableCreateCompanionBuilder,
      $$ReportsTableUpdateCompanionBuilder,
      (Report, $$ReportsTableReferences),
      Report,
      PrefetchHooks Function({bool userId, bool parkingSpotId})
    >;
typedef $$NotificationsTableCreateCompanionBuilder =
    NotificationsCompanion Function({
      Value<int> id,
      required int userId,
      required String title,
      required String body,
      Value<bool> isRead,
    });
typedef $$NotificationsTableUpdateCompanionBuilder =
    NotificationsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> title,
      Value<String> body,
      Value<bool> isRead,
    });

final class $$NotificationsTableReferences
    extends BaseReferences<_$AppDatabase, $NotificationsTable, Notification> {
  $$NotificationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.notifications.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationsTable,
          Notification,
          $$NotificationsTableFilterComposer,
          $$NotificationsTableOrderingComposer,
          $$NotificationsTableAnnotationComposer,
          $$NotificationsTableCreateCompanionBuilder,
          $$NotificationsTableUpdateCompanionBuilder,
          (Notification, $$NotificationsTableReferences),
          Notification,
          PrefetchHooks Function({bool userId})
        > {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
              }) => NotificationsCompanion(
                id: id,
                userId: userId,
                title: title,
                body: body,
                isRead: isRead,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String title,
                required String body,
                Value<bool> isRead = const Value.absent(),
              }) => NotificationsCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                body: body,
                isRead: isRead,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$NotificationsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$NotificationsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationsTable,
      Notification,
      $$NotificationsTableFilterComposer,
      $$NotificationsTableOrderingComposer,
      $$NotificationsTableAnnotationComposer,
      $$NotificationsTableCreateCompanionBuilder,
      $$NotificationsTableUpdateCompanionBuilder,
      (Notification, $$NotificationsTableReferences),
      Notification,
      PrefetchHooks Function({bool userId})
    >;
typedef $$ParkingSessionsTableCreateCompanionBuilder =
    ParkingSessionsCompanion Function({
      Value<int> id,
      required int userId,
      required DateTime entryTime,
      Value<DateTime?> exitTime,
      Value<double?> fee,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> photoPath,
      Value<String?> locationNote,
      Value<bool> isActive,
    });
typedef $$ParkingSessionsTableUpdateCompanionBuilder =
    ParkingSessionsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<DateTime> entryTime,
      Value<DateTime?> exitTime,
      Value<double?> fee,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> photoPath,
      Value<String?> locationNote,
      Value<bool> isActive,
    });

final class $$ParkingSessionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ParkingSessionsTable, ParkingSession> {
  $$ParkingSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.parkingSessions.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ParkingSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $ParkingSessionsTable> {
  $$ParkingSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get entryTime => $composableBuilder(
    column: $table.entryTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get exitTime => $composableBuilder(
    column: $table.exitTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationNote => $composableBuilder(
    column: $table.locationNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ParkingSessionsTable> {
  $$ParkingSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get entryTime => $composableBuilder(
    column: $table.entryTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get exitTime => $composableBuilder(
    column: $table.exitTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationNote => $composableBuilder(
    column: $table.locationNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParkingSessionsTable> {
  $$ParkingSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get entryTime =>
      $composableBuilder(column: $table.entryTime, builder: (column) => column);

  GeneratedColumn<DateTime> get exitTime =>
      $composableBuilder(column: $table.exitTime, builder: (column) => column);

  GeneratedColumn<double> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get locationNote => $composableBuilder(
    column: $table.locationNote,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParkingSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParkingSessionsTable,
          ParkingSession,
          $$ParkingSessionsTableFilterComposer,
          $$ParkingSessionsTableOrderingComposer,
          $$ParkingSessionsTableAnnotationComposer,
          $$ParkingSessionsTableCreateCompanionBuilder,
          $$ParkingSessionsTableUpdateCompanionBuilder,
          (ParkingSession, $$ParkingSessionsTableReferences),
          ParkingSession,
          PrefetchHooks Function({bool userId})
        > {
  $$ParkingSessionsTableTableManager(
    _$AppDatabase db,
    $ParkingSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParkingSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParkingSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParkingSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<DateTime> entryTime = const Value.absent(),
                Value<DateTime?> exitTime = const Value.absent(),
                Value<double?> fee = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> locationNote = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ParkingSessionsCompanion(
                id: id,
                userId: userId,
                entryTime: entryTime,
                exitTime: exitTime,
                fee: fee,
                latitude: latitude,
                longitude: longitude,
                photoPath: photoPath,
                locationNote: locationNote,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required DateTime entryTime,
                Value<DateTime?> exitTime = const Value.absent(),
                Value<double?> fee = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> locationNote = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => ParkingSessionsCompanion.insert(
                id: id,
                userId: userId,
                entryTime: entryTime,
                exitTime: exitTime,
                fee: fee,
                latitude: latitude,
                longitude: longitude,
                photoPath: photoPath,
                locationNote: locationNote,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ParkingSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$ParkingSessionsTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$ParkingSessionsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ParkingSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParkingSessionsTable,
      ParkingSession,
      $$ParkingSessionsTableFilterComposer,
      $$ParkingSessionsTableOrderingComposer,
      $$ParkingSessionsTableAnnotationComposer,
      $$ParkingSessionsTableCreateCompanionBuilder,
      $$ParkingSessionsTableUpdateCompanionBuilder,
      (ParkingSession, $$ParkingSessionsTableReferences),
      ParkingSession,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$VehicleTypesTableTableManager get vehicleTypes =>
      $$VehicleTypesTableTableManager(_db, _db.vehicleTypes);
  $$ParkingStatusTableTableManager get parkingStatus =>
      $$ParkingStatusTableTableManager(_db, _db.parkingStatus);
  $$ObservationTypesTableTableManager get observationTypes =>
      $$ObservationTypesTableTableManager(_db, _db.observationTypes);
  $$ParkingSpotsTableTableManager get parkingSpots =>
      $$ParkingSpotsTableTableManager(_db, _db.parkingSpots);
  $$ParkingLocationsTableTableManager get parkingLocations =>
      $$ParkingLocationsTableTableManager(_db, _db.parkingLocations);
  $$ParkingPhotosTableTableManager get parkingPhotos =>
      $$ParkingPhotosTableTableManager(_db, _db.parkingPhotos);
  $$ObservationsTableTableManager get observations =>
      $$ObservationsTableTableManager(_db, _db.observations);
  $$ReportsTableTableManager get reports =>
      $$ReportsTableTableManager(_db, _db.reports);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$ParkingSessionsTableTableManager get parkingSessions =>
      $$ParkingSessionsTableTableManager(_db, _db.parkingSessions);
}
