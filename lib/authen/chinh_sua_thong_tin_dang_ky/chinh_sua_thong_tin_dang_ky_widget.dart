import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chinh_sua_thong_tin_dang_ky_model.dart';
export 'chinh_sua_thong_tin_dang_ky_model.dart';

class ChinhSuaThongTinDangKyWidget extends StatefulWidget {
  const ChinhSuaThongTinDangKyWidget({
    super.key,
    this.txtTitle,
    this.lastName,
    bool? isDate,
    this.isFirstName,
    this.isLastName,
    this.isHeight,
    this.isWeight,
    this.firstName,
    this.height,
    this.weight,
    this.date,
  }) : isDate = isDate ?? true;

  final String? txtTitle;
  final String? lastName;
  final bool isDate;
  final bool? isFirstName;
  final bool? isLastName;
  final bool? isHeight;
  final bool? isWeight;
  final String? firstName;
  final double? height;
  final double? weight;
  final DateTime? date;

  @override
  State<ChinhSuaThongTinDangKyWidget> createState() =>
      _ChinhSuaThongTinDangKyWidgetState();
}

class _ChinhSuaThongTinDangKyWidgetState
    extends State<ChinhSuaThongTinDangKyWidget> {
  late ChinhSuaThongTinDangKyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChinhSuaThongTinDangKyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.displayDate = widget.date;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController(text: widget.lastName);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: widget.firstName);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: widget.height?.toString());
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: widget.weight?.toString());
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              if (_model.formKey.currentState == null ||
                  !_model.formKey.currentState!.validate()) {
                return;
              }

              context.pushNamed(
                'thong_tin_dang_ky_ca_nhan',
                queryParameters: {
                  'lastName': serializeParam(
                    _model.textController1.text,
                    ParamType.String,
                  ),
                  'firstName': serializeParam(
                    _model.textController2.text,
                    ParamType.String,
                  ),
                  'dateOfBirth': serializeParam(
                    _model.displayDate,
                    ParamType.DateTime,
                  ),
                  'height': serializeParam(
                    double.tryParse(_model.textController3.text),
                    ParamType.double,
                  ),
                  'weight': serializeParam(
                    double.tryParse(_model.textController4.text),
                    ParamType.double,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 200),
                  ),
                },
              );
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.txtTitle,
              'Tên',
            ),
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.isLastName == true)
                      Flexible(
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController1',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            if (widget.isFirstName == true) {
                              _model.firstName = _model.textController1.text;
                            } else {
                              if (widget.isLastName == true) {
                                _model.lastName = _model.textController1.text;
                              }
                            }
                          },
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            alignLabelWithHint: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.textController1!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController1?.clear();
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                      widget.isFirstName == true,
                      false,
                    ))
                      Flexible(
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController2',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            if (widget.isFirstName == true) {
                              _model.firstName = _model.textController2.text;
                            } else {
                              if (widget.isLastName == true) {
                                _model.lastName = _model.textController2.text;
                              }
                            }
                          },
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            alignLabelWithHint: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.textController2!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController2?.clear();
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                      widget.isHeight == true,
                      false,
                    ))
                      Flexible(
                        child: TextFormField(
                          controller: _model.textController3,
                          focusNode: _model.textFieldFocusNode3,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController3',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            if (widget.isFirstName == true) {
                              _model.firstName = _model.textController3.text;
                            } else {
                              if (widget.isLastName == true) {
                                _model.lastName = _model.textController3.text;
                              }
                            }
                          },
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            alignLabelWithHint: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.textController3!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController3?.clear();
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                          validator: _model.textController3Validator
                              .asValidator(context),
                          inputFormatters: [_model.textFieldMask3],
                        ),
                      ),
                    if (valueOrDefault<bool>(
                      widget.isWeight == true,
                      false,
                    ))
                      Flexible(
                        child: TextFormField(
                          controller: _model.textController4,
                          focusNode: _model.textFieldFocusNode4,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController4',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            if (widget.isFirstName == true) {
                              _model.firstName = _model.textController4.text;
                            } else {
                              if (widget.isLastName == true) {
                                _model.lastName = _model.textController4.text;
                              }
                            }
                          },
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            alignLabelWithHint: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.textController4!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController4?.clear();
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                          validator: _model.textController4Validator
                              .asValidator(context),
                          inputFormatters: [_model.textFieldMask4],
                        ),
                      ),
                    if (widget.isDate == true)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet<bool>(
                              context: context,
                              builder: (context) {
                                return ScrollConfiguration(
                                  behavior:
                                      const MaterialScrollBehavior().copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.mouse,
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.stylus,
                                      PointerDeviceKind.unknown
                                    },
                                  ),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: MediaQuery.of(context).size.width,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      minimumDate:
                                          (DateTime.fromMicrosecondsSinceEpoch(
                                                  150048000000000) ??
                                              DateTime(1900)),
                                      initialDateTime:
                                          (widget.date ?? DateTime.now()),
                                      maximumDate: (getCurrentTimestamp ??
                                          DateTime(2050)),
                                      use24hFormat: false,
                                      onDateTimeChanged: (newDateTime) =>
                                          safeSetState(() {
                                        _model.datePicked = newDateTime;
                                      }),
                                    ),
                                  ),
                                );
                              });
                          _model.displayDate = _model.datePicked;
                          safeSetState(() {});
                        },
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.date != null)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    dateTimeFormat(
                                      "d/M/y",
                                      widget.date,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              if (widget.date == null)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    dateTimeFormat(
                                      "d/M/y",
                                      _model.displayDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
