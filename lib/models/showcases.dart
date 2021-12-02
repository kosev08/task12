class ShowcaseList {
  List<Showcase> showcases;
  ShowcaseList({required this.showcases});

  factory ShowcaseList.fromJson(Map<String, dynamic> json) {
    var showcaseJson = json['data'] as List;
    List<Showcase> showcaseList = showcaseJson.map((e) => Showcase.fromJson(e)).toList();
    return ShowcaseList(
      showcases: showcaseList,
    );
  }
}

class Showcase {
  final int id;
  final String name;
  final String address;
  final String latitude;
  final String longitude;

  Showcase({required this.id, required this.name, required this.address, required this.latitude, required this.longitude});
  factory Showcase.fromJson(Map<String, dynamic> json) {
    return Showcase(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}