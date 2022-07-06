import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../controllers/product_provider.dart';
import '../controllers/theme_provider.dart';
import '../widgets/widget_card_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('build 1');
    context.read<ProductProvider>().getList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk'),
        centerTitle: true,
        actions: [
          Consumer<ThemeProvider>(
            builder: (a, b, c) {
              return Switch.adaptive(
                value: b.getThemeMode,
                onChanged: (bool value) => b.toggleTheme(value),
              );
            },
          )
        ],
      ),
      body: Consumer<ProductProvider>(builder: (a, b, c) {
        debugPrint('build 2');
        return RefreshIndicator(
          onRefresh: () => b.getList(),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return false;
            },
            child: MasonryGridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: b.dataProduct.length,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, i) {
                debugPrint('build 3');
                return CardItem(data: b.dataProduct[i]);
              },
            ),
          ),
        );
      }),
    );
  }
}
