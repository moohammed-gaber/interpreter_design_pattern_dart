import 'package:untitled1/interpreter/date_time/context.dart';

abstract class IExpression {
  void execute(Context context);
}

class DayExpression extends IExpression {
  @override
  void execute(Context context) {
    String expression = context.expression;
    context.expression =
        expression.replaceAll("DD", context.date.day.toString());
  }
}

// month Expression
class MonthExpression extends IExpression {
  @override
  void execute(Context context) {
    String expression = context.expression;
    context.expression =
        expression.replaceAll("MM", context.date.month.toString());
  }
}

// year Expression
class YearExpression extends IExpression {
  @override
  void execute(Context context) {
    String expression = context.expression;
    context.expression =
        expression.replaceAll("YYYY", context.date.year.toString());
  }
}
// seperator

