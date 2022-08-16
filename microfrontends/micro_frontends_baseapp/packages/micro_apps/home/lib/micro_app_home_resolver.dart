
import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/microapp.dart';

import 'app/home_page.dart';

class MicroAppHomeResolver implements MicroApp{
  @override
  String get microAppName => 'micro_app_home';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {'/home': ((context, args) => const HomePage())};
  }
  
}