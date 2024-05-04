// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Add the following code:
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// 定义一个异步函数 `isBluetoothEnabled`，它返回一个 `Future` 对象，该对象最终会解析为一个布尔值。
Future<bool> isBluetoothEnabled() async {
  // 请求 FlutterBluePlus 插件获取当前蓝牙是否打开的状态。
  await FlutterBluePlus.adapterState.first == BluetoothAdapterState.on;
  // 强制等待100毫秒，这可能是为了确保有足够的时间让蓝牙状态更新。
  await Future.delayed(Duration(milliseconds: 100));
  // 获取蓝牙适配器的当前状态的流中的第一个事件。
  final state = await FlutterBluePlus.adapterState.first;
  // 检查蓝牙适配器的状态是否为开启（BluetoothState.on）。
  if (state == BluetoothAdapterState.on) {
    // 如果蓝牙是开启的，返回 true。
    return true;
  }
  // 如果蓝牙不是开启的，返回 false。
  return false;
}
