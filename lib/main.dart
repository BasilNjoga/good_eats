import 'package:flutter/material.dart';
import 'package:good_eats/menu_database.dart';
import 'package:good_eats/route.dart';
import 'package:good_eats/ui/cart.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async { 

WidgetsFlutterBinding.ensureInitialized();

// initialize isar
await MenuDatabase.initialize();

//initialize hive
await Hive.initFlutter();

// open the box
var box = await Hive.openBox('mybox');


runApp(
  ChangeNotifierProvider(create: (context) => MenuDatabase(),
  child: const MyApp(),)
  );



}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Cart>(
      //builder: (_) => Cart(),
      //dispose: (_, cart) => cart.dispose(),
      create: (BuildContext context) => Cart(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        // primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //     secondary: CommonColors.blue , background: Colors.white),
        cardColor: Colors.white,
        cardTheme: const CardTheme(surfaceTintColor: Colors.white)
      ),
        //home: HomeScreen(),
        onGenerateRoute: (settings) {
          return getRoute(settings);
        },
      ),
    
    );
    
  }
}
