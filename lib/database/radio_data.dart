

class RadioStation {
  final String name ;
  final String logo;
  String category = "N/A";
  final String url;

  RadioStation({this.name, this.logo, this.category, this.url});

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return new RadioStation(
      name: json['name'] as String,
      logo: json['logo'] as String,
      category: json['category'] as String,
      url: json['url'] as String,
    );
  }

}