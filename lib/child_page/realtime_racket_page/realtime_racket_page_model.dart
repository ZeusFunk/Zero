import '/flutter_flow/flutter_flow_util.dart';
import 'realtime_racket_page_widget.dart' show RealtimeRacketPageWidget;
import 'package:flutter/material.dart';

class RealtimeRacketPageModel
    extends FlutterFlowModel<RealtimeRacketPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
