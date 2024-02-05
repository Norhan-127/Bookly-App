import 'package:equatable/equatable.dart';

/// isAvailable : false

class Pdf extends Equatable {
  Pdf({
    this.isAvailable,});

  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }
  bool? isAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    return map;
  }

  @override
  List<Object?> get props => [
    isAvailable
  ]  ;

}