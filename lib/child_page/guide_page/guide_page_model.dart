import '/flutter_flow/flutter_flow_util.dart';
import 'guide_page_widget.dart' show GuidePageWidget;
import 'package:flutter/material.dart';

class GuidePageModel extends FlutterFlowModel<GuidePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
