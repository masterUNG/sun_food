class JsonModel {

  // Create Field
  int id;
  String title;
  String url;

  // Constructor
  JsonModel(this.id, this.title, this.url);

  @override
  String toString() {
    // TODO: implement toString
    return 'id = $id, title = $title, url = $url';
  }
  
}