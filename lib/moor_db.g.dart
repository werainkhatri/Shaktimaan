// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TableProfile extends DataClass implements Insertable<TableProfile> {
  final int id;
  final String name;
  final String category1;
  final String category2;
  final String category3;
  final String feedUrl;
  final String lat;
  final String longi;
  final String address;
  final String place;
  final String district;
  final String state;
  final String country;
  final String caption;
  final String time;
  TableProfile(
      {@required this.id,
      @required this.name,
      @required this.category1,
      @required this.category2,
      @required this.category3,
      @required this.feedUrl,
      @required this.lat,
      @required this.longi,
      @required this.address,
      @required this.place,
      @required this.district,
      @required this.state,
      @required this.country,
      @required this.caption,
      @required this.time});
  factory TableProfile.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TableProfile(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      category1: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category1']),
      category2: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category2']),
      category3: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category3']),
      feedUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}feed_url']),
      lat: stringType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      longi:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}longi']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      place:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}place']),
      district: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}district']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      caption:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}caption']),
      time: stringType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
    );
  }
  factory TableProfile.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TableProfile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category1: serializer.fromJson<String>(json['category1']),
      category2: serializer.fromJson<String>(json['category2']),
      category3: serializer.fromJson<String>(json['category3']),
      feedUrl: serializer.fromJson<String>(json['feedUrl']),
      lat: serializer.fromJson<String>(json['lat']),
      longi: serializer.fromJson<String>(json['longi']),
      address: serializer.fromJson<String>(json['address']),
      place: serializer.fromJson<String>(json['place']),
      district: serializer.fromJson<String>(json['district']),
      state: serializer.fromJson<String>(json['state']),
      country: serializer.fromJson<String>(json['country']),
      caption: serializer.fromJson<String>(json['caption']),
      time: serializer.fromJson<String>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category1': serializer.toJson<String>(category1),
      'category2': serializer.toJson<String>(category2),
      'category3': serializer.toJson<String>(category3),
      'feedUrl': serializer.toJson<String>(feedUrl),
      'lat': serializer.toJson<String>(lat),
      'longi': serializer.toJson<String>(longi),
      'address': serializer.toJson<String>(address),
      'place': serializer.toJson<String>(place),
      'district': serializer.toJson<String>(district),
      'state': serializer.toJson<String>(state),
      'country': serializer.toJson<String>(country),
      'caption': serializer.toJson<String>(caption),
      'time': serializer.toJson<String>(time),
    };
  }

  @override
  TableProfilesCompanion createCompanion(bool nullToAbsent) {
    return TableProfilesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      category1: category1 == null && nullToAbsent
          ? const Value.absent()
          : Value(category1),
      category2: category2 == null && nullToAbsent
          ? const Value.absent()
          : Value(category2),
      category3: category3 == null && nullToAbsent
          ? const Value.absent()
          : Value(category3),
      feedUrl: feedUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(feedUrl),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      longi:
          longi == null && nullToAbsent ? const Value.absent() : Value(longi),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      caption: caption == null && nullToAbsent
          ? const Value.absent()
          : Value(caption),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
    );
  }

  TableProfile copyWith(
          {int id,
          String name,
          String category1,
          String category2,
          String category3,
          String feedUrl,
          String lat,
          String longi,
          String address,
          String place,
          String district,
          String state,
          String country,
          String caption,
          String time}) =>
      TableProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        category1: category1 ?? this.category1,
        category2: category2 ?? this.category2,
        category3: category3 ?? this.category3,
        feedUrl: feedUrl ?? this.feedUrl,
        lat: lat ?? this.lat,
        longi: longi ?? this.longi,
        address: address ?? this.address,
        place: place ?? this.place,
        district: district ?? this.district,
        state: state ?? this.state,
        country: country ?? this.country,
        caption: caption ?? this.caption,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('TableProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category1: $category1, ')
          ..write('category2: $category2, ')
          ..write('category3: $category3, ')
          ..write('feedUrl: $feedUrl, ')
          ..write('lat: $lat, ')
          ..write('longi: $longi, ')
          ..write('address: $address, ')
          ..write('place: $place, ')
          ..write('district: $district, ')
          ..write('state: $state, ')
          ..write('country: $country, ')
          ..write('caption: $caption, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              category1.hashCode,
              $mrjc(
                  category2.hashCode,
                  $mrjc(
                      category3.hashCode,
                      $mrjc(
                          feedUrl.hashCode,
                          $mrjc(
                              lat.hashCode,
                              $mrjc(
                                  longi.hashCode,
                                  $mrjc(
                                      address.hashCode,
                                      $mrjc(
                                          place.hashCode,
                                          $mrjc(
                                              district.hashCode,
                                              $mrjc(
                                                  state.hashCode,
                                                  $mrjc(
                                                      country.hashCode,
                                                      $mrjc(caption.hashCode,
                                                          time.hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TableProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.category1 == this.category1 &&
          other.category2 == this.category2 &&
          other.category3 == this.category3 &&
          other.feedUrl == this.feedUrl &&
          other.lat == this.lat &&
          other.longi == this.longi &&
          other.address == this.address &&
          other.place == this.place &&
          other.district == this.district &&
          other.state == this.state &&
          other.country == this.country &&
          other.caption == this.caption &&
          other.time == this.time);
}

class TableProfilesCompanion extends UpdateCompanion<TableProfile> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category1;
  final Value<String> category2;
  final Value<String> category3;
  final Value<String> feedUrl;
  final Value<String> lat;
  final Value<String> longi;
  final Value<String> address;
  final Value<String> place;
  final Value<String> district;
  final Value<String> state;
  final Value<String> country;
  final Value<String> caption;
  final Value<String> time;
  const TableProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category1 = const Value.absent(),
    this.category2 = const Value.absent(),
    this.category3 = const Value.absent(),
    this.feedUrl = const Value.absent(),
    this.lat = const Value.absent(),
    this.longi = const Value.absent(),
    this.address = const Value.absent(),
    this.place = const Value.absent(),
    this.district = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
    this.caption = const Value.absent(),
    this.time = const Value.absent(),
  });
  TableProfilesCompanion.insert({
    @required int id,
    @required String name,
    @required String category1,
    @required String category2,
    @required String category3,
    @required String feedUrl,
    @required String lat,
    @required String longi,
    @required String address,
    @required String place,
    @required String district,
    @required String state,
    @required String country,
    @required String caption,
    @required String time,
  })  : id = Value(id),
        name = Value(name),
        category1 = Value(category1),
        category2 = Value(category2),
        category3 = Value(category3),
        feedUrl = Value(feedUrl),
        lat = Value(lat),
        longi = Value(longi),
        address = Value(address),
        place = Value(place),
        district = Value(district),
        state = Value(state),
        country = Value(country),
        caption = Value(caption),
        time = Value(time);
  TableProfilesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> category1,
      Value<String> category2,
      Value<String> category3,
      Value<String> feedUrl,
      Value<String> lat,
      Value<String> longi,
      Value<String> address,
      Value<String> place,
      Value<String> district,
      Value<String> state,
      Value<String> country,
      Value<String> caption,
      Value<String> time}) {
    return TableProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category1: category1 ?? this.category1,
      category2: category2 ?? this.category2,
      category3: category3 ?? this.category3,
      feedUrl: feedUrl ?? this.feedUrl,
      lat: lat ?? this.lat,
      longi: longi ?? this.longi,
      address: address ?? this.address,
      place: place ?? this.place,
      district: district ?? this.district,
      state: state ?? this.state,
      country: country ?? this.country,
      caption: caption ?? this.caption,
      time: time ?? this.time,
    );
  }
}

class $TableProfilesTable extends TableProfiles
    with TableInfo<$TableProfilesTable, TableProfile> {
  final GeneratedDatabase _db;
  final String _alias;
  $TableProfilesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _category1Meta = const VerificationMeta('category1');
  GeneratedTextColumn _category1;
  @override
  GeneratedTextColumn get category1 => _category1 ??= _constructCategory1();
  GeneratedTextColumn _constructCategory1() {
    return GeneratedTextColumn(
      'category1',
      $tableName,
      false,
    );
  }

  final VerificationMeta _category2Meta = const VerificationMeta('category2');
  GeneratedTextColumn _category2;
  @override
  GeneratedTextColumn get category2 => _category2 ??= _constructCategory2();
  GeneratedTextColumn _constructCategory2() {
    return GeneratedTextColumn(
      'category2',
      $tableName,
      false,
    );
  }

  final VerificationMeta _category3Meta = const VerificationMeta('category3');
  GeneratedTextColumn _category3;
  @override
  GeneratedTextColumn get category3 => _category3 ??= _constructCategory3();
  GeneratedTextColumn _constructCategory3() {
    return GeneratedTextColumn(
      'category3',
      $tableName,
      false,
    );
  }

  final VerificationMeta _feedUrlMeta = const VerificationMeta('feedUrl');
  GeneratedTextColumn _feedUrl;
  @override
  GeneratedTextColumn get feedUrl => _feedUrl ??= _constructFeedUrl();
  GeneratedTextColumn _constructFeedUrl() {
    return GeneratedTextColumn(
      'feed_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedTextColumn _lat;
  @override
  GeneratedTextColumn get lat => _lat ??= _constructLat();
  GeneratedTextColumn _constructLat() {
    return GeneratedTextColumn(
      'lat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _longiMeta = const VerificationMeta('longi');
  GeneratedTextColumn _longi;
  @override
  GeneratedTextColumn get longi => _longi ??= _constructLongi();
  GeneratedTextColumn _constructLongi() {
    return GeneratedTextColumn(
      'longi',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _placeMeta = const VerificationMeta('place');
  GeneratedTextColumn _place;
  @override
  GeneratedTextColumn get place => _place ??= _constructPlace();
  GeneratedTextColumn _constructPlace() {
    return GeneratedTextColumn(
      'place',
      $tableName,
      false,
    );
  }

  final VerificationMeta _districtMeta = const VerificationMeta('district');
  GeneratedTextColumn _district;
  @override
  GeneratedTextColumn get district => _district ??= _constructDistrict();
  GeneratedTextColumn _constructDistrict() {
    return GeneratedTextColumn(
      'district',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn(
      'state',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      false,
    );
  }

  final VerificationMeta _captionMeta = const VerificationMeta('caption');
  GeneratedTextColumn _caption;
  @override
  GeneratedTextColumn get caption => _caption ??= _constructCaption();
  GeneratedTextColumn _constructCaption() {
    return GeneratedTextColumn(
      'caption',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedTextColumn _time;
  @override
  GeneratedTextColumn get time => _time ??= _constructTime();
  GeneratedTextColumn _constructTime() {
    return GeneratedTextColumn(
      'time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        category1,
        category2,
        category3,
        feedUrl,
        lat,
        longi,
        address,
        place,
        district,
        state,
        country,
        caption,
        time
      ];
  @override
  $TableProfilesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'table_profiles';
  @override
  final String actualTableName = 'table_profiles';
  @override
  VerificationContext validateIntegrity(TableProfilesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.category1.present) {
      context.handle(_category1Meta,
          category1.isAcceptableValue(d.category1.value, _category1Meta));
    } else if (category1.isRequired && isInserting) {
      context.missing(_category1Meta);
    }
    if (d.category2.present) {
      context.handle(_category2Meta,
          category2.isAcceptableValue(d.category2.value, _category2Meta));
    } else if (category2.isRequired && isInserting) {
      context.missing(_category2Meta);
    }
    if (d.category3.present) {
      context.handle(_category3Meta,
          category3.isAcceptableValue(d.category3.value, _category3Meta));
    } else if (category3.isRequired && isInserting) {
      context.missing(_category3Meta);
    }
    if (d.feedUrl.present) {
      context.handle(_feedUrlMeta,
          feedUrl.isAcceptableValue(d.feedUrl.value, _feedUrlMeta));
    } else if (feedUrl.isRequired && isInserting) {
      context.missing(_feedUrlMeta);
    }
    if (d.lat.present) {
      context.handle(_latMeta, lat.isAcceptableValue(d.lat.value, _latMeta));
    } else if (lat.isRequired && isInserting) {
      context.missing(_latMeta);
    }
    if (d.longi.present) {
      context.handle(
          _longiMeta, longi.isAcceptableValue(d.longi.value, _longiMeta));
    } else if (longi.isRequired && isInserting) {
      context.missing(_longiMeta);
    }
    if (d.address.present) {
      context.handle(_addressMeta,
          address.isAcceptableValue(d.address.value, _addressMeta));
    } else if (address.isRequired && isInserting) {
      context.missing(_addressMeta);
    }
    if (d.place.present) {
      context.handle(
          _placeMeta, place.isAcceptableValue(d.place.value, _placeMeta));
    } else if (place.isRequired && isInserting) {
      context.missing(_placeMeta);
    }
    if (d.district.present) {
      context.handle(_districtMeta,
          district.isAcceptableValue(d.district.value, _districtMeta));
    } else if (district.isRequired && isInserting) {
      context.missing(_districtMeta);
    }
    if (d.state.present) {
      context.handle(
          _stateMeta, state.isAcceptableValue(d.state.value, _stateMeta));
    } else if (state.isRequired && isInserting) {
      context.missing(_stateMeta);
    }
    if (d.country.present) {
      context.handle(_countryMeta,
          country.isAcceptableValue(d.country.value, _countryMeta));
    } else if (country.isRequired && isInserting) {
      context.missing(_countryMeta);
    }
    if (d.caption.present) {
      context.handle(_captionMeta,
          caption.isAcceptableValue(d.caption.value, _captionMeta));
    } else if (caption.isRequired && isInserting) {
      context.missing(_captionMeta);
    }
    if (d.time.present) {
      context.handle(
          _timeMeta, time.isAcceptableValue(d.time.value, _timeMeta));
    } else if (time.isRequired && isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TableProfile map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TableProfile.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TableProfilesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.category1.present) {
      map['category1'] = Variable<String, StringType>(d.category1.value);
    }
    if (d.category2.present) {
      map['category2'] = Variable<String, StringType>(d.category2.value);
    }
    if (d.category3.present) {
      map['category3'] = Variable<String, StringType>(d.category3.value);
    }
    if (d.feedUrl.present) {
      map['feed_url'] = Variable<String, StringType>(d.feedUrl.value);
    }
    if (d.lat.present) {
      map['lat'] = Variable<String, StringType>(d.lat.value);
    }
    if (d.longi.present) {
      map['longi'] = Variable<String, StringType>(d.longi.value);
    }
    if (d.address.present) {
      map['address'] = Variable<String, StringType>(d.address.value);
    }
    if (d.place.present) {
      map['place'] = Variable<String, StringType>(d.place.value);
    }
    if (d.district.present) {
      map['district'] = Variable<String, StringType>(d.district.value);
    }
    if (d.state.present) {
      map['state'] = Variable<String, StringType>(d.state.value);
    }
    if (d.country.present) {
      map['country'] = Variable<String, StringType>(d.country.value);
    }
    if (d.caption.present) {
      map['caption'] = Variable<String, StringType>(d.caption.value);
    }
    if (d.time.present) {
      map['time'] = Variable<String, StringType>(d.time.value);
    }
    return map;
  }

  @override
  $TableProfilesTable createAlias(String alias) {
    return $TableProfilesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TableProfilesTable _tableProfiles;
  $TableProfilesTable get tableProfiles =>
      _tableProfiles ??= $TableProfilesTable(this);
  @override
  List<TableInfo> get allTables => [tableProfiles];
}
