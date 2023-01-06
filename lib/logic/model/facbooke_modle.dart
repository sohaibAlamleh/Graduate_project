

/// {
///  "name": "Open Graph Test User",
///  "email": "open_jygexjs_user@tfbnw.net",
///  "picture": {
///    "data": {
///      "height": 126,
///      "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/84628273_176159830277856_972693363922829312_n.jpg",
///      "width": 200
///    }
///  },
///  "id": "136742241592917"
///}

class FacbookeModle {
  final String? name;
  final String? email;
  final String? id;
  final FacbookephotoModle? facbookephotoModle;

  FacbookeModle({this.name, this.email, this.id, this.facbookephotoModle});

  factory FacbookeModle.fromJosn(Map<String, dynamic> json) => FacbookeModle(
      email: json['email'],
      name: json['name'],
      id: json['id'],
      facbookephotoModle: FacbookephotoModle.fromJosn(json['picture']['data']));
}

class FacbookephotoModle {
  final String? url;
  final int? height;
  final int? width;

  FacbookephotoModle({this.url, this.height, this.width});

  factory FacbookephotoModle.fromJosn(Map<String, dynamic> json) =>
      FacbookephotoModle(
          url: json['url'], height: json['height'], width: json['width']);
}
