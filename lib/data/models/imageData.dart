class ImageData {
  int id;
  String title;
  String url;
  String thumbnailUrl;

  ImageData(this.id, this.title, this.url, this.thumbnailUrl);

  ImageData.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  Map toJson() {
    return {'id': id, 'title': title, 'url': url, 'thumbnailUrl': thumbnailUrl};
  }
}
