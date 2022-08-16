import 'package:flutter/material.dart';

//typedef é uma alias, um apelido para a função do context
typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);
var navigatorKey = GlobalKey<NavigatorState>();