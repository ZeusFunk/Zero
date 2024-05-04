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

// 定义一个异步函数 `turnOnBluetooth`，它返回一个 `Future` 对象，该对象最终会解析为一个布尔值。
Future<bool> turnOnBluetooth() async {
  // 首先检查当前设备是否支持蓝牙功能。
  if (await FlutterBluePlus.isSupported == false) {
    // 如果设备不支持蓝牙，打印一条消息到控制台，并返回 false。
    print("Bluetooth not supported by this device");
    return false;
  }

  // 检查当前平台是否为 Android，因为开启蓝牙的方法可能依赖于特定平台。
  if (isAndroid) {
    // 如果是 Android 设备，调用 FlutterBluePlus 插件的 `turnOn` 方法来开启蓝牙。
    await FlutterBluePlus.turnOn();
  }

  // 如果设备支持蓝牙，并且（如果是 Android 设备）已经尝试开启蓝牙，返回 true。
  return true;
}
