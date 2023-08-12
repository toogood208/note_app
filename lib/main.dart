import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/app/app.dart';
import 'package:note_app/app/router.dart';
import 'package:note_app/ui/views/add_notes/add_new_notes_provider.dart';
import 'package:note_app/ui/views/delete/delete_provider.dart';
import 'package:note_app/ui/views/favourites/favourites_provider.dart';
import 'package:note_app/ui/views/home_page/home_page_provider.dart';
import 'package:note_app/ui/views/home_page/home_page_view.dart';
import 'package:note_app/ui/views/search/search_provider.dart';
import 'package:provider/provider.dart';

import 'core/services/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ChangeNotifierProvider(create: (_) => AddNotesProvider()),
      ChangeNotifierProvider(create: (_) => FavouriteViewProvider()),
      ChangeNotifierProvider(create: (_) => DeleteViewProvider()),
       ChangeNotifierProvider(create: (_) => SearchProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Wiseki note',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              useMaterial3: true,
            ),
            home: const HomePageView(),
            navigatorKey: getIt<NavigationService>().navigatorKey,
            routes: Routes.routes,
            initialRoute: Routes.homePage,
          );
        });
  }
}
