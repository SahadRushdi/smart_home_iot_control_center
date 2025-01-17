import 'package:flutter/material.dart';
import 'package:smart_home_iot_control_center/presentations/date_picker_app.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24, // Increase the font size
            fontWeight: FontWeight.bold, // Make it bold
            color: Colors.white, // Set a custom color
            letterSpacing: 1.2, // Add some spacing between letters
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DatePickerApp()),
          );
        },
        // tooltip: 'Increment',
        child: const Icon(Icons.date_range_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}