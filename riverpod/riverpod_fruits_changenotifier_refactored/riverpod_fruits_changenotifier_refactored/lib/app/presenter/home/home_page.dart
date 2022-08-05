import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_controller.dart';
import 'widgets/fruit_button.dart';

final favoritesProvider = ChangeNotifierProvider(
  (ref) => FavoritesController(),
);

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha fruta favorita é ${favorites.fruit}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FruitButton('Maracujá'),
            FruitButton('Kiwi'),
            FruitButton('Melão'),
            FruitButton('Morango'),
            FruitButton('Manga'),
          ],
        ),
      ),
    );
  }
}


