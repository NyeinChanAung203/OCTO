import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test1/provider/usermodel_provider.dart';
import 'package:test1/routes/generate_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModelMessageProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OCTO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        onGenerateRoute: GenerateRoute.generateRoute,
      ),
    );
  }
}
