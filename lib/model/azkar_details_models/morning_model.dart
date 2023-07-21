// class AzkarModel {
//   String? zekr;
//   int? repeat;
//   String? bless;
//
//   AzkarModel({this.zekr, this.repeat, this.bless});
//
//   AzkarModel.fromJson(Map<String, dynamic> json) {
//     zekr = json['zekr'];
//     repeat = json['repeat'];
//     bless = json['bless'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['zekr'] = this.zekr;
//     data['repeat'] = this.repeat;
//     data['bless'] = this.bless;
//     return data;
//   }
// }





// class AzkarModel {
//   String? title;
//   List<Content>? content;
//
//   AzkarModel({this.title, this.content});
//
//   AzkarModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     if (json['content'] != null) {
//       content = <Content>[];
//       json['content'].forEach((v) {
//         content!.add(new Content.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     if (this.content != null) {
//       data['content'] = this.content!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Content {
//   String? zekr;
//   int? repeat;
//   String? bless;
//
//   Content({this.zekr, this.repeat, this.bless});
//
//   Content.fromJson(Map<String, dynamic> json) {
//     zekr = json['zekr'];
//     repeat = json['repeat'];
//     bless = json['bless'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['zekr'] = this.zekr;
//     data['repeat'] = this.repeat;
//     data['bless'] = this.bless;
//     return data;
//   }
// }

// class AzkarModel{
//   String? zekr;
//   int? repeat;
//   String? Bless;
//
//   AzkarModel({
//    required this.zekr,
//    required this.repeat,
//    required this.Bless,
//   });
// }

class AzkarModel {
  String? title;
  List<Content>? content;

  AzkarModel({this.title, this.content});

  AzkarModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? zekr;
  int? repeat;
  String? bless;

  Content({this.zekr, this.repeat, this.bless});

  Content.fromJson(Map<String, dynamic> json) {
    zekr = json['zekr'];
    repeat = json['repeat'];
    bless = json['bless'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zekr'] = this.zekr;
    data['repeat'] = this.repeat;
    data['bless'] = this.bless;
    return data;
  }
}