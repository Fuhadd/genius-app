import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/utils/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make the status bar transparent
    statusBarIconBrightness:
        Brightness.dark, // Dark icons (for light backgrounds)
    statusBarBrightness: Brightness.light, // Required for iOS
  ));
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: ShadApp.materialRouter(
        title: 'Genius App',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),

        materialThemeBuilder: (context, theme) {
          return theme.copyWith(
            appBarTheme: const AppBarTheme(toolbarHeight: 52),
          );
        },
        routerConfig: router,
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
