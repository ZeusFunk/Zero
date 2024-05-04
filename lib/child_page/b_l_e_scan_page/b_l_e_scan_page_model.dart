import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_l_e_scan_page_widget.dart' show BLEScanPageWidget;
import 'package:flutter/material.dart';

class BLEScanPageModel extends FlutterFlowModel<BLEScanPageWidget> {
  ///  Local state fields for this page.

  List<BTDevicesStruct> foundDevices = [];
  void addToFoundDevices(BTDevicesStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDevicesStruct item) =>
      foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void insertAtIndexInFoundDevices(int index, BTDevicesStruct item) =>
      foundDevices.insert(index, item);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDevicesStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

  bool isFindingDevices = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - findDevices] action in BLEScanPage widget.
  List<BTDevicesStruct>? foundedDevices;
  // Stores action output result for [Custom Action - findDevices] action in Button widget.
  List<BTDevicesStruct>? findRefresh;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
