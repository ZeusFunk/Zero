import '/chat/ai_chat_component/ai_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_ai_page_widget.dart' show ChatAiPageWidget;
import 'package:flutter/material.dart';

class ChatAiPageModel extends FlutterFlowModel<ChatAiPageWidget> {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  bool aiResponding = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for aiChat_Component component.
  late AiChatComponentModel aiChatComponentModel;

  @override
  void initState(BuildContext context) {
    aiChatComponentModel = createModel(context, () => AiChatComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    aiChatComponentModel.dispose();
  }
}
