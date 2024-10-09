import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  PolabyMobileAuthUser? initialUser;
  PolabyMobileAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(PolabyMobileAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? const IntermediateWidget() : const ChaoMungWidget(),
        errorRoute: state.uri.toString(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? const IntermediateWidget() : const ChaoMungWidget(),
          ),
        ),
        FFRoute(
          name: 'chao_mung',
          path: '/chaoMung',
          builder: (context, params) => const ChaoMungWidget(),
        ),
        FFRoute(
          name: 'dang_nhap',
          path: '/dangNhap',
          builder: (context, params) => const DangNhapWidget(),
        ),
        FFRoute(
          name: 'dang_ky',
          path: '/dangKy',
          builder: (context, params) => const DangKyWidget(),
        ),
        FFRoute(
          name: 'thoi_gian_mang_thai',
          path: '/thoiGianMangThai',
          builder: (context, params) => ThoiGianMangThaiWidget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'ngay_dau_tien_chu_ky',
          path: '/ngayDauTienChuKy',
          builder: (context, params) => NgayDauTienChuKyWidget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'tuan_thu_che_do_an_nao',
          path: '/tuanThuCheDoAnNao',
          builder: (context, params) => TuanThuCheDoAnNaoWidget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            dueDate: params.getParam(
              'dueDate',
              ParamType.String,
            ),
            pregnantWeek: params.getParam(
              'pregnantWeek',
              ParamType.String,
            ),
            pregnantTime: params.getParam(
              'pregnantTime',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'hoat_dong_the_chat',
          path: '/hoatDongTheChat',
          builder: (context, params) => HoatDongTheChatWidget(
            diet: params.getParam(
              'diet',
              ParamType.int,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            dueDate: params.getParam(
              'dueDate',
              ParamType.String,
            ),
            pregnantTime: params.getParam(
              'pregnantTime',
              ParamType.String,
            ),
            pregnantWeek: params.getParam(
              'pregnantWeek',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'tan_suat_cang_thang',
          path: '/tanSuatCangThang',
          builder: (context, params) => TanSuatCangThangWidget(
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            diet: params.getParam(
              'diet',
              ParamType.int,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
            dueDate: params.getParam(
              'dueDate',
              ParamType.String,
            ),
            pregnantTime: params.getParam(
              'pregnantTime',
              ParamType.String,
            ),
            pregnantWeek: params.getParam(
              'pregnantWeek',
              ParamType.String,
            ),
            activity: params.getParam(
              'activity',
              ParamType.int,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'buoc_cuoi_cung_ten_be',
          path: '/buocCuoiCungTenBe',
          builder: (context, params) => BuocCuoiCungTenBeWidget(
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
            diet: params.getParam(
              'diet',
              ParamType.int,
            ),
            activity: params.getParam(
              'activity',
              ParamType.int,
            ),
            stress: params.getParam(
              'stress',
              ParamType.int,
            ),
            dueDate: params.getParam(
              'dueDate',
              ParamType.String,
            ),
            pregnantTime: params.getParam(
              'pregnantTime',
              ParamType.String,
            ),
            pregnantWeek: params.getParam(
              'pregnantWeek',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'chuc_mung',
          path: '/chucMung',
          builder: (context, params) => ChucMungWidget(
            dueDate: params.getParam(
              'dueDate',
              ParamType.String,
            ),
            pregnantWeek: params.getParam(
              'pregnantWeek',
              ParamType.String,
            ),
            pregnantTime: params.getParam(
              'pregnantTime',
              ParamType.String,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'thong_tin_dang_ky_ca_nhan',
          path: '/thongTinDangKyCaNhan',
          builder: (context, params) => ThongTinDangKyCaNhanWidget(
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'trang_chu',
          path: '/trangChu',
          builder: (context, params) => TrangChuWidget(
            txtWieght: params.getParam(
              'txtWieght',
              ParamType.String,
            ),
            newValue: params.getParam(
              'newValue',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'kiem_tra_mail',
          path: '/kiemTraMail',
          builder: (context, params) => KiemTraMailWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'bai_viet_tuan',
          path: '/baiVietTuan',
          builder: (context, params) => BaiVietTuanWidget(
            txtContent: params.getParam(
              'txtContent',
              ParamType.String,
            ),
            week: params.getParam(
              'week',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'chinh_sua_thong_tin_dang_ky',
          path: '/chinhSuaThongTinDangKy',
          builder: (context, params) => ChinhSuaThongTinDangKyWidget(
            txtTitle: params.getParam(
              'txtTitle',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            isDate: params.getParam(
              'isDate',
              ParamType.bool,
            ),
            isFirstName: params.getParam(
              'isFirstName',
              ParamType.bool,
            ),
            isLastName: params.getParam(
              'isLastName',
              ParamType.bool,
            ),
            isHeight: params.getParam(
              'isHeight',
              ParamType.bool,
            ),
            isWeight: params.getParam(
              'isWeight',
              ParamType.bool,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
            date: params.getParam(
              'date',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'an_toan_thuc_pham',
          path: '/anToanThucPham',
          builder: (context, params) => AnToanThucPhamWidget(
            txtName: params.getParam(
              'txtName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'khong_an_toan',
          path: '/khongAnToan',
          builder: (context, params) => KhongAnToanWidget(
            txtName: params.getParam(
              'txtName',
              ParamType.String,
            ),
            isSafed: params.getParam(
              'isSafed',
              ParamType.bool,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'tra_cuu_dinh_duong',
          path: '/traCuuDinhDuong',
          builder: (context, params) => TraCuuDinhDuongWidget(
            txtText: params.getParam(
              'txtText',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ghi_chu',
          path: '/ghiChu',
          builder: (context, params) => const GhiChuWidget(),
        ),
        FFRoute(
          name: 'tai_khoan',
          path: '/taiKhoan',
          builder: (context, params) => TaiKhoanWidget(
            txtUserName: params.getParam(
              'txtUserName',
              ParamType.String,
            ),
            txtEmail: params.getParam(
              'txtEmail',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'thong_tin_ca_nhan',
          path: '/thongTinCaNhan',
          builder: (context, params) => const ThongTinCaNhanWidget(),
        ),
        FFRoute(
          name: 'thong_tin_thai_ky',
          path: '/thongTinThaiKy',
          builder: (context, params) => ThongTinThaiKyWidget(
            txtEmail: params.getParam(
              'txtEmail',
              ParamType.String,
            ),
            txtUserName: params.getParam(
              'txtUserName',
              ParamType.String,
            ),
            txtYearOfBirth: params.getParam(
              'txtYearOfBirth',
              ParamType.String,
            ),
            txtHeight: params.getParam(
              'txtHeight',
              ParamType.String,
            ),
            txtWeight: params.getParam(
              'txtWeight',
              ParamType.String,
            ),
            txtPassword: params.getParam(
              'txtPassword',
              ParamType.String,
            ),
            txtBabyName: params.getParam(
              'txtBabyName',
              ParamType.String,
            ),
            txtBabySex: params.getParam(
              'txtBabySex',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'cong_dong',
          path: '/congDong',
          builder: (context, params) => CongDongWidget(
            txtUserName: params.getParam(
              'txtUserName',
              ParamType.String,
            ),
            txtCreationDate: params.getParam(
              'txtCreationDate',
              ParamType.String,
            ),
            txtContent: params.getParam(
              'txtContent',
              ParamType.String,
            ),
            txtLikeCount: params.getParam(
              'txtLikeCount',
              ParamType.String,
            ),
            txtCommentCount: params.getParam(
              'txtCommentCount',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'bai_viet_cua_ban',
          path: '/baiVietCuaBan',
          builder: (context, params) => BaiVietCuaBanWidget(
            txtUserName: params.getParam(
              'txtUserName',
              ParamType.String,
            ),
            txtCreationDate: params.getParam(
              'txtCreationDate',
              ParamType.String,
            ),
            txtContent: params.getParam(
              'txtContent',
              ParamType.String,
            ),
            txtLikeCount: params.getParam(
              'txtLikeCount',
              ParamType.String,
            ),
            txtCommentCount: params.getParam(
              'txtCommentCount',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'tuan_hien_tai_thai_ky',
          path: '/tuanHienTaiThaiKy',
          builder: (context, params) => TuanHienTaiThaiKyWidget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'ngay_sinh_du_kien',
          path: '/ngaySinhDuKien',
          builder: (context, params) => NgaySinhDuKienWidget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            dateOfBirth: params.getParam(
              'dateOfBirth',
              ParamType.DateTime,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'tham_khao_thuc_don',
          path: '/thamKhaoThucDon',
          builder: (context, params) => ThamKhaoThucDonWidget(
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'nhu_cau_dinh_duong',
          path: '/nhuCauDinhDuong',
          builder: (context, params) => const NhuCauDinhDuongWidget(),
        ),
        FFRoute(
          name: 'chi_tiet',
          path: '/chiTiet',
          builder: (context, params) => ChiTietWidget(
            postUserID: params.getParam(
              'postUserID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'cong_dong_chuyen_gia',
          path: '/congDongChuyenGia',
          builder: (context, params) => CongDongChuyenGiaWidget(
            txtUserName: params.getParam(
              'txtUserName',
              ParamType.String,
            ),
            txtCreationDate: params.getParam(
              'txtCreationDate',
              ParamType.String,
            ),
            txtContent: params.getParam(
              'txtContent',
              ParamType.String,
            ),
            txtLikeCount: params.getParam(
              'txtLikeCount',
              ParamType.String,
            ),
            txtCommentCount: params.getParam(
              'txtCommentCount',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'chi_tiet_tai_khoan_expert',
          path: '/chiTietTaiKhoanExpert',
          builder: (context, params) => const ChiTietTaiKhoanExpertWidget(),
        ),
        FFRoute(
          name: 'thong_bao',
          path: '/thongBao',
          builder: (context, params) => const ThongBaoWidget(),
        ),
        FFRoute(
          name: 'lich',
          path: '/lich',
          builder: (context, params) => const LichWidget(),
        ),
        FFRoute(
          name: 'chinh_sua_thong_tin_tai_khoan',
          path: '/chinhSuaThongTinTaiKhoan',
          builder: (context, params) => ChinhSuaThongTinTaiKhoanWidget(
            txtTitle: params.getParam(
              'txtTitle',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            isDate: params.getParam(
              'isDate',
              ParamType.bool,
            ),
            isFirstName: params.getParam(
              'isFirstName',
              ParamType.bool,
            ),
            isLastName: params.getParam(
              'isLastName',
              ParamType.bool,
            ),
            isHeight: params.getParam(
              'isHeight',
              ParamType.bool,
            ),
            isWeight: params.getParam(
              'isWeight',
              ParamType.bool,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
            date: params.getParam(
              'date',
              ParamType.DateTime,
            ),
            value: params.getParam(
              'value',
              ParamType.String,
            ),
            isMail: params.getParam(
              'isMail',
              ParamType.bool,
            ),
            isActivity: params.getParam(
              'isActivity',
              ParamType.bool,
            ),
            isDiet: params.getParam(
              'isDiet',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'can_nang_hang_ngay',
          path: '/canNangHangNgay',
          builder: (context, params) => const CanNangHangNgayWidget(),
        ),
        FFRoute(
          name: 'chinh_sua_thong_tin_thai_ky',
          path: '/chinhSuaThongTinThaiKy',
          builder: (context, params) => ChinhSuaThongTinThaiKyWidget(
            txtTitle: params.getParam(
              'txtTitle',
              ParamType.String,
            ),
            babyName: params.getParam(
              'babyName',
              ParamType.String,
            ),
            isDate: params.getParam(
              'isDate',
              ParamType.bool,
            ),
            date: params.getParam(
              'date',
              ParamType.DateTime,
            ),
            sex: params.getParam(
              'sex',
              ParamType.String,
            ),
            isGender: params.getParam(
              'isGender',
              ParamType.bool,
            ),
            isName: params.getParam(
              'isName',
              ParamType.bool,
            ),
            isYearOfBirth: params.getParam(
              'isYearOfBirth',
              ParamType.bool,
            ),
            yearOfBirth: params.getParam(
              'yearOfBirth',
              ParamType.String,
            ),
            pregnantWeek: params.getParam(
              'pregnantWeek',
              ParamType.String,
            ),
            isPregnantWeek: params.getParam(
              'isPregnantWeek',
              ParamType.bool,
            ),
            dueDate: params.getParam(
              'dueDate',
              ParamType.String,
            ),
            isDueDate: params.getParam(
              'isDueDate',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'vong_bung_hang_ngay',
          path: '/vongBungHangNgay',
          builder: (context, params) => const VongBungHangNgayWidget(),
        ),
        FFRoute(
          name: 'chi_tiet_nguoidung',
          path: '/chiTietNguoidung',
          builder: (context, params) => ChiTietNguoidungWidget(
            postUserID: params.getParam(
              'postUserID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Intermediate',
          path: '/intermediate',
          builder: (context, params) => const IntermediateWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/chaoMung';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 32.0,
                    height: 32.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
