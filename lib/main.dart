import 'package:flutter/material.dart';
import 'package:good_eats/models/menu_database.dart';
import 'package:good_eats/route.dart';
import 'package:good_eats/ui/cart.dart';
import 'package:good_eats/ui/home_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async { 

WidgetsFlutterBinding.ensureInitialized();

await MenuDatabase.initialize();

await Hive.initFlutter();

// intialize hive
runApp(
  ChangeNotifierProvider(create: (context) => MenuDatabase(),
  child: const MyApp(),)
  );

// open the box
var box = await Hive.openBox('mybox');

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
        //home: HomeScreen(),
        onGenerateRoute: (settings) {
          return getRoute(settings);
        },
      ),
    
    );
    
  }
}
