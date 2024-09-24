import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'display_item_search_model.dart';
export 'display_item_search_model.dart';

class DisplayItemSearchWidget extends StatefulWidget {
  const DisplayItemSearchWidget({
    super.key,
    this.value,
  });

  final String? value;

  @override
  State<DisplayItemSearchWidget> createState() =>
      _DisplayItemSearchWidgetState();
}

class _DisplayItemSearchWidgetState extends State<DisplayItemSearchWidget> {
  late DisplayItemSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayItemSearchModel());

    _model.textController ??= TextEditingController(text: widget.value);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(1.0, 0.0),
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            onFieldSubmitted: (_) async {
              FFAppState().search = _model.textController.text;
              _model.updatePage(() {});
            },
            autofocus: false,
            textInputAction: TextInputAction.search,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              alignLabelWithHint: false,
              hintText: 'Tìm kiếm',
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: const Color(0xFF909095),
                    letterSpacing: 0.0,
                  ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: FlutterFlowTheme.of(context).accent4,
                size: 22.0,
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                ),
            textAlign: TextAlign.start,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
        if (_model.textController.text != '')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                safeSetState(() {
                  _model.textController?.clear();
                });
                FFAppState().search = _model.textController.text;
                _model.updatePage(() {});
              },
              child: Icon(
                Icons.clear_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 16.0,
              ),
            ),
          ),
      ],
    );
  }
}
