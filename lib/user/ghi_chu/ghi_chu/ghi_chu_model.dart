import '/backend/backend.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ghi_chu_widget.dart' show GhiChuWidget;
import 'package:flutter/material.dart';

class GhiChuModel extends FlutterFlowModel<GhiChuWidget> {
  ///  Local state fields for this page.

  String currentPage = 'note';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ghi_chu widget.
  NoteRecord? noteCollection;
  // Stores action output result for [Backend Call - Create Document] action in ghi_chu widget.
  NoteRecord? noteCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in ghi_chu widget.
  NoteRecord? noteDocument;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  int? numberOfNoteDetail;
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
