import 'package:atividade_appnotes/controller/notesController.dart';
import 'package:atividade_appnotes/models/note.dart';
import 'note.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final NotesController controller = NotesController();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showArquived = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Notes'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Ativas'),
              leading: Icon(Icons.check),
              selected: !this.showArquived,
              onTap: () {
                setState(() {
                  this.showArquived = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Arquivadas'),
              leading: Icon(Icons.archive),
              selected: this.showArquived,
              onTap: () {
                setState(() {
                  this.showArquived = true;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: this.widget.controller.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              (snapshot.hasData == null ||
                  !snapshot.hasData ||
                  snapshot.data == null)) {
            
            return Container();
          }

          List<Note> notes = snapshot.data;

          notes = notes
              .where((note) => note.arquived == this.showArquived)
              .toList();

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: notes.length,
            itemBuilder: (context, index) =>
                this.createNotePreview(note: notes[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          this.openNote();
        },
      ),
    );
  }

  void openNote({Note note}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NoteView(note: new Note())),
    );
    setState(() {});
  }

  createNotePreview({Note note}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NoteView(note: note)));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                note.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    note.arquived = !note.arquived;
                    this.widget.controller.update(note).then((id) {
                      setState(() {
                        this.showArquived = this.showArquived;
                      });
                    });
                  },
                  child: Text((note.arquived ? 'Desarquivar' : 'Arquivar')
                      .toUpperCase()),
                ),
                FlatButton(
                  onPressed: () {
                    this.widget.controller.deleteNote(note.id).then((id) {
                      setState(() {
                        this.showArquived = this.showArquived;
                      });
                    });
                  },
                  child: Text(('Excluir').toUpperCase()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
