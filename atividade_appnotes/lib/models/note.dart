class Note {
  int id;
  String title;
  String text;
  bool arquived;

  Note({this.id, this.text, this.title, this.arquived});

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
        id: json["ID"],
        title: json["Title"],
        text: json["Text"],
        arquived: json["Arquived"] == 1,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "ID": id,
      "Title": title,
      "Text": text,
      "Arquived": arquived
    };
  }
}
