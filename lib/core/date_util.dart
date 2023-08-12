import 'package:intl/intl.dart';


  String getTime(int epoch){
    DateTime now = DateTime.fromMicrosecondsSinceEpoch(epoch);
    return DateFormat.jm().format(now);

  }

  String getDate(int epoch){
    DateTime now = DateTime.fromMicrosecondsSinceEpoch(epoch);
     return DateFormat("MM-dd-yyy").format(now);

  }