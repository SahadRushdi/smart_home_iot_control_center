import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/themes/colors.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: powerOn ? NeonColors.activeBackground : NeonColors.inactiveBackground,
          boxShadow: [
            BoxShadow(
              color: powerOn ? NeonColors.activeShadow : NeonColors.inactiveShadow,
              blurRadius: 18,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Neon icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: powerOn ? NeonColors.activeShadow : NeonColors.inactiveShadow,
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Image.asset(
                  iconPath,
                  height: 65,
                  color: powerOn ? NeonColors.activeIcon : NeonColors.inactiveIcon,
                ),
              ),

              // Smart device name + switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        smartDeviceName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: powerOn ? NeonColors.activeText : NeonColors.inactiveText,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: powerOn ? NeonColors.activeShadow : NeonColors.inactiveShadow,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                      activeColor: NeonColors.activeSwitch,
                      trackColor: NeonColors.inactiveSwitch,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
