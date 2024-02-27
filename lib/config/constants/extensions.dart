import 'package:jiffy/jiffy.dart';

extension FormatDate on DateTime{
  String yMMMED()=> Jiffy.parseFromDateTime(this).yMMMEd;
}