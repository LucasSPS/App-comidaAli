import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/sucess_sign_in_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_ad_widget.dart' show EditAdWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAdModel extends FlutterFlowModel<EditAdWidget> {
  ///  Local state fields for this page.

  LatLng? address;

  String? bairro;

  String? cidade;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleController;
  String? Function(BuildContext, String?)? textFieldTitleControllerValidator;
  // State field(s) for TextFieldDescription widget.
  FocusNode? textFieldDescriptionFocusNode;
  TextEditingController? textFieldDescriptionController;
  String? Function(BuildContext, String?)?
      textFieldDescriptionControllerValidator;
  // State field(s) for ChoiceChipsCategories widget.
  String? choiceChipsCategoriesValue;
  FormFieldController<List<String>>? choiceChipsCategoriesValueController;
  // State field(s) for Is_donation widget.
  String? isDonationValue;
  FormFieldController<List<String>>? isDonationValueController;
  // State field(s) for TextFieldCost widget.
  FocusNode? textFieldCostFocusNode;
  TextEditingController? textFieldCostController;
  String? Function(BuildContext, String?)? textFieldCostControllerValidator;
  // State field(s) for TextFieldQuantity widget.
  FocusNode? textFieldQuantityFocusNode;
  TextEditingController? textFieldQuantityController;
  String? Function(BuildContext, String?)? textFieldQuantityControllerValidator;
  DateTime? datePicked;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldTitleFocusNode?.dispose();
    textFieldTitleController?.dispose();

    textFieldDescriptionFocusNode?.dispose();
    textFieldDescriptionController?.dispose();

    textFieldCostFocusNode?.dispose();
    textFieldCostController?.dispose();

    textFieldQuantityFocusNode?.dispose();
    textFieldQuantityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
