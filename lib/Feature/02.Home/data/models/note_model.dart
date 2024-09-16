class NoteModel {
  final String id;

  final String title;

  final String subTitle;

  NoteModel({
    required this.id,
    required this.title,
    required this.subTitle,
  });

  factory NoteModel.fromJson(Map<String, dynamic> jsonData) {
    return NoteModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      subTitle: jsonData['subtitle'],
    );
  }
}
