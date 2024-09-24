import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserInfoUpdate')) {
        try {
          final serializedData = prefs.getString('ff_UserInfoUpdate') ?? '{}';
          _UserInfoUpdate =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _Token = prefs.getString('ff_Token') ?? _Token;
    });
    _safeInit(() {
      _refreshToken = prefs.getString('ff_refreshToken') ?? _refreshToken;
    });
    _safeInit(() {
      _accessTokenExpiryTime = prefs.containsKey('ff_accessTokenExpiryTime')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_accessTokenExpiryTime')!)
          : _accessTokenExpiryTime;
    });
    _safeInit(() {
      _selectedIndex = prefs.getInt('ff_selectedIndex') ?? _selectedIndex;
    });
    _safeInit(() {
      _pregnantWeek = prefs.getString('ff_pregnantWeek') ?? _pregnantWeek;
    });
    _safeInit(() {
      _pregnantTime = prefs.getString('ff_pregnantTime') ?? _pregnantTime;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_UserInfo')) {
        try {
          final serializedData = prefs.getString('ff_UserInfo') ?? '{}';
          _UserInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _PostComunity = prefs
              .getStringList('ff_PostComunity')
              ?.map((x) {
                try {
                  return PostComunityStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _PostComunity;
    });
    _safeInit(() {
      _day = prefs.getInt('ff_day') ?? _day;
    });
    _safeInit(() {
      _month = prefs.getInt('ff_month') ?? _month;
    });
    _safeInit(() {
      _year = prefs.getInt('ff_year') ?? _year;
    });
    _safeInit(() {
      _premiumSelection =
          prefs.getBool('ff_premiumSelection') ?? _premiumSelection;
    });
    _safeInit(() {
      _freemiumSelection =
          prefs.getBool('ff_freemiumSelection') ?? _freemiumSelection;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_loginInfo')) {
        try {
          final serializedData = prefs.getString('ff_loginInfo') ?? '{}';
          _loginInfo =
              LoginInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _UserInfoUpdate =
      UserStruct.fromSerializableMap(jsonDecode('{\"id\":\"\"}'));
  UserStruct get UserInfoUpdate => _UserInfoUpdate;
  set UserInfoUpdate(UserStruct value) {
    _UserInfoUpdate = value;
    prefs.setString('ff_UserInfoUpdate', value.serialize());
  }

  void updateUserInfoUpdateStruct(Function(UserStruct) updateFn) {
    updateFn(_UserInfoUpdate);
    prefs.setString('ff_UserInfoUpdate', _UserInfoUpdate.serialize());
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String value) {
    _Token = value;
    prefs.setString('ff_Token', value);
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString('ff_refreshToken', value);
  }

  DateTime? _accessTokenExpiryTime =
      DateTime.fromMillisecondsSinceEpoch(1724513400000);
  DateTime? get accessTokenExpiryTime => _accessTokenExpiryTime;
  set accessTokenExpiryTime(DateTime? value) {
    _accessTokenExpiryTime = value;
    value != null
        ? prefs.setInt('ff_accessTokenExpiryTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_accessTokenExpiryTime');
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    prefs.setInt('ff_selectedIndex', value);
  }

  String _pregnantWeek = '';
  String get pregnantWeek => _pregnantWeek;
  set pregnantWeek(String value) {
    _pregnantWeek = value;
    prefs.setString('ff_pregnantWeek', value);
  }

  String _pregnantTime = '';
  String get pregnantTime => _pregnantTime;
  set pregnantTime(String value) {
    _pregnantTime = value;
    prefs.setString('ff_pregnantTime', value);
  }

  UserInfoStruct _UserInfo = UserInfoStruct();
  UserInfoStruct get UserInfo => _UserInfo;
  set UserInfo(UserInfoStruct value) {
    _UserInfo = value;
    prefs.setString('ff_UserInfo', value.serialize());
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_UserInfo);
    prefs.setString('ff_UserInfo', _UserInfo.serialize());
  }

  List<PostComunityStruct> _PostComunity = [];
  List<PostComunityStruct> get PostComunity => _PostComunity;
  set PostComunity(List<PostComunityStruct> value) {
    _PostComunity = value;
    prefs.setStringList(
        'ff_PostComunity', value.map((x) => x.serialize()).toList());
  }

  void addToPostComunity(PostComunityStruct value) {
    PostComunity.add(value);
    prefs.setStringList(
        'ff_PostComunity', _PostComunity.map((x) => x.serialize()).toList());
  }

  void removeFromPostComunity(PostComunityStruct value) {
    PostComunity.remove(value);
    prefs.setStringList(
        'ff_PostComunity', _PostComunity.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPostComunity(int index) {
    PostComunity.removeAt(index);
    prefs.setStringList(
        'ff_PostComunity', _PostComunity.map((x) => x.serialize()).toList());
  }

  void updatePostComunityAtIndex(
    int index,
    PostComunityStruct Function(PostComunityStruct) updateFn,
  ) {
    PostComunity[index] = updateFn(_PostComunity[index]);
    prefs.setStringList(
        'ff_PostComunity', _PostComunity.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPostComunity(int index, PostComunityStruct value) {
    PostComunity.insert(index, value);
    prefs.setStringList(
        'ff_PostComunity', _PostComunity.map((x) => x.serialize()).toList());
  }

  int _day = 0;
  int get day => _day;
  set day(int value) {
    _day = value;
    prefs.setInt('ff_day', value);
  }

  int _month = 0;
  int get month => _month;
  set month(int value) {
    _month = value;
    prefs.setInt('ff_month', value);
  }

  int _year = 0;
  int get year => _year;
  set year(int value) {
    _year = value;
    prefs.setInt('ff_year', value);
  }

  List<String> _noteList = [];
  List<String> get noteList => _noteList;
  set noteList(List<String> value) {
    _noteList = value;
  }

  void addToNoteList(String value) {
    noteList.add(value);
  }

  void removeFromNoteList(String value) {
    noteList.remove(value);
  }

  void removeAtIndexFromNoteList(int index) {
    noteList.removeAt(index);
  }

  void updateNoteListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    noteList[index] = updateFn(_noteList[index]);
  }

  void insertAtIndexInNoteList(int index, String value) {
    noteList.insert(index, value);
  }

  List<bool> _selectedNote = [];
  List<bool> get selectedNote => _selectedNote;
  set selectedNote(List<bool> value) {
    _selectedNote = value;
  }

  void addToSelectedNote(bool value) {
    selectedNote.add(value);
  }

  void removeFromSelectedNote(bool value) {
    selectedNote.remove(value);
  }

  void removeAtIndexFromSelectedNote(int index) {
    selectedNote.removeAt(index);
  }

  void updateSelectedNoteAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    selectedNote[index] = updateFn(_selectedNote[index]);
  }

  void insertAtIndexInSelectedNote(int index, bool value) {
    selectedNote.insert(index, value);
  }

  bool _isPosted = false;
  bool get isPosted => _isPosted;
  set isPosted(bool value) {
    _isPosted = value;
  }

  List<double> _weightList = [];
  List<double> get weightList => _weightList;
  set weightList(List<double> value) {
    _weightList = value;
  }

  void addToWeightList(double value) {
    weightList.add(value);
  }

  void removeFromWeightList(double value) {
    weightList.remove(value);
  }

  void removeAtIndexFromWeightList(int index) {
    weightList.removeAt(index);
  }

  void updateWeightListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    weightList[index] = updateFn(_weightList[index]);
  }

  void insertAtIndexInWeightList(int index, double value) {
    weightList.insert(index, value);
  }

  List<double> _sizeList = [];
  List<double> get sizeList => _sizeList;
  set sizeList(List<double> value) {
    _sizeList = value;
  }

  void addToSizeList(double value) {
    sizeList.add(value);
  }

  void removeFromSizeList(double value) {
    sizeList.remove(value);
  }

  void removeAtIndexFromSizeList(int index) {
    sizeList.removeAt(index);
  }

  void updateSizeListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    sizeList[index] = updateFn(_sizeList[index]);
  }

  void insertAtIndexInSizeList(int index, double value) {
    sizeList.insert(index, value);
  }

  List<double> _bloodSysList = [];
  List<double> get bloodSysList => _bloodSysList;
  set bloodSysList(List<double> value) {
    _bloodSysList = value;
  }

  void addToBloodSysList(double value) {
    bloodSysList.add(value);
  }

  void removeFromBloodSysList(double value) {
    bloodSysList.remove(value);
  }

  void removeAtIndexFromBloodSysList(int index) {
    bloodSysList.removeAt(index);
  }

  void updateBloodSysListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    bloodSysList[index] = updateFn(_bloodSysList[index]);
  }

  void insertAtIndexInBloodSysList(int index, double value) {
    bloodSysList.insert(index, value);
  }

  List<double> _bloodDiaList = [];
  List<double> get bloodDiaList => _bloodDiaList;
  set bloodDiaList(List<double> value) {
    _bloodDiaList = value;
  }

  void addToBloodDiaList(double value) {
    bloodDiaList.add(value);
  }

  void removeFromBloodDiaList(double value) {
    bloodDiaList.remove(value);
  }

  void removeAtIndexFromBloodDiaList(int index) {
    bloodDiaList.removeAt(index);
  }

  void updateBloodDiaListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    bloodDiaList[index] = updateFn(_bloodDiaList[index]);
  }

  void insertAtIndexInBloodDiaList(int index, double value) {
    bloodDiaList.insert(index, value);
  }

  String _dateNote = '';
  String get dateNote => _dateNote;
  set dateNote(String value) {
    _dateNote = value;
  }

  int _filterState = 0;
  int get filterState => _filterState;
  set filterState(int value) {
    _filterState = value;
  }

  String _search = '';
  String get search => _search;
  set search(String value) {
    _search = value;
  }

  bool _premiumSelection = true;
  bool get premiumSelection => _premiumSelection;
  set premiumSelection(bool value) {
    _premiumSelection = value;
    prefs.setBool('ff_premiumSelection', value);
  }

  bool _freemiumSelection = false;
  bool get freemiumSelection => _freemiumSelection;
  set freemiumSelection(bool value) {
    _freemiumSelection = value;
    prefs.setBool('ff_freemiumSelection', value);
  }

  List<dynamic> _star = [];
  List<dynamic> get star => _star;
  set star(List<dynamic> value) {
    _star = value;
  }

  void addToStar(dynamic value) {
    star.add(value);
  }

  void removeFromStar(dynamic value) {
    star.remove(value);
  }

  void removeAtIndexFromStar(int index) {
    star.removeAt(index);
  }

  void updateStarAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    star[index] = updateFn(_star[index]);
  }

  void insertAtIndexInStar(int index, dynamic value) {
    star.insert(index, value);
  }

  double _updateWeight = 0.0;
  double get updateWeight => _updateWeight;
  set updateWeight(double value) {
    _updateWeight = value;
  }

  double _updateSize = 0.0;
  double get updateSize => _updateSize;
  set updateSize(double value) {
    _updateSize = value;
  }

  double _updateBloodSys = 0.0;
  double get updateBloodSys => _updateBloodSys;
  set updateBloodSys(double value) {
    _updateBloodSys = value;
  }

  double _updateBloodDia = 0.0;
  double get updateBloodDia => _updateBloodDia;
  set updateBloodDia(double value) {
    _updateBloodDia = value;
  }

  int _weekPost = 0;
  int get weekPost => _weekPost;
  set weekPost(int value) {
    _weekPost = value;
  }

  bool _isMenuSaved = false;
  bool get isMenuSaved => _isMenuSaved;
  set isMenuSaved(bool value) {
    _isMenuSaved = value;
  }

  LoginInfoStruct _loginInfo = LoginInfoStruct();
  LoginInfoStruct get loginInfo => _loginInfo;
  set loginInfo(LoginInfoStruct value) {
    _loginInfo = value;
    prefs.setString('ff_loginInfo', value.serialize());
  }

  void updateLoginInfoStruct(Function(LoginInfoStruct) updateFn) {
    updateFn(_loginInfo);
    prefs.setString('ff_loginInfo', _loginInfo.serialize());
  }

  List<dynamic> _healthWeight1 = [];
  List<dynamic> get healthWeight1 => _healthWeight1;
  set healthWeight1(List<dynamic> value) {
    _healthWeight1 = value;
  }

  void addToHealthWeight1(dynamic value) {
    healthWeight1.add(value);
  }

  void removeFromHealthWeight1(dynamic value) {
    healthWeight1.remove(value);
  }

  void removeAtIndexFromHealthWeight1(int index) {
    healthWeight1.removeAt(index);
  }

  void updateHealthWeight1AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    healthWeight1[index] = updateFn(_healthWeight1[index]);
  }

  void insertAtIndexInHealthWeight1(int index, dynamic value) {
    healthWeight1.insert(index, value);
  }

  List<dynamic> _healthSize = [];
  List<dynamic> get healthSize => _healthSize;
  set healthSize(List<dynamic> value) {
    _healthSize = value;
  }

  void addToHealthSize(dynamic value) {
    healthSize.add(value);
  }

  void removeFromHealthSize(dynamic value) {
    healthSize.remove(value);
  }

  void removeAtIndexFromHealthSize(int index) {
    healthSize.removeAt(index);
  }

  void updateHealthSizeAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    healthSize[index] = updateFn(_healthSize[index]);
  }

  void insertAtIndexInHealthSize(int index, dynamic value) {
    healthSize.insert(index, value);
  }

  final _ingredientManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> ingredient({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _ingredientManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearIngredientCache() => _ingredientManager.clear();
  void clearIngredientCacheKey(String? uniqueKey) =>
      _ingredientManager.clearRequest(uniqueKey);

  final _mealManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> meal({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _mealManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMealCache() => _mealManager.clear();
  void clearMealCacheKey(String? uniqueKey) =>
      _mealManager.clearRequest(uniqueKey);

  final _nutrientManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> nutrient({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _nutrientManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNutrientCache() => _nutrientManager.clear();
  void clearNutrientCacheKey(String? uniqueKey) =>
      _nutrientManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
