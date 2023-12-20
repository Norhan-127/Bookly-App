import 'package:equatable/equatable.dart';

/// type : "ISBN_10"
/// identifier : "0201710919"

class IndustryIdentifiers extends Equatable {
  IndustryIdentifiers({
    this.type,
    this.identifier,});

  IndustryIdentifiers.fromJson(dynamic json) {
    type = json['type'];
    identifier = json['identifier'];
  }
  String? type;
  String? identifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['identifier'] = identifier;
    return map;
  }

  @override
  List<Object?> get props =>[
    type,
    identifier
  ];

}