import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'input_health_model.dart';
export 'input_health_model.dart';

class InputHealthWidget extends StatefulWidget {
  const InputHealthWidget({
    super.key,
    this.date,
    bool? isWeight,
    bool? isSize,
    this.value,
    bool? isBloodSys,
    bool? isBloodDia,
    this.bloodDia,
    this.bloodSys,
    this.id,
    this.id2,
  })  : isWeight = isWeight ?? false,
        isSize = isSize ?? false,
        isBloodSys = isBloodSys ?? false,
        isBloodDia = isBloodDia ?? false;

  final DateTime? date;
  final bool isWeight;
  final bool isSize;
  final double? value;
  final bool isBloodSys;
  final bool isBloodDia;
  final double? bloodDia;
  final double? bloodSys;
  final String? id;
  final String? id2;

  @override
  State<InputHealthWidget> createState() => _InputHealthWidgetState();
}

class _InputHealthWidgetState extends State<InputHealthWidget> {
  late InputHealthModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputHealthModel());

    _model.textController1 ??= TextEditingController(
        text: widget.isBloodSys == true
            ? widget.bloodSys?.toString()
            : widget.value?.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.bloodDia?.toString());
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent4,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      () {
                        if (widget.isWeight == true) {
                          return 'Cân nặng';
                        } else if (widget.isSize == true) {
                          return 'Vòng bụng';
                        } else {
                          return 'Huyết áp';
                        }
                      }(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Expanded(
                      child: Opacity(
                        opacity: 0.0,
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Text(
                            'Mới nhất',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 8.0))
                      .addToEnd(const SizedBox(width: 8.0)),
                ),
              ].divide(const SizedBox(height: 8.0)).addToStart(const SizedBox(height: 4.0)),
            ),
            Text(
              functions.formatDateToVietnamese(widget.date!),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            TextFormField(
              controller: _model.textController1,
              focusNode: _model.textFieldFocusNode1,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                isDense: false,
                labelText: () {
                  if (widget.isWeight == true) {
                    return 'Nhập cân nặng';
                  } else if (widget.isSize == true) {
                    return 'Nhập vòng bụng';
                  } else if (widget.isBloodSys == true) {
                    return 'Huyết áp tâm thu';
                  } else {
                    return 'Nhập huyết áp';
                  }
                }(),
                labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _model.textController1Validator.asValidator(context),
            ),
            if (widget.isBloodDia == true)
              TextFormField(
                controller: _model.textController2,
                focusNode: _model.textFieldFocusNode2,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: false,
                  labelText: 'Huyết áp tâm trương',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: _model.textController2Validator.asValidator(context),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget.isWeight == true) {
                        if (widget.value == 0.0) {
                          _model.apiResultb6y =
                              await PolabyGroup.apiV1HealthsPOSTCall.call(
                            userId: currentUserUid,
                            type: 0,
                            value: double.tryParse(_model.textController1.text),
                            unit: 0,
                            date: functions.convertToApiDateFormatString(
                                widget.date!.toString()),
                          );
                        } else {
                          _model.apiResultbt6y =
                              await PolabyGroup.apiV1HealthsidPUTCall.call(
                            id: widget.id,
                            value: double.tryParse(_model.textController1.text),
                            unit: 0,
                            type: 0,
                          );
                        }

                        if (((_model.apiResultb6y?.succeeded ?? true) ==
                                true) ||
                            (_model.apiResultbt6y?.succeeded ?? true)) {
                          FFAppState().updateWeight =
                              double.parse(_model.textController1.text);
                          safeSetState(() {});
                          Navigator.pop(context);
                        }
                      } else {
                        if (widget.isSize == true) {
                          if (widget.value == 0.0) {
                            _model.apiResultb7y =
                                await PolabyGroup.apiV1HealthsPOSTCall.call(
                              userId: currentUserUid,
                              type: 2,
                              value:
                                  double.tryParse(_model.textController1.text),
                              unit: 1,
                              date: functions.convertToApiDateFormatString(
                                  widget.date!.toString()),
                            );
                          } else {
                            _model.apiResultbty =
                                await PolabyGroup.apiV1HealthsidPUTCall.call(
                              id: widget.id,
                              value:
                                  double.tryParse(_model.textController1.text),
                              unit: 1,
                              type: 2,
                            );
                          }

                          if (((_model.apiResultb7y?.succeeded ?? true) ==
                                  true) ||
                              (_model.apiResultbty?.succeeded ?? true)) {
                            FFAppState().updateSize =
                                double.parse(_model.textController1.text);
                            safeSetState(() {});
                            Navigator.pop(context);
                          }
                        } else {
                          if ((widget.bloodDia == 0.0) &&
                              (widget.bloodSys == 0.0)) {
                            await Future.wait([
                              Future(() async {
                                _model.apiResultb8y =
                                    await PolabyGroup.apiV1HealthsPOSTCall.call(
                                  userId: currentUserUid,
                                  type: 3,
                                  value: double.tryParse(
                                      _model.textController1.text),
                                  unit: 2,
                                  date: functions.convertToApiDateFormatString(
                                      widget.date!.toString()),
                                );
                              }),
                              Future(() async {
                                _model.apiResultb9y =
                                    await PolabyGroup.apiV1HealthsPOSTCall.call(
                                  userId: currentUserUid,
                                  type: 4,
                                  value: double.tryParse(
                                      _model.textController2.text),
                                  unit: 2,
                                  date: functions.convertToApiDateFormatString(
                                      widget.date!.toString()),
                                );
                              }),
                            ]);
                            if (((_model.apiResultb8y?.succeeded ?? true) ==
                                    true) &&
                                (_model.apiResultb9y?.succeeded ?? true)) {
                              FFAppState().updateBloodSys =
                                  double.parse(_model.textController1.text);
                              FFAppState().updateBloodDia =
                                  double.parse(_model.textController2.text);
                              safeSetState(() {});
                              Navigator.pop(context);
                            }
                          } else {
                            await Future.wait([
                              Future(() async {
                                _model.apiResultb10y = await PolabyGroup
                                    .apiV1HealthsidPUTCall
                                    .call(
                                  id: widget.id,
                                  value: double.tryParse(
                                      _model.textController1.text),
                                  unit: 2,
                                  type: 3,
                                );
                              }),
                              Future(() async {
                                _model.apiResultb11y = await PolabyGroup
                                    .apiV1HealthsidPUTCall
                                    .call(
                                  id: widget.id2,
                                  value: double.tryParse(
                                      _model.textController2.text),
                                  unit: 2,
                                  type: 4,
                                );
                              }),
                            ]);
                            if (((_model.apiResultb10y?.succeeded ?? true) ==
                                    true) &&
                                (_model.apiResultb11y?.succeeded ?? true)) {
                              FFAppState().updateBloodSys =
                                  double.parse(_model.textController1.text);
                              FFAppState().updateBloodDia =
                                  double.parse(_model.textController2.text);
                              safeSetState(() {});
                              Navigator.pop(context);
                            }
                          }
                        }
                      }

                      safeSetState(() {});
                    },
                    text: 'Lưu',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(const SizedBox(height: 16.0)).addToEnd(const SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
