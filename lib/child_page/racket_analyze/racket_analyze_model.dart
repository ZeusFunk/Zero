import '/flutter_flow/flutter_flow_util.dart';
import 'racket_analyze_widget.dart' show RacketAnalyzeWidget;
import 'package:flutter/material.dart';

class RacketAnalyzeModel extends FlutterFlowModel<RacketAnalyzeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
