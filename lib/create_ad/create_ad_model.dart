import '/auth/firebase_auth/auth_util.dart';
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
import 'create_ad_widget.dart' show CreateAdWidget;
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

class CreateAdModel extends FlutterFlowModel<CreateAdWidget> {
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
  String? _textFieldTitleControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (val.length < 8) {
      return 'Título inválido. Mínimo 08 caracteres.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for TextFieldDescription widget.
  FocusNode? textFieldDescriptionFocusNode;
  TextEditingController? textFieldDescriptionController;
  String? Function(BuildContext, String?)?
      textFieldDescriptionControllerValidator;
  String? _textFieldDescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (val.length < 8) {
      return 'Descrição inválida. Mínimo 08 caracteres.';
    }
    if (val.length > 150) {
      return 'Maximum 150 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ChoiceChipsCategories widget.
  String? choiceChipsCategoriesValue;
  FormFieldController<List<String>>? choiceChipsCategoriesValueController;
  // State field(s) for Is_donation_chip widget.
  String? isDonationChipValue;
  FormFieldController<List<String>>? isDonationChipValueController;
  // State field(s) for TextFieldCost widget.
  FocusNode? textFieldCostFocusNode;
  TextEditingController? textFieldCostController;
  String? Function(BuildContext, String?)? textFieldCostControllerValidator;
  String? _textFieldCostControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldQuantity widget.
  FocusNode? textFieldQuantityFocusNode;
  TextEditingController? textFieldQuantityController;
  String? Function(BuildContext, String?)? textFieldQuantityControllerValidator;
  String? _textFieldQuantityControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (val.length < 1) {
      return 'Informe uma quantidade entre 1 e 999';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[1-9]\\d{0,2}\$').hasMatch(val)) {
      return 'Caracter inválido encontrado, digite somente número entre 1 e 999.';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldTitleControllerValidator = _textFieldTitleControllerValidator;
    textFieldDescriptionControllerValidator =
        _textFieldDescriptionControllerValidator;
    textFieldCostControllerValidator = _textFieldCostControllerValidator;
    textFieldQuantityControllerValidator =
        _textFieldQuantityControllerValidator;
  }

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
