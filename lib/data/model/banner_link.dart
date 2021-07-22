class BannerLinkData {
    List<BannerLink> data;

    BannerLinkData({this.data});

    factory BannerLinkData.fromJson(Map<String, dynamic> json) {
        return BannerLinkData(
            data: json['data'] != null ? (json['data'] as List).map((i) => BannerLink.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class BannerLink {
    String image;
    String url;
    int index;

    BannerLink({this.image, this.url,this.index});

    factory BannerLink.fromJson(Map<String, dynamic> json) {
        return BannerLink(
            image: json['image'],
            url: json['url'],
            index: json['index']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['image'] = this.image;
        data['url'] = this.url;
        return data;
    }
}