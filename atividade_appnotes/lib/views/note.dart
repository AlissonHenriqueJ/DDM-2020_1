import 'package:atividade_appnotes/controller/notesController.dart';
import 'package:atividade_appnotes/models/note.dart';
import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  final Note note;
  final NotesController controller = NotesController();

  NoteView({this.note});

  final textControllerTitle = TextEditingController();
  final textControllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textControllerText.text = this.note.text;
    textControllerTitle.text = this.note.title;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          this.note.id != null && this.note.id > -1 ? 'Note' : 'Add Note',
        ),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: textControllerTitle,
            decoration: const InputDecoration(
              hintText: 'Title',
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: textControllerText,
              decoration: const InputDecoration(
                hintText: 'Text',
                contentPadding: EdgeInsets.all(8),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        onPressed: () {
          this.note.title = textControllerTitle.text;
          this.note.text = textControllerText.text;

          if (this.note.id == null || this.note.id <= 0) {
            this.note.arquived = false;
            this.controller.addItem(note).then((id) {
              this.mostrarSuccess(context);
            });
          } else {
            this.controller.update(note).then((id) {
              this.mostrarSuccess(context);
            });
          }
        },
      ),
    );
  }

  mostrarSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Salvo'),
          content: Text('Registro salvo com sucesso.'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
