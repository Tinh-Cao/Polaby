import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'thong_bao_widget.dart' show ThongBaoWidget;
import 'package:flutter/material.dart';

class ThongBaoModel extends FlutterFlowModel<ThongBaoWidget> {
  ///  Local state fields for this page.

  String currentPage = 'notification';

  ///  State fields for stateful widgets in this page.

  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
