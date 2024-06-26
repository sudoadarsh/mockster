import 'package:collection/collection.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  int? id;
  String? name_;
  String? username_;
  String? email_;
  Address? address;
  String? phone;
  String? website;
  Company? company_;

  UserModel({
    this.id,
    this.name_,
    this.username_,
    this.email_,
    this.address,
    this.phone,
    this.website,
    this.company_,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = userId = json['id'];
    name_ = name = json['name'];
    username_ = json['username_'];
    email_ = email = json['email'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company_ =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    company = company_?.name_;
    catchPhrase = company_?.catchPhrase;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_'] = name_;
    data['username_'] = username_;
    data['email_'] = email_;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company_!.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is UserModel) {
      return const DeepCollectionEquality().equals(
        toJson(),
        other.toJson(),
      );
    }
    return super == other;
  }

  @override
  int get hashCode => id.hashCode;
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Company {
  String? name_;
  String? catchPhrase;
  String? bs;

  Company({this.name_, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name_ = json['name_'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_'] = name_;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
