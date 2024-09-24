import '/components/date_picker_birthday_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chinh_sua_thong_tin_tai_khoan_model.dart';
export 'chinh_sua_thong_tin_tai_khoan_model.dart';

class ChinhSuaThongTinTaiKhoanWidget extends StatefulWidget {
  const ChinhSuaThongTinTaiKhoanWidget({
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
    this.value,
    this.isMail,
    this.isActivity,
    this.isDiet,
  }) : isDate = isDate ?? false;

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
  final String? value;
  final bool? isMail;
  final bool? isActivity;
  final bool? isDiet;

  @override
  State<ChinhSuaThongTinTaiKhoanWidget> createState() =>
      _ChinhSuaThongTinTaiKhoanWidgetState();
}

class _ChinhSuaThongTinTaiKhoanWidgetState
    extends State<ChinhSuaThongTinTaiKhoanWidget> {
  late ChinhSuaThongTinTaiKhoanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChinhSuaThongTinTaiKhoanModel());

    _model.textController1 ??= TextEditingController(text: widget.value);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: widget.lastName);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: widget.firstName);
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: widget.height?.toString());
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??=
        TextEditingController(text: widget.weight?.toString());
    _model.textFieldFocusNode5 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: const Color(0x00FFFFFF),
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
                    if (widget.isDate == true) {
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e
                              ..dateOfBirth =
                                  '${FFAppState().year.toString()}-${functions.getMonthFromIndex(FFAppState().month) < 10 ? '0${functions.getMonthFromIndex(FFAppState().month).toString()}' : functions.getMonthFromIndex(FFAppState().month).toString()}-${functions.getDayFromIndex(FFAppState().day) < 10 ? '0${functions.getDayFromIndex(FFAppState().day).toString()}' : functions.getDayFromIndex(FFAppState().day).toString()}',
                          ),
                      );
                      safeSetState(() {});
                      context.safePop();
                    } else {
                      context.safePop();
                    }
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
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isMail == true)
                  TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController1',
                      const Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    onFieldSubmitted: (_) async {
                      if (widget.isMail == true) {
                        FFAppState().updateUserInfoStruct(
                          (e) => e
                            ..updateData(
                              (e) => e..email = widget.value,
                            ),
                        );
                        safeSetState(() {});
                      }
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).accent4,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      suffixIcon: _model.textController1!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController1?.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).accent4,
                                size: 16.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
                if ((widget.isFirstName == true) &&
                    (widget.isLastName == true))
                  TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController2',
                      const Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    onFieldSubmitted: (_) async {
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e..lastName = _model.textController2.text,
                          ),
                      );
                      safeSetState(() {});
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).accent4,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      suffixIcon: _model.textController2!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController2?.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).accent4,
                                size: 16.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    validator:
                        _model.textController2Validator.asValidator(context),
                  ),
                if ((widget.isFirstName == true) &&
                    (widget.isLastName == true))
                  TextFormField(
                    controller: _model.textController3,
                    focusNode: _model.textFieldFocusNode3,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController3',
                      const Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    onFieldSubmitted: (_) async {
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e..firstName = _model.textController3.text,
                          ),
                      );
                      safeSetState(() {});
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).accent4,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      suffixIcon: _model.textController3!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController3?.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).accent4,
                                size: 16.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    validator:
                        _model.textController3Validator.asValidator(context),
                  ),
                if (widget.isHeight == true)
                  TextFormField(
                    controller: _model.textController4,
                    focusNode: _model.textFieldFocusNode4,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController4',
                      const Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    onFieldSubmitted: (_) async {
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e
                              ..height =
                                  double.tryParse(_model.textController4.text),
                          ),
                      );
                      safeSetState(() {});
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).accent4,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      suffixIcon: _model.textController4!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController4?.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).accent4,
                                size: 16.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator:
                        _model.textController4Validator.asValidator(context),
                  ),
                if (widget.isWeight == true)
                  TextFormField(
                    controller: _model.textController5,
                    focusNode: _model.textFieldFocusNode5,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController5',
                      const Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    onFieldSubmitted: (_) async {
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e
                              ..initialWeight =
                                  double.tryParse(_model.textController5.text),
                          ),
                      );
                      safeSetState(() {});
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).accent4,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      suffixIcon: _model.textController5!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController5?.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).accent4,
                                size: 16.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator:
                        _model.textController5Validator.asValidator(context),
                  ),
                if (widget.isActivity == true)
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController1 ??=
                        FormFieldController<String>(
                      _model.dropDownValue1 ??= widget.value,
                    ),
                    options: const ['Nhẹ nhàng', 'Trung bình', 'Nặng'],
                    onChanged: (val) async {
                      safeSetState(() => _model.dropDownValue1 = val);
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e
                              ..frequencyOfActivity = () {
                                if (_model.dropDownValue1 == 'Nhẹ nhàng') {
                                  return 0;
                                } else if (_model.dropDownValue1 ==
                                    'Trung bình') {
                                  return 1;
                                } else {
                                  return 2;
                                }
                              }(),
                          ),
                      );
                      safeSetState(() {});
                    },
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).accent4,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                if (widget.isDiet == true)
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController2 ??=
                        FormFieldController<String>(
                      _model.dropDownValue2 ??= widget.value,
                    ),
                    options: const [
                      'Ăn chay',
                      'Ăn 30-90g thịt,../ngày',
                      'Ăn > 90g thịt,../ngày'
                    ],
                    onChanged: (val) async {
                      safeSetState(() => _model.dropDownValue2 = val);
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e
                              ..diet = () {
                                if (_model.dropDownValue2 == 'Ăn chay') {
                                  return 0;
                                } else if (_model.dropDownValue2 ==
                                    'Ăn 30-90g thịt,../ngày') {
                                  return 1;
                                } else {
                                  return 2;
                                }
                              }(),
                          ),
                      );
                      safeSetState(() {});
                    },
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).accent4,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                if (widget.isDate == true)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                child: const DatePickerBirthdayWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((widget.isDate == true) &&
                                (FFAppState().day == 0))
                              Text(
                                valueOrDefault<String>(
                                  widget.value,
                                  '20',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if ((FFAppState().day != 0) &&
                                ((FFAppState().month != 0) &&
                                    (FFAppState().year != 0)))
                              Text(
                                '${functions.getDayFromIndex(FFAppState().day) < 10 ? '0${functions.getDayFromIndex(FFAppState().day).toString()}' : functions.getDayFromIndex(FFAppState().day).toString()}/${functions.getMonthFromIndex(FFAppState().month) < 10 ? '0${functions.getMonthFromIndex(FFAppState().month).toString()}' : functions.getMonthFromIndex(FFAppState().month).toString()}/${FFAppState().year.toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ]
                  .divide(const SizedBox(height: 8.0))
                  .addToStart(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
