import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/sucess_sign_in_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'login_signup_widget.dart' show LoginSignupWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginSignupModel extends FlutterFlowModel<LoginSignupWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldLoginEmail widget.
  FocusNode? textFieldLoginEmailFocusNode;
  TextEditingController? textFieldLoginEmailController;
  String? Function(BuildContext, String?)?
      textFieldLoginEmailControllerValidator;
  String? _textFieldLoginEmailControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'O texto informado não pertence a um endereço de e-mail válido!';
    }
    return null;
  }

  // State field(s) for TextFieldLoginSenha widget.
  FocusNode? textFieldLoginSenhaFocusNode;
  TextEditingController? textFieldLoginSenhaController;
  late bool textFieldLoginSenhaVisibility;
  String? Function(BuildContext, String?)?
      textFieldLoginSenhaControllerValidator;
  String? _textFieldLoginSenhaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextFieldTitleNome widget.
  FocusNode? textFieldTitleNomeFocusNode;
  TextEditingController? textFieldTitleNomeController;
  String? Function(BuildContext, String?)?
      textFieldTitleNomeControllerValidator;
  String? _textFieldTitleNomeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    if (val.length < 3) {
      return 'Por favor, preencha ao menos 3 caracteres';
    }

    if (!RegExp('^[a-zA-ZÀ-ÿ\\s.]*\$').hasMatch(val)) {
      return 'Caracter não permitido foi encontrado!';
    }
    return null;
  }

  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  String? _textFieldEmailControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório!';
    }

    if (val.length < 1) {
      return 'Por favor, insira um endereço de e-mail válido.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'O texto informado não pertence a um endereço de e-mail válido!';
    }
    return null;
  }

  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode;
  TextEditingController? textFieldSenhaController;
  late bool textFieldSenhaVisibility;
  String? Function(BuildContext, String?)? textFieldSenhaControllerValidator;
  String? _textFieldSenhaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 8) {
      return 'Senha muito curta, use 8 ou mais caracteres.';
    }

    return null;
  }

  // State field(s) for TextFieldConfirm widget.
  FocusNode? textFieldConfirmFocusNode;
  TextEditingController? textFieldConfirmController;
  late bool textFieldConfirmVisibility;
  String? Function(BuildContext, String?)? textFieldConfirmControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldLoginEmailControllerValidator =
        _textFieldLoginEmailControllerValidator;
    textFieldLoginSenhaVisibility = false;
    textFieldLoginSenhaControllerValidator =
        _textFieldLoginSenhaControllerValidator;
    textFieldTitleNomeControllerValidator =
        _textFieldTitleNomeControllerValidator;
    textFieldEmailControllerValidator = _textFieldEmailControllerValidator;
    textFieldSenhaVisibility = false;
    textFieldSenhaControllerValidator = _textFieldSenhaControllerValidator;
    textFieldConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldLoginEmailFocusNode?.dispose();
    textFieldLoginEmailController?.dispose();

    textFieldLoginSenhaFocusNode?.dispose();
    textFieldLoginSenhaController?.dispose();

    textFieldTitleNomeFocusNode?.dispose();
    textFieldTitleNomeController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailController?.dispose();

    textFieldSenhaFocusNode?.dispose();
    textFieldSenhaController?.dispose();

    textFieldConfirmFocusNode?.dispose();
    textFieldConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
