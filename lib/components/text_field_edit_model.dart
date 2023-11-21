import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_edit_widget.dart' show TextFieldEditWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFieldEditModel extends FlutterFlowModel<TextFieldEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleController;
  String? Function(BuildContext, String?)? textFieldTitleControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldTitleFocusNode?.dispose();
    textFieldTitleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
