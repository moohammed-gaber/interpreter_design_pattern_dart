import 'package:untitled1/interpreter/date_time/expression.dart';
import 'package:untitled1/interpreter/sql/context.dart';
import 'package:untitled1/interpreter/sql/data.dart';
import 'package:untitled1/interpreter/sql/expression.dart';
// final sql = 'Where isSender = "1" AND message = "how are you"';

void main(List<String> arguments) {
/*
  final expression = WhereExpression<bool>('isSender', '=', true);
  final expression2 = WhereExpression(
    'message',
    '=',
    null,
  );
    expression.execute(context);
  expression2.execute(context);
  final expressions = AndExpression(expression, expression2);

*/

/*
  final context = Context(messages: data);

  final expression = WhereExpression2((e) => e['isSender'] == "false");
*/

/*
  print(expression.execute(context));
*/
/*
  final output =
      data.where((e) => context.wheres.every((element) => element(e)));
*/

  // print(output);
  final messages = <Map<String, dynamic>>[];
  for (final message in data) {
    final context = Context();
/*
    final expression2 = WhereExpression('message', '=', 'how are you?');
    final expression3 = WhereExpression('message', '=', 'hi');
    final andExpression = AndExpression(expression, expression2);
    final orExpression = OrExpression(andExpression, expression3);
     final expression = WhereExpression<List>('id', 'isNull', null);

    final result = orExpression.execute(context, message);
*/
    final expression = WhereExpression('isSender', '=', 'true');
    final expression2 = WhereExpression('isSender', '=', null);
    final expression3 = WhereExpression('isSender', "inList", null);
    final orExpression = OrExpression(expression, expression2);
    print(orExpression.generateSql());
    return;
    final result = orExpression.execute(context, message);
    if (result) {
      messages.add(message);
    }
  }
  // print(messages);
}
/*
final expression = DayExpression();
final context = Context(date: DateTime.now(), expression: 'MM DD YYYY');
expression.execute(context);

print(context.expression);
*/
