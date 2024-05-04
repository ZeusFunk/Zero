// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// 定义一个异步函数 `connectDevice`，它接收一个 `BTDevicesStruct` 对象作为参数并返回一个 `Future<bool>`。
// 此函数的作用是尝试连接到一个蓝牙设备，并检查该设备是否具有写入特征（write characteristic）。
Future<bool> connectDevice(BTDevicesStruct deviceInfo) async {
  // 根据提供的设备信息（设备ID），创建一个 `BluetoothDevice` 对象。
  final device = BluetoothDevice.fromId(deviceInfo.id);

  try {
    // 尝试连接到蓝牙设备。
    await device.connect();
  } catch (e) {
    // 如果连接过程中发生异常，打印异常信息。
    print(e);
  }

  // 初始化一个布尔变量，用于标记是否找到了写入特征。
  var hasWriteCharacteristic = false;

  // 发现蓝牙设备提供的所有服务。
  final services = await device.discoverServices();

  // 遍历所有服务。
  for (BluetoothService service in services) {
    // 遍历服务中的所有特征。
    for (BluetoothCharacteristic characteristic in service.characteristics) {
      // 检查特征是否具有写入的属性。
      final isWrite = characteristic.properties.write;
      if (isWrite) {
        // 如果找到具有写入属性的特征，打印特征的UUID和属性。
        debugPrint(
            'Found write characteristic: ${characteristic.uuid}, ${characteristic.properties}');
        // 将标记变量设置为 true，表示找到了写入特征。
        hasWriteCharacteristic = true;
      }
    }
  }

  // 返回是否找到写入特征的布尔值。
  return hasWriteCharacteristic;
}
