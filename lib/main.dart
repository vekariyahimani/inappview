import 'package:flutter/material.dart';
import 'package:inappview/screen/crome/provider/crome_provider.dart';
import 'package:inappview/screen/crome/view/crome_screen.dart';
import 'package:provider/provider.dart';


void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => CromeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => CromeScreen(),
          ''
        },
      ),
    )
  );
}