import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'input_weight_model.dart';
export 'input_weight_model.dart';

class InputWeightWidget extends StatefulWidget {
  const InputWeightWidget({
    super.key,
    this.weight,
    this.id,
    this.date,
    this.index,
  });

  final double? weight;
  final String? id;
  final String? date;
  final int? index;

  @override
  State<InputWeightWidget> createState() => _InputWeightWidgetState();
}

class _InputWeightWidgetState extends State<InputWeightWidget> {
  late InputWeightModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputWeightModel());

    _model.textController1 ??=
        TextEditingController(text: widget.weight?.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
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
                      'Cân nặng',
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
              functions.formatDateToVietnamese(getCurrentTimestamp),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: _model.formKey2,
                  autovalidateMode: AutovalidateMode.always,
                  child: Visibility(
                    visible: widget.weight != 0.0,
                    child: TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: false,
                        labelText: 'Nhập cân nặng',
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator:
                          _model.textController1Validator.asValidator(context),
                      inputFormatters: [_model.textFieldMask1],
                    ),
                  ),
                ),
                Form(
                  key: _model.formKey1,
                  autovalidateMode: AutovalidateMode.always,
                  child: Visibility(
                    visible: widget.weight == 0.0,
                    child: TextFormField(
                      controller: _model.textController2,
                      focusNode: _model.textFieldFocusNode2,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: false,
                        labelText: 'Nhập cân nặng',
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator:
                          _model.textController2Validator.asValidator(context),
                      inputFormatters: [_model.textFieldMask2],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget.weight == 0.0) {
                        if (_model.formKey1.currentState == null ||
                            !_model.formKey1.currentState!.validate()) {
                          return;
                        }
                        _model.apiResultb6y =
                            await PolabyGroup.apiV1HealthsPOSTCall.call(
                          userId: currentUserUid,
                          type: 0,
                          value: double.tryParse(_model.textController2.text),
                          unit: 0,
                          date: functions.convertToApiDateFormatString(
                              functions.getDateNow()!.toString()),
                        );

                        if ((_model.apiResultb6y?.succeeded ?? true)) {
                          _model.healthWeightPost =
                              await PolabyGroup.apiV1HealthsGETCall.call(
                            order: 'date',
                            date: '0001-01-01',
                            userId: currentUserUid,
                            orderByDescending: false,
                            filterWeight: true,
                            filterHeight: false,
                            filterSize: false,
                            filterBloodPressureSys: false,
                            filterBloodPressureDia: false,
                            filterHeartbeat: false,
                            filterContractility: false,
                            pageIndex: 1,
                            pageSize: 30,
                            isDeleted: false,
                          );

                          FFAppState().healthWeight1 =
                              PolabyGroup.apiV1HealthsGETCall
                                  .healths(
                                    (_model.healthWeightPost?.jsonBody ?? ''),
                                  )!
                                  .toList()
                                  .cast<dynamic>();
                          FFAppState().update(() {});
                        }
                      } else {
                        if (_model.formKey2.currentState == null ||
                            !_model.formKey2.currentState!.validate()) {
                          return;
                        }
                        _model.apiResultb7y =
                            await PolabyGroup.apiV1HealthsidPUTCall.call(
                          id: widget.id,
                          value: double.tryParse(_model.textController1.text),
                          unit: 0,
                          type: 0,
                        );

                        if ((_model.apiResultb7y?.succeeded ?? true)) {
                          _model.healthWeightUpdate =
                              await PolabyGroup.apiV1HealthsGETCall.call(
                            order: 'date',
                            date: '0001-01-01',
                            userId: currentUserUid,
                            orderByDescending: false,
                            filterWeight: true,
                            filterHeight: false,
                            filterSize: false,
                            filterBloodPressureSys: false,
                            filterBloodPressureDia: false,
                            filterHeartbeat: false,
                            filterContractility: false,
                            pageIndex: 1,
                            pageSize: 30,
                            isDeleted: false,
                          );

                          FFAppState().healthWeight1 =
                              PolabyGroup.apiV1HealthsGETCall
                                  .healths(
                                    (_model.healthWeightUpdate?.jsonBody ?? ''),
                                  )!
                                  .toList()
                                  .cast<dynamic>();
                          FFAppState().update(() {});
                        }
                      }

                      Navigator.pop(context);

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
