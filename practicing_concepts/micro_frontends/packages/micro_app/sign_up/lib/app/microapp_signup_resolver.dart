
import 'package:core/app/micro_app.dart';
import 'package:core/app/micro_core.dart';
import 'package:sign_up/app/presenter/sign_up_page.dart';

class MicroappSignupResolver implements MicroApp {
  
  @override
  String get microAppName => 'micro_app_sign_up';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {'/sign-up':((context, args) => SignUpPage())};
  }
  
}