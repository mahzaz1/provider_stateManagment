import 'package:flutter/material.dart';
import 'package:provider_statemanagment/Provider/Count_provider.dart';
import 'package:provider_statemanagment/Provider/slider_provider.dart';
import 'Provider/Login_Provider.dart';
import 'Provider/ThemeChanger.dart';
import 'Provider/favouriteProvider.dart';
import 'package:provider/provider.dart';
import 'Screens/Login.dart';
import 'Screens/NotifyListner.dart';
import 'Screens/favourites/favourits.dart';
import 'Screens/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => SliderProvider(),),
        ChangeNotifierProvider(create: (_) => FavouriteProvider(),),
        ChangeNotifierProvider(create: (_) => ThemeChanger(),),
        ChangeNotifierProvider(create: (_) => LoginProvider(),),
      ],
      child: Builder(
        builder: (BuildContext context){
        final themeChangerProvider = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          themeMode: themeChangerProvider.themeMode,
          darkTheme: ThemeData(
            brightness: Brightness.dark
          ),
          debugShowCheckedModeBanner: false,
          home: Login(),
        );
      },),
    );
  }
}