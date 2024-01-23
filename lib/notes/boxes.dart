import 'package:foodie_zone/notes/notemodel.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Future<Box<NotesModel>> openNotesBox() async {
    if (!Hive.isBoxOpen('notes')) {
      // await Hive.openBox<NotesModel>('notes');
    }
    return Hive.box<NotesModel>('notes');
  }

  static Box<NotesModel> getNotesBox() {
    if (Hive.isBoxOpen('notes')) {
      return Hive.box<NotesModel>('notes');
    } else {
      throw Exception("Box 'notes' is not open. Call openNotesBox() first.");
    }
  }

  static Future<void> closeNotesBox() async {
    if (Hive.isBoxOpen('notes')) {
      await Hive.close();
    }
  }
}

