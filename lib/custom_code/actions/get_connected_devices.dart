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

// 定义一个异步函数 `getConnectedDevices`，它返回一个 `Future` 对象，该对象最终会解析为一个 `BTDevicesStruct` 类型的列表。
// 此函数的作用是获取当前已连接的蓝牙设备列表。
Future<List<BTDevicesStruct>> getConnectedDevices() async {
  // 从 FlutterBluePlus 获取当前已连接的蓝牙设备列表。
  final connectedDevices = await FlutterBluePlus.connectedDevices;

  // 初始化一个空的列表，用于存储转换后的蓝牙设备信息。
  List<BTDevicesStruct> devices = [];

  // 遍历已连接的设备列表。
  for (int i = 0; i < connectedDevices.length; i++) {
    // 获取单个已连接设备的信息。
    final deviceResult = connectedDevices[i];

    // 获取设备的当前连接状态。
    final deviceState = await deviceResult.connectionState.first;

    // 检查设备是否处于已连接状态。
    if (deviceState == BluetoothConnectionState.connected) {
      // 读取设备的信号强度值（RSSI）。
      final deviceRssi = await deviceResult.readRssi();

      // 将设备信息封装成 `BTDevicesStruct` 对象并添加到设备列表中。
      devices.add(BTDevicesStruct(
        name: deviceResult.platformName, // 设备名称
        id: deviceResult.remoteId.toString(), // 设备ID
        rssi: deviceRssi, // 信号强度
      ));
    }
  }

  // 返回转换后的已连接蓝牙设备列表。
  return devices;
}
