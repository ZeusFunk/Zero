// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// 假设您有这些UUID
final String SERVICE_UUID = "CD9CFC21-0ECC-42E5-BF22-48AA715CA112";
final String CHARACTERISTIC_UUID = "66E5FFCE-AA96-4DC9-90C3-C62BBCCD29AC";

Future<void> sendData(BTDevicesStruct deviceInfo, String data) async {
  // 将string转换为字节
  List<int> bytes = utf8.encode(data);
  final device = BluetoothDevice.fromId(deviceInfo.id);
  final services = await device.discoverServices();

  for (BluetoothService service in services) {
    if (service.uuid.toString().toUpperCase() == SERVICE_UUID) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        if (characteristic.uuid.toString().toUpperCase() ==
                CHARACTERISTIC_UUID &&
            characteristic.properties.write) {
          await characteristic.write(bytes);
          print("Data written to the device");
          return;
        }
      }
    }
  }
  print("No matching characteristic found");
}
