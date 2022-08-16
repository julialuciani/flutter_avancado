
import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/microapp.dart';
import 'package:micro_app_login/app/pages/login_page.dart';


class MicroAppLoginResolver implements MicroApp{
  @override

  String get microAppName => 'micro_app_login';

  @override

  Map<String, WidgetBuilderArgs> get routes {
    return{
      '/login':(context, args) => const LoginPage(),
    };
  }
  
}