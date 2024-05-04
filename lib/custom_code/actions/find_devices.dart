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

// 定义一个异步函数 `findDevices`，它返回一个 `Future` 对象，该对象最终会解析为一个 `BTDevicesStruct` 类型的列表。
// 此函数的作用是查找并返回附近的蓝牙设备列表。
Future<List<BTDevicesStruct>> findDevices() async {
  // 初始化一个空的列表，用于存储找到的蓝牙设备。
  List<BTDevicesStruct> devices = [];

  // 监听扫描结果的流。每当有新的扫描结果时，都会调用此监听器。
  FlutterBluePlus.scanResults.listen((results) {
    // 初始化一个空的列表，用于存储扫描过程中发现的设备。
    List<ScanResult> scannedDevices = [];

    // 遍历扫描结果。
    for (ScanResult r in results) {
      // 如果扫描到的设备有非空的平台名称，则将其添加到 `scannedDevices` 列表中。
      if (r.device.platformName.isNotEmpty) {
        scannedDevices.add(r);
      }
    }

    // 对扫描到的设备根据信号强度（RSSI）进行排序，信号最强的设备排在前面。
    scannedDevices.sort((a, b) => b.rssi.compareTo(a.rssi));

    // 清空之前找到的设备列表。
    devices.clear();

    // 将排序后的扫描结果转换为 `BTDevicesStruct` 对象，并添加到 `devices` 列表中。
    scannedDevices.forEach((deviceResult) {
      devices.add(BTDevicesStruct(
        name: deviceResult.device.platformName, // 设备名称
        id: deviceResult.device.remoteId.toString(), // 设备ID
        rssi: deviceResult.rssi, // 信号强度
      ));
    });
  });

  // 检查当前是否正在扫描蓝牙设备。
  final isScanning = FlutterBluePlus.isScanningNow;

  // 如果当前没有正在扫描，则启动蓝牙扫描，持续时间为5秒。
  if (!isScanning) {
    await FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 5),
    );
  }

  // 等待扫描结束
  await FlutterBluePlus.isScanning.where((val) => val == false).first;

  // 返回找到的蓝牙设备列表。
  return devices;
}
