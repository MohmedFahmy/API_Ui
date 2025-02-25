class Model {
  final String title;
  final String body;
  final int id;

  Model({required this.title, required this.body, required this.id});
  
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'],
      body: json['body'],
      id: json['id'],
    );
  }
}
