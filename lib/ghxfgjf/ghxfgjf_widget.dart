import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ghxfgjf_model.dart';
export 'ghxfgjf_model.dart';

class GhxfgjfWidget extends StatefulWidget {
  const GhxfgjfWidget({super.key});

  static String routeName = 'ghxfgjf';
  static String routePath = '/ghxfgjf';

  @override
  State<GhxfgjfWidget> createState() => _GhxfgjfWidgetState();
}

class _GhxfgjfWidgetState extends State<GhxfgjfWidget> {
  late GhxfgjfModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GhxfgjfModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              '',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
