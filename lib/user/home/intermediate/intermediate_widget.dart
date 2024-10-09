import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'intermediate_model.dart';
export 'intermediate_model.dart';

class IntermediateWidget extends StatefulWidget {
  const IntermediateWidget({super.key});

  @override
  State<IntermediateWidget> createState() => _IntermediateWidgetState();
}

class _IntermediateWidgetState extends State<IntermediateWidget> {
  late IntermediateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntermediateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      _model.getUserInfoV1 = await PolabyGroup.apiV1AccountsidGETCall.call(
        id: currentUserUid,
      );

      if ((_model.getUserInfoV1?.succeeded ?? true)) {
        if (PolabyGroup.apiV1AccountsidGETCall.role(
              (_model.getUserInfoV1?.jsonBody ?? ''),
            ) ==
            'Expert') {
          FFAppState().updateUserInfoStruct(
            (e) => e
              ..updateData(
                (e) => e
                  ..firstName = PolabyGroup.apiV1AccountsidGETCall.firstName(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..lastName = PolabyGroup.apiV1AccountsidGETCall.lastName(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..gender = PolabyGroup.apiV1AccountsidGETCall.gender(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..dateOfBirth =
                      PolabyGroup.apiV1AccountsidGETCall.dateOfBirth(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..image = PolabyGroup.apiV1AccountsidGETCall.image(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..email = PolabyGroup.apiV1AccountsidGETCall.email(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..emailConfirmed =
                      PolabyGroup.apiV1AccountsidGETCall.emailConfirmed(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..role = PolabyGroup.apiV1AccountsidGETCall.role(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..clinicAddress =
                      PolabyGroup.apiV1AccountsidGETCall.clinicAddress(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..description =
                      PolabyGroup.apiV1AccountsidGETCall.description(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..education = PolabyGroup.apiV1AccountsidGETCall.education(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..yearsOfExperience = PolabyGroup.apiV1AccountsidGETCall
                      .yesrsOfExperience(
                        (_model.getUserInfoV1?.jsonBody ?? ''),
                      )
                      ?.toString()
                  ..workplace = PolabyGroup.apiV1AccountsidGETCall.workplace(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..level = PolabyGroup.apiV1AccountsidGETCall
                      .level(
                        (_model.getUserInfoV1?.jsonBody ?? ''),
                      )
                      ?.toString()
                  ..id = PolabyGroup.apiV1AccountsidGETCall.id(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  )
                  ..isDeleted = PolabyGroup.apiV1AccountsidGETCall.isDeleted(
                    (_model.getUserInfoV1?.jsonBody ?? ''),
                  ),
              ),
          );
          FFAppState().update(() {});
          await Future.delayed(const Duration(milliseconds: 1500));

          context.goNamed('cong_dong_chuyen_gia');
        } else {
          FFAppState().UserInfo = UserInfoStruct.maybeFromMap(
              (_model.getUserInfoV1?.jsonBody ?? ''))!;
          FFAppState().update(() {});
          await Future.delayed(const Duration(milliseconds: 1500));

          context.goNamed('trang_chu');
        }
      }
    });

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
        body: Container(
          decoration: const BoxDecoration(),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/Logo.svg',
              width: 120.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
