import 'package:flutter/material.dart';
import 'package:gut7/app.dart';
import 'package:gut7/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: App()
    )
  );
}
