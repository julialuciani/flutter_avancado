import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/microapp.dart';

import 'app/pages/product_pages.dart';

class MicroProductsResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_products';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {'/products': (context, args) => const ProductPages()};
  }
}
