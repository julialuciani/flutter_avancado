import 'package:core/app/micro_core.dart';

abstract class MicroApp{
  String get microAppName;
  Map<String, WidgetBuilderArgs> get routes;
}
