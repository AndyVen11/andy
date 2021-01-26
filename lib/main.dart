import 'package:flutter/material.dart';
import 'package:vidbusters/providers/users.dart';
import 'package:vidbusters/screens/starting.dart';
import 'package:vidbusters/screens/forms/login.dart';
import 'package:vidbusters/screens/forms/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Users(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => Starting(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
        },
      ),
    );
  }
}
