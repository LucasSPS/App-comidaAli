import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switch_edit_model.dart';
export 'switch_edit_model.dart';

class SwitchEditWidget extends StatefulWidget {
  const SwitchEditWidget({Key? key}) : super(key: key);

  @override
  _SwitchEditWidgetState createState() => _SwitchEditWidgetState();
}

class _SwitchEditWidgetState extends State<SwitchEditWidget> {
  late SwitchEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchEditModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Switch(
      value: _model.switchValue ??= _model.active,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
      },
      activeColor: FlutterFlowTheme.of(context).customColor1,
      activeTrackColor: Color(0x5E2FB73C),
      inactiveTrackColor: Color(0xB8C6C6C6),
      inactiveThumbColor: Color(0xFF848484),
    );
  }
}
