import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_and_sort_model.dart';
export 'filter_and_sort_model.dart';

class FilterAndSortWidget extends StatefulWidget {
  const FilterAndSortWidget({
    Key? key,
    this.adsList,
  }) : super(key: key);

  final List<AdsRecord>? adsList;

  @override
  _FilterAndSortWidgetState createState() => _FilterAndSortWidgetState();
}

class _FilterAndSortWidgetState extends State<FilterAndSortWidget> {
  late FilterAndSortModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterAndSortModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
          Material(
            color: Colors.transparent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFC9CBCF),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Tipos de anuncios',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('Todos', Icons.check_box_rounded),
                                  ChipData('Doações', Icons.money_off_outlined),
                                  ChipData('Pagos', Icons.attach_money)
                                ],
                                onChanged: (val) => setState(() =>
                                    _model.choiceChipsValue1 = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  iconSize: 20.0,
                                  elevation: 1.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFE8E5E5),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF525353),
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  iconColor: Color(0xFF5E6161),
                                  iconSize: 20.0,
                                  elevation: 0.0,
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue1 != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController1 ??=
                                        FormFieldController<List<String>>(
                                  [FFAppState().filterAdType],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Ordenar',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('Novidades', Icons.star_rounded),
                                  ChipData('Vencimento Prox.',
                                      Icons.arrow_downward_rounded),
                                  ChipData('Vencimento Dist.',
                                      Icons.arrow_upward_rounded)
                                ],
                                onChanged: (val) => setState(() =>
                                    _model.choiceChipsValue2 = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  iconSize: 20.0,
                                  elevation: 1.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFE8E5E5),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF525353),
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  iconColor: Color(0xFF5E6161),
                                  iconSize: 20.0,
                                  elevation: 0.0,
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue2 != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController2 ??=
                                        FormFieldController<List<String>>(
                                  [FFAppState().filterSortBy],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Categorias',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 100.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: FFAppState()
                                    .categories
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValues3 = val),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  iconSize: 0.0,
                                  elevation: 1.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFE8E5E5),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF525353),
                                        fontWeight: FontWeight.normal,
                                      ),
                                  iconColor: Color(0x00000000),
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: true,
                                initialized: _model.choiceChipsValues3 != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController3 ??=
                                        FormFieldController<List<String>>(
                                  FFAppState().filterCategoriesSelected,
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if ((FFAppState().filterAdType != 'Todos') ||
                    (FFAppState().filterSortBy != 'Novidades') ||
                    (FFAppState().filterCategoriesSelected.length > 0))
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 60.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            FFAppState().filterAdType = 'Todos';
                            FFAppState().filterSortBy = 'Novidades';
                            FFAppState().filterCategoriesSelected = [];
                          });
                          Navigator.pop(context, widget.adsList);
                        },
                        text: 'Limpar Filtros',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).customColor3,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.retornoLista = await actions.filterAds(
                        _model.choiceChipsValue1!,
                        _model.choiceChipsValue2!,
                        _model.choiceChipsValues3?.toList(),
                        widget.adsList?.toList(),
                      );
                      if (_model.choiceChipsValues3?.length != null) {
                        setState(() {
                          FFAppState().filterAdType = _model.choiceChipsValue1!;
                          FFAppState().filterSortBy = _model.choiceChipsValue2!;
                          FFAppState().filterCategoriesSelected = _model
                              .choiceChipsValues3!
                              .toList()
                              .cast<String>();
                        });
                      } else {
                        setState(() {
                          FFAppState().filterAdType = _model.choiceChipsValue1!;
                          FFAppState().filterSortBy = _model.choiceChipsValue2!;
                        });
                      }

                      Navigator.pop(context, _model.retornoLista);

                      setState(() {});
                    },
                    text: 'Aplicar',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
