import 'package:flutter/material.dart';
import 'package:learn/pages/home.dart';
import 'package:learn/utils/colors.dart';
import 'package:learn/utils/route_name.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'controllers/product_provider.dart';
import 'controllers/theme_provider.dart';
import 'pages/product_details.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      builder: (context, widget) {
        return MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5)),
          ),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: ColorTheme.base),
            brightness: Brightness.light,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          themeMode: context.watch<ThemeProvider>().getThemeMode
              ? ThemeMode.dark
              : ThemeMode.light,
          title: 'Flutter Demo',
          initialRoute: RouteName.HOME,
          routes: {
            RouteName.HOME: (context) => const Home(),
            RouteName.PRODUCT_DETAIL: (context) => const ProductDetails(),
          },
        );
      },
    );
  }
}
