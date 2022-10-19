// select
//   *
import 'package:untitled1/interpreter/date_time/expression.dart';
import 'package:untitled1/interpreter/sql/context.dart';

abstract class IExpression<T> {
  T execute(Context context, Map<String, Object?> element);

  String generateSql();
}

class WhereExpression<T extends Object?> implements IExpression {
  final String column;
  final String condition;
  final T? value;

  WhereExpression(
    this.column,
    this.condition,
    this.value,
  );

  @override
  bool execute(Context context, Map<String, Object?> element) {
    if (condition == 'isNull') {
      return element[column] == null;
    }
    if (condition == 'inList') {
      final match = element[column].toString();
      // print('match: $match');
      final x = (value as List).map((e) => e.toString());
      // print('x: $x');
      final y = x.contains(match);
      // print('y: $y');
      return y;
/*
      if (match is List) {
        return match.contains(value);
      }
*/

/*
      (value as List).map((e) => e.toString()).contains(element);
*/
    }
    return element[column] == value;
  }

  @override
  String generateSql() {
    if (value == null) {
      return '"$column" Is NUll';
    } else {
      return '"$column" = "$value"';
    }
  }
}

class AndExpression implements IExpression {
  final IExpression whereExpression, whereExpression2;

  AndExpression(this.whereExpression, this.whereExpression2);

  @override
  bool execute(Context context, Map<String, Object?> element) {
    return whereExpression.execute(context, element) &&
        whereExpression2.execute(context, element);
  }

  @override
  String generateSql() {
    return 'AND';
  }
}

class OrExpression implements IExpression {
  final IExpression whereExpression, whereExpression2;

  OrExpression(this.whereExpression, this.whereExpression2);

  @override
  bool execute(Context context, Map<String, Object?> element) {
    return whereExpression.execute(context, element) ||
        whereExpression2.execute(context, element);
  }

  @override
  String generateSql() {
    // TODO: implement generateSql
    return '${whereExpression.generateSql()} OR ${whereExpression2.generateSql()}';
  }
}

abstract class Condition {
  final String operator;

  Condition(this.operator);

  bool execute(rightHand, leftHand);
}

/*
class EqualCondition extends Condition {
  EqualCondition() : super('=');

  @override
  bool execute(rightHand, leftHand) {
    // TODO: implement execute
    return rightHand == leftHand;
  }
}

class NotEqualCondition extends Condition {
  NotEqualCondition() : super('!=');
}

class InListCondition extends Condition {
  InListCondition() : super('[ ] contain');
}

class LikeCondition extends Condition {
  LikeCondition() : super('!=');
}

class IsNullCondition extends Condition {
  IsNullCondition() : super('==null');
}
*/
