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
import 'chinh_sua_thong_tin_thai_ky_model.dart';
export 'chinh_sua_thong_tin_thai_ky_model.dart';

class ChinhSuaThongTinThaiKyWidget extends StatefulWidget {
  const ChinhSuaThongTinThaiKyWidget({
    super.key,
    this.txtTitle,
    this.babyName,
    bool? isDate,
    this.date,
    this.sex,
    bool? isGender,
    bool? isName,
    bool? isYearOfBirth,
    this.yearOfBirth,
    this.pregnantWeek,
    bool? isPregnantWeek,
    this.dueDate,
    bool? isDueDate,
  })  : isDate = isDate ?? false,
        isGender = isGender ?? false,
        isName = isName ?? false,
        isYearOfBirth = isYearOfBirth ?? false,
        isPregnantWeek = isPregnantWeek ?? false,
        isDueDate = isDueDate ?? false;

  final String? txtTitle;
  final String? babyName;
  final bool isDate;
  final DateTime? date;
  final String? sex;
  final bool isGender;
  final bool isName;
  final bool isYearOfBirth;
  final String? yearOfBirth;
  final String? pregnantWeek;
  final bool isPregnantWeek;
  final String? dueDate;
  final bool isDueDate;

  @override
  State<ChinhSuaThongTinThaiKyWidget> createState() =>
      _ChinhSuaThongTinThaiKyWidgetState();
}

class _ChinhSuaThongTinThaiKyWidgetState
    extends State<ChinhSuaThongTinThaiKyWidget> {
  late ChinhSuaThongTinThaiKyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChinhSuaThongTinThaiKyModel());

    _model.textController ??= TextEditingController(text: widget.babyName);
    _model.textFieldFocusNode ??= FocusNode();

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
                    if (widget.isYearOfBirth == true) {
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e
                              ..dueDate =
                                  '${FFAppState().year.toString()}-${functions.getMonthFromIndex(FFAppState().month) < 10 ? '0${functions.getMonthFromIndex(FFAppState().month).toString()}' : functions.getMonthFromIndex(FFAppState().month).toString()}-${functions.getDayFromIndex(FFAppState().day) < 10 ? '0${functions.getDayFromIndex(FFAppState().day).toString()}' : functions.getDayFromIndex(FFAppState().day).toString()}',
                          ),
                      );
                      safeSetState(() {});
                    } else {
                      if (widget.isPregnantWeek == true) {
                        FFAppState().updateUserInfoStruct(
                          (e) => e
                            ..updateData(
                              (e) => e,
                            ),
                        );
                        safeSetState(() {});
                      }
                    }

                    context.safePop();
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isName == true)
                  TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    onFieldSubmitted: (_) async {
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e..babyName = _model.textController.text,
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      suffixIcon: _model.textController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController?.clear();
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
                        _model.textControllerValidator.asValidator(context),
                  ),
                if (widget.isGender == true)
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= widget.sex,
                    ),
                    options: const ['Trai', 'Gái', 'Không biết'],
                    onChanged: (val) async {
                      safeSetState(() => _model.dropDownValue = val);
                      FFAppState().updateUserInfoStruct(
                        (e) => e
                          ..updateData(
                            (e) => e
                              ..babyGender = () {
                                if (_model.dropDownValue == 'Trai') {
                                  return 1;
                                } else if (_model.dropDownValue == 'Gái') {
                                  return 2;
                                } else {
                                  return 0;
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
                    borderRadius: 16.0,
                    margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                if (widget.isYearOfBirth == true)
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
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((widget.isDate == true) &&
                                (FFAppState().day == 0))
                              Text(
                                valueOrDefault<String>(
                                  widget.yearOfBirth,
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
