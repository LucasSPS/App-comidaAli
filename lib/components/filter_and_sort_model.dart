import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'filter_and_sort_widget.dart' show FilterAndSortWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterAndSortModel extends FlutterFlowModel<FilterAndSortWidget> {
  ///  Local state fields for this component.

  String? adType = 'Todos';

  String? orderBy = 'Novidades';

  List<String> categpories = [];
  void addToCategpories(String item) => categpories.add(item);
  void removeFromCategpories(String item) => categpories.remove(item);
  void removeAtIndexFromCategpories(int index) => categpories.removeAt(index);
  void insertAtIndexInCategpories(int index, String item) =>
      categpories.insert(index, item);
  void updateCategporiesAtIndex(int index, Function(String) updateFn) =>
      categpories[index] = updateFn(categpories[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue1;
  FormFieldController<List<String>>? choiceChipsValueController1;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue2;
  FormFieldController<List<String>>? choiceChipsValueController2;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues3;
  FormFieldController<List<String>>? choiceChipsValueController3;
  // Stores action output result for [Custom Action - filterAds] action in Button widget.
  List<AdsRecord>? retornoLista;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
