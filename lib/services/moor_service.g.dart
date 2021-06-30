// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_service.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NoteData extends DataClass implements Insertable<NoteData> {
  final int id;
  final String title;
  final String body;
  final int? category;
  NoteData(
      {required this.id,
      required this.title,
      required this.body,
      this.category});
  factory NoteData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NoteData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int?>(category);
    }
    return map;
  }

  NoteCompanion toCompanion(bool nullToAbsent) {
    return NoteCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory NoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NoteData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      category: serializer.fromJson<int?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'category': serializer.toJson<int?>(category),
    };
  }

  NoteData copyWith({int? id, String? title, String? body, int? category}) =>
      NoteData(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(body.hashCode, category.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.category == this.category);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> body;
  final Value<int?> category;
  const NoteCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.category = const Value.absent(),
  });
  NoteCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String body,
    this.category = const Value.absent(),
  })  : title = Value(title),
        body = Value(body);
  static Insertable<NoteData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int?>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (category != null) 'category': category,
    });
  }

  NoteCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? body,
      Value<int?>? category}) {
    return NoteCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (category.present) {
      map['category'] = Variable<int?>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $NoteTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedTextColumn body = _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedIntColumn category = _constructCategory();
  GeneratedIntColumn _constructCategory() {
    return GeneratedIntColumn(
      'category',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, body, category];
  @override
  $NoteTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'note';
  @override
  final String actualTableName = 'note';
  @override
  VerificationContext validateIntegrity(Insertable<NoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NoteData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(_db, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String name;
  final int icon;
  final int color;
  CategoryData(
      {required this.id,
      required this.name,
      required this.icon,
      required this.color});
  factory CategoryData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      icon: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}icon'])!,
      color: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<int>(icon);
    map['color'] = Variable<int>(color);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      color: Value(color),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<int>(json['icon']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<int>(icon),
      'color': serializer.toJson<int>(color),
    };
  }

  CategoryData copyWith({int? id, String? name, int? icon, int? color}) =>
      CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(name.hashCode, $mrjc(icon.hashCode, color.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.color == this.color);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> icon;
  final Value<int> color;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int icon,
    required int color,
  })  : name = Value(name),
        icon = Value(icon),
        color = Value(color);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? icon,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
    });
  }

  CategoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? icon,
      Value<int>? color}) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
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
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoryTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedIntColumn icon = _constructIcon();
  GeneratedIntColumn _constructIcon() {
    return GeneratedIntColumn(
      'icon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedIntColumn color = _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, icon, color];
  @override
  $CategoryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'category';
  @override
  final String actualTableName = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(_db, alias);
  }
}

class PhotoData extends DataClass implements Insertable<PhotoData> {
  final int id;
  final String path;
  PhotoData({required this.id, required this.path});
  factory PhotoData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PhotoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      path: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}path'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['path'] = Variable<String>(path);
    return map;
  }

  PhotoCompanion toCompanion(bool nullToAbsent) {
    return PhotoCompanion(
      id: Value(id),
      path: Value(path),
    );
  }

  factory PhotoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PhotoData(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String>(path),
    };
  }

  PhotoData copyWith({int? id, String? path}) => PhotoData(
        id: id ?? this.id,
        path: path ?? this.path,
      );
  @override
  String toString() {
    return (StringBuffer('PhotoData(')
          ..write('id: $id, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, path.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoData && other.id == this.id && other.path == this.path);
}

class PhotoCompanion extends UpdateCompanion<PhotoData> {
  final Value<int> id;
  final Value<String> path;
  const PhotoCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
  });
  PhotoCompanion.insert({
    this.id = const Value.absent(),
    required String path,
  }) : path = Value(path);
  static Insertable<PhotoData> custom({
    Expression<int>? id,
    Expression<String>? path,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
    });
  }

  PhotoCompanion copyWith({Value<int>? id, Value<String>? path}) {
    return PhotoCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoCompanion(')
          ..write('id: $id, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }
}

class $PhotoTable extends Photo with TableInfo<$PhotoTable, PhotoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PhotoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedTextColumn path = _constructPath();
  GeneratedTextColumn _constructPath() {
    return GeneratedTextColumn(
      'path',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, path];
  @override
  $PhotoTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'photo';
  @override
  final String actualTableName = 'photo';
  @override
  VerificationContext validateIntegrity(Insertable<PhotoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PhotoData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PhotoTable createAlias(String alias) {
    return $PhotoTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NoteTable note = $NoteTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $PhotoTable photo = $PhotoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [note, category, photo];
}
