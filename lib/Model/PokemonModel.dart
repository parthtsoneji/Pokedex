class PokeDexModal {
  PokeDexModal(
      {this.count,
      this.next,
      this.previous,
      this.results,
      this.name,
      this.url,
      this.image,
      this.id});

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;
  String? name;
  String? url;
  String? image;
  int? id;

  String? get getImage {
    if (id != null) {
      return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
    } else {
      return null;
    }
  }

  factory PokeDexModal.fromJson(Map<String, dynamic> json) {
    final name = json["name"];
    final url = json["url"];
    final id = int.parse(url.split('/')[6]);
    return PokeDexModal(name: name, url: url, id: id);
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "name": name,
        "url": url,
      };
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
