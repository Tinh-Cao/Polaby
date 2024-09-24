import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tai_khoan_widget.dart' show TaiKhoanWidget;
import 'package:flutter/material.dart';

class TaiKhoanModel extends FlutterFlowModel<TaiKhoanWidget> {
  ///  Local state fields for this page.

  String currentPage = 'account';

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
