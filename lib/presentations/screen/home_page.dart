import 'package:flutter/material.dart';
import 'package:smart_home_iot_control_center/data/smart_device_box.dart';
import 'package:smart_home_iot_control_center/presentations/date_picker_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", true],
  ];

  // power button switch
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

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
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //   app bar
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //   menu icon
                Image.asset(
                  'lib/icons/menu.png',
                  height: 45,
                  color: Colors.blue[800],
                ),

                //   customer account icon
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.blue[800],
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

        //   Welcome
          Padding(
              padding:EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WELCOME TO IOT CONTROL CENTER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.lightBlue.shade600
                  ),
                ),
                 Text(
                  "Hi Saad,",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.purple[600]
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),
          
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
          ),

          const SizedBox(height: 25),

        //   Smart Devices Grid
          Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                "Smart Devices",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.purple
                ),
              ),
          ),

          const SizedBox(height: 25),

        //   Grid
          Expanded(
              child: GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              )
          )

        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DatePickerApp()),
          );
        },
        // tooltip: 'Increment',
        child: const Icon(Icons.date_range_outlined),
      ),
    );
  }
}
