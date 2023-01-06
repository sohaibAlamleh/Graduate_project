class GetImage {
  String s = '';
  bool isImage = false;

  bool check() {
    if (s.isNotEmpty) {
      return isImage = true;
    } else {
      return isImage = false;
    }
  }
}
