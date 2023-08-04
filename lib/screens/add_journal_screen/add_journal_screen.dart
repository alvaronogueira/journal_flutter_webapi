import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final bool isEditing;
  
  AddJournalScreen({ 
    Key? key,
    required this.journal,
    required this.isEditing,
  }) : super(key: key);

    final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    contentController.text = journal.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          controller: contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }

  void registerJournal(BuildContext context) {
    String content = contentController.text;

    journal.content = content;

    JournalService service = JournalService();
    if (isEditing) {
      service.register(journal).then((value) {
        Navigator.pop(context, value);
      });
    } else {
      service.edit(journal.id, journal).then((value) {
        Navigator.pop(context, value);
      });
    }
  }
}

