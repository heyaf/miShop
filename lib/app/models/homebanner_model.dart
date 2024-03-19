class Homebanner {
  List<homeBannerItem>? res;

  Homebanner({this.res});

  Homebanner.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      res = <homeBannerItem>[];
      json['result'].forEach((v) {
        res?.add(homeBannerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (res != null) {
      data['result'] = res?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class homeBannerItem {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;
  int? position;

  homeBannerItem(
      {this.sId, this.title, this.status, this.pic, this.url, this.position});

  homeBannerItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    data['position'] = position;
    return data;
  }
}
