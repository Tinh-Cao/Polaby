import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/info_component/display_item_search/display_item_search_widget.dart';
import 'an_toan_thuc_pham_widget.dart' show AnToanThucPhamWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AnToanThucPhamModel extends FlutterFlowModel<AnToanThucPhamWidget> {
  ///  Local state fields for this page.

  bool? isSafe;

  ///  State fields for stateful widgets in this page.

  // Model for displayItemSearch component.
  late DisplayItemSearchModel displayItemSearchModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  @override
  void initState(BuildContext context) {
    displayItemSearchModel =
        createModel(context, () => DisplayItemSearchModel());
  }

  @override
  void dispose() {
    displayItemSearchModel.dispose();
    listViewPagingController2?.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewApiV1SafefoodsGETPage2);
  }

  void listViewApiV1SafefoodsGETPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker)
          .then((listViewApiV1SafefoodsGETResponse) {
        final pageItems = (PolabyGroup.apiV1SafefoodsGETCall.safeFoods(
                  listViewApiV1SafefoodsGETResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewApiV1SafefoodsGETResponse,
                )
              : null,
        );
      });
}
