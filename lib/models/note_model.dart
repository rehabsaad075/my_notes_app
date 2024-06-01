import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
   String ?title;
  @HiveField(1)
   String content;
  @HiveField(2)
   String date;
  @HiveField(3)
   String time;
  @HiveField(4)
   int color;
  @HiveField(5)
  int borderColor;
  @HiveField(6)
  String colorName;

  NoteModel({
     this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.color,
    required this.borderColor,
    required this.colorName,
  });

}