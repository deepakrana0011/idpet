
import 'package:easy_localization/easy_localization.dart';

int getDateDiffInYears(int startDate) {
  final DateTime date1 = DateTime.fromMillisecondsSinceEpoch(startDate);
  var now = new DateTime.now();
  var value = now.difference(date1).inDays;
  return value ~/ 365;
}

String ddMMyyyy(var date) {
  var value = DateFormat('dd/MM/yyyy').format(date!);
  return value;
}

String time(int date) {
    final DateTime date1 = DateTime.fromMillisecondsSinceEpoch(date);
    var value = DateFormat('dd/MM/yyyy').format(date1);
    return value.toString() ;

}