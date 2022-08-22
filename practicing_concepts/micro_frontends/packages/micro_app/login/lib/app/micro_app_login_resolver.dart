import 'package:core/app/micro_app.dart';
import 'package:core/app/micro_core.dart';
import 'package:login/app/presenter/ui/auth_screens/login_page.dart';

class MicroAppLoginResolver implements MicroApp{
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {'/login': ((context, args) => const LoginPage())};
  }


}