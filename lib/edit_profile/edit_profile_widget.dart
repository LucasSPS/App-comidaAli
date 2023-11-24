import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.yourNameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode ??= FocusNode();

    _model.yourEmailController ??=
        TextEditingController(text: currentUserEmail);
    _model.yourEmailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      )
          ? PreferredSize(
              preferredSize: Size.fromHeight(46.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    if (_model.uploadedFileUrl1 != null &&
                        _model.uploadedFileUrl1 != '') {
                      await FirebaseStorage.instance
                          .refFromURL(_model.uploadedFileUrl1)
                          .delete();
                      setState(() {
                        _model.isDataUploading1 = false;
                        _model.uploadedLocalFile1 =
                            FFUploadedFile(bytes: Uint8List.fromList([]));
                        _model.uploadedFileUrl1 = '';
                      });
                    }
                    if (_model.uploadedFileUrl2 != null &&
                        _model.uploadedFileUrl2 != '') {
                      await FirebaseStorage.instance
                          .refFromURL(_model.uploadedFileUrl2)
                          .delete();
                      setState(() {
                        _model.isDataUploading2 = false;
                        _model.uploadedLocalFile2 =
                            FFUploadedFile(bytes: Uint8List.fromList([]));
                        _model.uploadedFileUrl2 = '';
                      });
                    }
                    context.safePop();
                  },
                ),
                title: Text(
                  'Editar Perfil',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF14181B),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
            )
          : null,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if ((currentUserPhoto == null || currentUserPhoto == '') &&
                        (_model.uploadedFileUrl1 == null ||
                            _model.uploadedFileUrl1 == '') &&
                        (_model.uploadedFileUrl2 == null ||
                            _model.uploadedFileUrl2 == ''))
                      AuthUserStreamWidget(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: 104.0,
                                height: 104.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 14.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Enviando arquivo...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl1 =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(
                                          context, 'Enviado com sucesso!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Falha ao enviar arquivo');
                                      return;
                                    }
                                  }

                                  setState(() {
                                    FFAppState().addToTempImagesPath(
                                        _model.uploadedFileUrl1);
                                  });
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 2.0, 4.0, 2.0),
                                      child: Text(
                                        'Adicionar foto',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if ((currentUserPhoto != null && currentUserPhoto != '') ||
                        (_model.uploadedFileUrl1 != null &&
                            _model.uploadedFileUrl1 != '') ||
                        (_model.uploadedFileUrl2 != null &&
                            _model.uploadedFileUrl2 != ''))
                      AuthUserStreamWidget(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context).secondary,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 2.0, 2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    () {
                                      if (_model.uploadedFileUrl1 != null &&
                                          _model.uploadedFileUrl1 != '') {
                                        return _model.uploadedFileUrl1;
                                      } else if (_model.uploadedFileUrl2 !=
                                              null &&
                                          _model.uploadedFileUrl2 != '') {
                                        return _model.uploadedFileUrl2;
                                      } else {
                                        return currentUserPhoto;
                                      }
                                    }(),
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.uploadedFileUrl1 != null &&
                                      _model.uploadedFileUrl1 != '') {
                                    await FirebaseStorage.instance
                                        .refFromURL(_model.uploadedFileUrl1)
                                        .delete();
                                    setState(() {
                                      _model.isDataUploading1 = false;
                                      _model.uploadedLocalFile1 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl1 = '';
                                    });
                                  }
                                  if (_model.uploadedFileUrl2 != null &&
                                      _model.uploadedFileUrl2 != '') {
                                    await FirebaseStorage.instance
                                        .refFromURL(_model.uploadedFileUrl2)
                                        .delete();
                                    setState(() {
                                      _model.isDataUploading2 = false;
                                      _model.uploadedLocalFile2 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl2 = '';
                                    });
                                  }
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading2 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Enviando arquivo...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile2 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl2 =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(
                                          context, 'Enviado com sucesso!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Falha ao enviar arquivo');
                                      return;
                                    }
                                  }
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 2.0, 4.0, 2.0),
                                      child: Text(
                                        'Mudar foto',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.yourNameController,
                            focusNode: _model.yourNameFocusNode,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F4F8),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDF3F3F),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDF3F3F),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 0.0, 16.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.0,
                                ),
                            validator: _model.yourNameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Text(
                        'E-mail',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: TextFormField(
                          controller: _model.yourEmailController,
                          focusNode: _model.yourEmailFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.yourEmailController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF1F4F8),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDF3F3F),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDF3F3F),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 0.0, 16.0),
                            suffixIcon:
                                _model.yourEmailController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.yourEmailController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFFDF3F3F),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.0,
                                  ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.yourEmailControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+\$'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitThreeBounce(
                            color: Color(0xFFB0B2B7),
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> buttonUsersRecordList = snapshot.data!;
                    return FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (_model.yourEmailController.text !=
                            currentUserEmail) {
                          _model.emailError = await actions.emailIsUsed(
                            buttonUsersRecordList.toList(),
                            _model.yourEmailController.text,
                          );
                          _shouldSetState = true;
                          if (_model.emailError!) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'E-mail já cadastrado ou incorreto!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }
                        }
                        if ((_model.yourEmailController.text ==
                                currentUserEmail) &&
                            (_model.yourNameController.text ==
                                currentUserDisplayName) &&
                            (_model.uploadedFileUrl2 == null ||
                                _model.uploadedFileUrl2 == '')) {
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                        if ((_model.yourEmailController.text ==
                                currentUserEmail) &&
                            (_model.yourNameController.text ==
                                currentUserDisplayName) &&
                            (_model.uploadedFileUrl2 != null &&
                                _model.uploadedFileUrl2 != '')) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(_model.uploadedFileUrl2),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );

                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.uploadedFileUrl2,
                          ));

                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.uploadedFileUrl2,
                          ));
                        } else if ((_model.yourEmailController.text ==
                                currentUserEmail) &&
                            (_model.yourNameController.text !=
                                currentUserDisplayName) &&
                            (_model.uploadedFileUrl2 == null ||
                                _model.uploadedFileUrl2 == '')) {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            displayName: _model.yourNameController.text,
                          ));
                        } else if ((_model.yourEmailController.text ==
                                currentUserEmail) &&
                            (_model.yourNameController.text !=
                                currentUserDisplayName) &&
                            (_model.uploadedFileUrl2 != null &&
                                _model.uploadedFileUrl2 != '')) {
                          await FirebaseStorage.instance
                              .refFromURL(currentUserPhoto)
                              .delete();

                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.uploadedFileUrl2 != null &&
                                    _model.uploadedFileUrl2 != ''
                                ? _model.uploadedFileUrl2
                                : _model.uploadedFileUrl1,
                            displayName: _model.yourNameController.text,
                          ));
                        } else if ((_model.yourEmailController.text !=
                                currentUserEmail) &&
                            (_model.yourNameController.text ==
                                currentUserDisplayName) &&
                            (_model.uploadedFileUrl2 == null ||
                                _model.uploadedFileUrl2 == '')) {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            email: _model.yourEmailController.text,
                          ));
                        } else if ((_model.yourEmailController.text !=
                                currentUserEmail) &&
                            (_model.yourNameController.text ==
                                currentUserDisplayName) &&
                            (_model.uploadedFileUrl2 != null &&
                                _model.uploadedFileUrl2 != '')) {
                          await FirebaseStorage.instance
                              .refFromURL(currentUserPhoto)
                              .delete();

                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.uploadedFileUrl2 != null &&
                                    _model.uploadedFileUrl2 != ''
                                ? _model.uploadedFileUrl2
                                : _model.uploadedFileUrl1,
                            email: _model.yourEmailController.text,
                          ));
                        } else if ((_model.yourEmailController.text !=
                                currentUserEmail) &&
                            (_model.yourNameController.text !=
                                currentUserDisplayName) &&
                            (_model.uploadedFileUrl2 == null ||
                                _model.uploadedFileUrl2 == '')) {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            displayName: _model.yourNameController.text,
                            email: _model.yourEmailController.text,
                          ));
                        } else {
                          await FirebaseStorage.instance
                              .refFromURL(currentUserPhoto)
                              .delete();

                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.uploadedFileUrl2 != null &&
                                    _model.uploadedFileUrl2 != ''
                                ? _model.uploadedFileUrl2
                                : _model.uploadedFileUrl1,
                            email: _model.yourEmailController.text,
                            displayName: _model.yourNameController.text,
                          ));
                        }

                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('Fim'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );

                        context.goNamed('profileMain');

                        if (_shouldSetState) setState(() {});
                      },
                      text: 'Salvar mudanças',
                      options: FFButtonOptions(
                        width: 340.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
