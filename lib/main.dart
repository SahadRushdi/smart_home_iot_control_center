import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_iot_control_center/presentations/screen/home_page.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'Smart Home IOT Control Center'),
    );
  }
}