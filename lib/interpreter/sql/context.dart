import 'package:untitled1/interpreter/sql/data.dart';
import 'package:untitled1/interpreter/sql/expression.dart';

typedef Where = bool Function(Map<String, dynamic> element);


class Context {
/*
  final List<Map<String, Object>> messages;

  final List<Where> wheres = [];
*/

  Context(/*{
    required this.messages,
  }*/);
  String buildSql() {
    return ' ';
  }

}
