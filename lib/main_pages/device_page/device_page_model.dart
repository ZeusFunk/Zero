import '/flutter_flow/flutter_flow_util.dart';
import 'device_page_widget.dart' show DevicePageWidget;
import 'package:flutter/material.dart';

class DevicePageModel extends FlutterFlowModel<DevicePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - isBluetoothEnabled] action in Card widget.
  bool? btEnabled;
  // Stores action output result for [Custom Action - turnOnBluetooth] action in Card widget.
  bool? btEnabledCheck;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
