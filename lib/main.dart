import 'package:flutter/material.dart';
import 'package:fruit_market_final/firebase_options.dart';
import './screens/screens.dart';
import './providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fruits Page',
        theme: ThemeData(

          primarySwatch: Colors.green,
        ),
        home: BottomsScreen(),
        routes: {
          BottomsScreen.RouteName : (_) => BottomsScreen(),
          DetailsScreen.RouteName : (_) => DetailsScreen(),
          ProfileScreen.RouteName: (_) => ProfileScreen(),
          ShoppingCartScreen.RouteName: (_) => ShoppingCartScreen(),
        },
      ),
    );
  }
}
