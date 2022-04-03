import 'package:inbank_app/functions/functions.dart';
import 'package:inbank_app/objects/consts.dart';
import 'package:inbank_app/objects/decision.dart';

import '../objects/person.dart';

class DecisionEngine {
  static Decision? decide(String id, String amount, String period) {
    Decision? decision;
    Person? a;
    String periodNew;
    Constraints.persons.forEach((element) {
      if (element.id == id) {
        a = element;
      } else {
        decision = Decision(approved: false);
      }
    });

    if (a != null) {
      if (a?.debt == true) {
        decision = Decision(approved: false, debt: true);
      } else {
        int? creditScore = a?.credit;
        int loanAmount = int.parse(amount.replaceAll(RegExp('[^0-9]'), ''));
        int loanPeriod = int.parse(period.replaceAll(RegExp('[^0-9]'), ''));
        periodNew = loanPeriod.toString();
        double score = (creditScore! / loanAmount) * loanPeriod;

        if (score < 1) {
          int? g = findMin(creditScore, loanAmount, loanPeriod);
          if ( (creditScore / g!) * loanPeriod < 1) {
            int? newPer = addPeriod(creditScore, loanAmount, loanPeriod);
            periodNew = newPer.toString();
          }
          String amountText = g.toString();

          decision =
              Decision(approved: false, amount: amountText, period: periodNew);
        } else if (score >= 1) {
          String g = findMax(creditScore, loanAmount, loanPeriod).toString();
          decision = Decision(
              approved: true, amount: g, period: loanPeriod.toString());
        }
      }
    }

    return decision;
  }
}
