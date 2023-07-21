import 'dart:convert';

class MorningModel {
  final String zekr;
  final int repeat;
  final String bless;

  const MorningModel({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  factory MorningModel.fromJson(Map<String, dynamic> json) {
    return MorningModel(
      zekr: json['zekr'],
      repeat: json['repeat'],
      bless: json['bless'],
    );
  }
}
