import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime? dateTime = DateTime.parse(date);


  if (dateTime != null) {
    return DateFormat("dd 'de' MMM 'de' yyyy",'pt_BR').format(dateTime);
  } else {
    return 'Data desconhecida';
  }
}
