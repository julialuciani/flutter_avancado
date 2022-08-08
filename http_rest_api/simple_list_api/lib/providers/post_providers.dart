import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/post_model.dart';
import '../notifiers/post_notifiers.dart';

final postProvider = StateNotifierProvider<PostNotifier, List<PostModel>>(
  (ref) => PostNotifier(),
);
