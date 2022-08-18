import 'package:hooks_riverpod/hooks_riverpod.dart';

//Provider mais simples
final nameUserProvider = Provider((ref) => 'Júlia Luciani');

//Provider com Estado
final nameStateProvider = StateProvider((ref) => 'Júlia');