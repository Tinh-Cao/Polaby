import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Polaby Group Code

class PolabyGroup {
  static String getBaseUrl() => 'https://polabyapiv1.azurewebsites.net';
  static Map<String, String> headers = {
    'ngrok-skip-browser-warning': '69420',
  };
  static ApiV1AccountsPOSTCall apiV1AccountsPOSTCall = ApiV1AccountsPOSTCall();
  static ApiV1AccountsGETCall apiV1AccountsGETCall = ApiV1AccountsGETCall();
  static ApiV1AccountsidGETCall apiV1AccountsidGETCall =
      ApiV1AccountsidGETCall();
  static ApiV1AccountsidDELETECall apiV1AccountsidDELETECall =
      ApiV1AccountsidDELETECall();
  static ApiV1AccountsidUserPUTCall apiV1AccountsidUserPUTCall =
      ApiV1AccountsidUserPUTCall();
  static ApiV1AccountsidExpertPUTCall apiV1AccountsidExpertPUTCall =
      ApiV1AccountsidExpertPUTCall();
  static ApiV1AccountsidRestorePUTCall apiV1AccountsidRestorePUTCall =
      ApiV1AccountsidRestorePUTCall();
  static ApiV1AuthenticationRegisterPOSTCall
      apiV1AuthenticationRegisterPOSTCall =
      ApiV1AuthenticationRegisterPOSTCall();
  static ApiV1AuthenticationLoginPOSTCall apiV1AuthenticationLoginPOSTCall =
      ApiV1AuthenticationLoginPOSTCall();
  static ApiV1AuthenticationTokenRefreshPOSTCall
      apiV1AuthenticationTokenRefreshPOSTCall =
      ApiV1AuthenticationTokenRefreshPOSTCall();
  static ApiV1AuthenticationEmailVerifyGETCall
      apiV1AuthenticationEmailVerifyGETCall =
      ApiV1AuthenticationEmailVerifyGETCall();
  static ApiV1AuthenticationEmailResendVerificationPOSTCall
      apiV1AuthenticationEmailResendVerificationPOSTCall =
      ApiV1AuthenticationEmailResendVerificationPOSTCall();
  static ApiV1AuthenticationPasswordChangePOSTCall
      apiV1AuthenticationPasswordChangePOSTCall =
      ApiV1AuthenticationPasswordChangePOSTCall();
  static ApiV1AuthenticationPasswordForgotPOSTCall
      apiV1AuthenticationPasswordForgotPOSTCall =
      ApiV1AuthenticationPasswordForgotPOSTCall();
  static ApiV1AuthenticationPasswordResetPOSTCall
      apiV1AuthenticationPasswordResetPOSTCall =
      ApiV1AuthenticationPasswordResetPOSTCall();
  static ApiV1AuthenticationLoginGoogleGETCall
      apiV1AuthenticationLoginGoogleGETCall =
      ApiV1AuthenticationLoginGoogleGETCall();
  static ApiV1CommentsPOSTCall apiV1CommentsPOSTCall = ApiV1CommentsPOSTCall();
  static ApiV1CommentsGETCall apiV1CommentsGETCall = ApiV1CommentsGETCall();
  static ApiV1CommentsidPUTCall apiV1CommentsidPUTCall =
      ApiV1CommentsidPUTCall();
  static ApiV1CommentsidDELETECall apiV1CommentsidDELETECall =
      ApiV1CommentsidDELETECall();
  static ApiV1CommunityPostsPOSTCall apiV1CommunityPostsPOSTCall =
      ApiV1CommunityPostsPOSTCall();
  static ApiV1CommunityPostsGETCall apiV1CommunityPostsGETCall =
      ApiV1CommunityPostsGETCall();
  static ApiV1CommunityPostsidPUTCall apiV1CommunityPostsidPUTCall =
      ApiV1CommunityPostsidPUTCall();
  static ApiV1CommunityPostsidDELETECall apiV1CommunityPostsidDELETECall =
      ApiV1CommunityPostsidDELETECall();
  static ApiV1DishesPOSTCall apiV1DishesPOSTCall = ApiV1DishesPOSTCall();
  static ApiV1DishesGETCall apiV1DishesGETCall = ApiV1DishesGETCall();
  static ApiV1DishesDishIngredientsPOSTCall apiV1DishesDishIngredientsPOSTCall =
      ApiV1DishesDishIngredientsPOSTCall();
  static ApiV1DishesidPUTCall apiV1DishesidPUTCall = ApiV1DishesidPUTCall();
  static ApiV1DishesidDELETECall apiV1DishesidDELETECall =
      ApiV1DishesidDELETECall();
  static ApiV1DishesDishIngredientsdishIdingredientIdDELETECall
      apiV1DishesDishIngredientsdishIdingredientIdDELETECall =
      ApiV1DishesDishIngredientsdishIdingredientIdDELETECall();
  static ApiV1FollowsPOSTCall apiV1FollowsPOSTCall = ApiV1FollowsPOSTCall();
  static ApiV1FollowsDELETECall apiV1FollowsDELETECall =
      ApiV1FollowsDELETECall();
  static ApiV1HealthsPOSTCall apiV1HealthsPOSTCall = ApiV1HealthsPOSTCall();
  static ApiV1HealthsGETCall apiV1HealthsGETCall = ApiV1HealthsGETCall();
  static ApiV1HealthsidPUTCall apiV1HealthsidPUTCall = ApiV1HealthsidPUTCall();
  static ApiV1HealthsidDELETECall apiV1HealthsidDELETECall =
      ApiV1HealthsidDELETECall();
  static ApiV1IngredientsPOSTCall apiV1IngredientsPOSTCall =
      ApiV1IngredientsPOSTCall();
  static ApiV1IngredientsGETCall apiV1IngredientsGETCall =
      ApiV1IngredientsGETCall();
  static ApiV1IngredientsidPUTCall apiV1IngredientsidPUTCall =
      ApiV1IngredientsidPUTCall();
  static ApiV1IngredientsidDELETECall apiV1IngredientsidDELETECall =
      ApiV1IngredientsidDELETECall();
  static ApiV1MealsPOSTCall apiV1MealsPOSTCall = ApiV1MealsPOSTCall();
  static ApiV1MealsGETCall apiV1MealsGETCall = ApiV1MealsGETCall();
  static ApiV1MealsidPUTCall apiV1MealsidPUTCall = ApiV1MealsidPUTCall();
  static ApiV1MealsidDELETECall apiV1MealsidDELETECall =
      ApiV1MealsidDELETECall();
  static ApiV1MealsMealDishmealIddishIdDELETECall
      apiV1MealsMealDishmealIddishIdDELETECall =
      ApiV1MealsMealDishmealIddishIdDELETECall();
  static ApiV1MenusPOSTCall apiV1MenusPOSTCall = ApiV1MenusPOSTCall();
  static ApiV1MenusGETCall apiV1MenusGETCall = ApiV1MenusGETCall();
  static ApiV1MenusidPUTCall apiV1MenusidPUTCall = ApiV1MenusidPUTCall();
  static ApiV1MenusidDELETECall apiV1MenusidDELETECall =
      ApiV1MenusidDELETECall();
  static ApiV1MenusMenuMealsPOSTCall apiV1MenusMenuMealsPOSTCall =
      ApiV1MenusMenuMealsPOSTCall();
  static ApiV1MenusMenuMealsmenuIdmealIdDELETECall
      apiV1MenusMenuMealsmenuIdmealIdDELETECall =
      ApiV1MenusMenuMealsmenuIdmealIdDELETECall();
  static ApiV1MenusUserMenusPOSTCall apiV1MenusUserMenusPOSTCall =
      ApiV1MenusUserMenusPOSTCall();
  static ApiV1MenusUserMenususerIdmenuIdDELETECall
      apiV1MenusUserMenususerIdmenuIdDELETECall =
      ApiV1MenusUserMenususerIdmenuIdDELETECall();
  static ApiV1MenusRecommendationsGETCall apiV1MenusRecommendationsGETCall =
      ApiV1MenusRecommendationsGETCall();
  static ApiV1NotificationsGETCall apiV1NotificationsGETCall =
      ApiV1NotificationsGETCall();
  static ApiV1NotificationSettingsPUTCall apiV1NotificationSettingsPUTCall =
      ApiV1NotificationSettingsPUTCall();
  static ApiV1NotificationSettingsGETCall apiV1NotificationSettingsGETCall =
      ApiV1NotificationSettingsGETCall();
  static ApiV1NotificationTypesPUTCall apiV1NotificationTypesPUTCall =
      ApiV1NotificationTypesPUTCall();
  static ApiV1ReportsPOSTCall apiV1ReportsPOSTCall = ApiV1ReportsPOSTCall();
  static ApiV1ReportsGETCall apiV1ReportsGETCall = ApiV1ReportsGETCall();
  static ApiV1ReportsidGETCall apiV1ReportsidGETCall = ApiV1ReportsidGETCall();
  static ApiV1ReportsidPUTCall apiV1ReportsidPUTCall = ApiV1ReportsidPUTCall();
  static ApiV1ReportsidDELETECall apiV1ReportsidDELETECall =
      ApiV1ReportsidDELETECall();
  static ApiV1SafefoodsPOSTCall apiV1SafefoodsPOSTCall =
      ApiV1SafefoodsPOSTCall();
  static ApiV1SafefoodsGETCall apiV1SafefoodsGETCall = ApiV1SafefoodsGETCall();
  static ApiV1SafefoodsidPUTCall apiV1SafefoodsidPUTCall =
      ApiV1SafefoodsidPUTCall();
  static ApiV1SafefoodsidDELETECall apiV1SafefoodsidDELETECall =
      ApiV1SafefoodsidDELETECall();
  static ApiV1SchedulesPOSTCall apiV1SchedulesPOSTCall =
      ApiV1SchedulesPOSTCall();
  static ApiV1SchedulesGETCall apiV1SchedulesGETCall = ApiV1SchedulesGETCall();
  static ApiV1SchedulesidPUTCall apiV1SchedulesidPUTCall =
      ApiV1SchedulesidPUTCall();
  static ApiV1SchedulesidDELETECall apiV1SchedulesidDELETECall =
      ApiV1SchedulesidDELETECall();
  static ApiV1WeeklyPostsPOSTCall apiV1WeeklyPostsPOSTCall =
      ApiV1WeeklyPostsPOSTCall();
  static ApiV1WeeklyPostsGETCall apiV1WeeklyPostsGETCall =
      ApiV1WeeklyPostsGETCall();
  static ApiV1WeeklyPostsidGETCall apiV1WeeklyPostsidGETCall =
      ApiV1WeeklyPostsidGETCall();
  static ApiV1WeeklyPostsidPUTCall apiV1WeeklyPostsidPUTCall =
      ApiV1WeeklyPostsidPUTCall();
  static ApiV1WeeklyPostsidDELETECall apiV1WeeklyPostsidDELETECall =
      ApiV1WeeklyPostsidDELETECall();
  static ApiV1WeeklyPostsWeeksweekGETCall apiV1WeeklyPostsWeeksweekGETCall =
      ApiV1WeeklyPostsWeeksweekGETCall();
  static NotesGETCall notesGETCall = NotesGETCall();
  static NotesPOSTCall notesPOSTCall = NotesPOSTCall();
  static IngredientSearchGETCall ingredientSearchGETCall =
      IngredientSearchGETCall();
  static IngredientSearchManualGETCall ingredientSearchManualGETCall =
      IngredientSearchManualGETCall();
  static NotificationGetCall notificationGetCall = NotificationGetCall();
  static RatingsGETCall ratingsGETCall = RatingsGETCall();
  static MenuUserGETCall menuUserGETCall = MenuUserGETCall();
  static AccountGetCall accountGetCall = AccountGetCall();
  static AccountSubscriptionCall accountSubscriptionCall =
      AccountSubscriptionCall();
}

class ApiV1AccountsPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "email": "",
    "password": "",
    "confirmPassword": ""
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts POST',
      apiUrl: '$baseUrl/api/v1/accounts',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AccountsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    String? role = '',
    bool? isDeleted,
    String? gender = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts GET',
      apiUrl: '$baseUrl/api/v1/accounts',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'Role': role,
        'IsDeleted': isDeleted,
        'Gender': gender,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AccountsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '22F82B5F-D67F-4438-2491-08DCBDFBC59B',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts/{id} GET',
      apiUrl: '$baseUrl/api/v1/accounts/$id',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  UserInfoStruct? data(dynamic response) =>
      UserInfoStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.firstName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.lastName''',
      ));
  int? gender(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.gender''',
      ));
  String? dateOfBirth(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.dateOfBirth''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.image''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.email''',
      ));
  bool? emailConfirmed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.emailConfirmed''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.role''',
      ));
  double? height(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.height''',
      ));
  double? initialWeight(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.initialWeight''',
      ));
  int? diet(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.diet''',
      ));
  int? frequencyOfActivity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.frequencyOfActivity''',
      ));
  String? babyName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.babyName''',
      ));
  int? frequencyOfStress(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.frequencyOfStress''',
      ));
  int? babyGender(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.babyGender''',
      ));
  String? dueDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.dueDate''',
      ));
  int? bmi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.bmi''',
      ));
  bool? isSubscriptionActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isSubscriptionActive''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  String? creationDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.creationDate''',
      ));
  String? modificationDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.modificationDate''',
      ));
  bool? isDeleted(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.isDeleted''',
      ));
  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? endDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.subscriptionEndDate''',
      ));
  String? startDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.subscriptionStartDate''',
      ));
  int? level(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.level''',
      ));
  String? workplace(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.workplace''',
      ));
  int? yesrsOfExperience(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.yearsOfExperience''',
      ));
  String? education(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.education''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.description''',
      ));
  String? clinicAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.clinicAddress''',
      ));
}

class ApiV1AccountsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/accounts/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AccountsidUserPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? firstName = '\"\"',
    String? lastName = '\"\"',
    String? dateOfBirth = '2000-01-01',
    String? image = '\"\"',
    double? height = 0,
    double? initialWeight = 0,
    int? diet = 0,
    int? frequencyOfActivity = 0,
    int? frequencyOfStress = 0,
    String? babyName = '\"\"',
    int? babyGender = 0,
    String? dueDate = '2000-01-01',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "firstName": "$firstName",
  "lastName": "$lastName",
  "dateOfBirth": "$dateOfBirth",
  "image": "$image",
  "height": $height,
  "initialWeight": $initialWeight,
  "diet": $diet,
  "frequencyOfActivity": $frequencyOfActivity,
  "frequencyOfStress": $frequencyOfStress,
  "babyName": "$babyName",
  "babyGender": $babyGender,
  "dueDate": "$dueDate"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts/{id}/user PUT',
      apiUrl: '$baseUrl/api/v1/accounts/$id/user',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AccountsidExpertPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "firstName": "",
  "lastName": "",
  "dateOfBirth": {
    "year": 0,
    "month": 0,
    "day": 0,
    "dayOfWeek": 0,
    "dayOfYear": 0,
    "dayNumber": 0
  },
  "image": "",
  "clinicAddress": "",
  "description": "",
  "education": "",
  "yearsOfExperience": 0,
  "workplace": "",
  "level": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts/{id}/expert PUT',
      apiUrl: '$baseUrl/api/v1/accounts/$id/expert',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AccountsidRestorePUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts/{id}/restore PUT',
      apiUrl: '$baseUrl/api/v1/accounts/$id/restore',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AuthenticationRegisterPOSTCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? confirmPassword = '',
    String? firstName = '',
    String? lastName = '',
    int? role,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "firstName":"$firstName",
  "lastName":"$lastName",
  "email": "$email",
  "password": "$password",
  "confirmPassword": "$confirmPassword",
  "role":$role
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/register POST',
      apiUrl: '$baseUrl/api/v1/authentication/register',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  bool? emailVerificationRequired(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.emailVerificationRequired''',
      ));
  String? confirmPassword1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.errors.ConfirmPassword[0]''',
      ));
  String? confirmPassword2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.errors.ConfirmPassword[1]''',
      ));
}

class ApiV1AuthenticationLoginPOSTCall {
  Future<ApiCallResponse> call({
    bool? httpOnly,
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/login POST',
      apiUrl: '$baseUrl/api/v1/authentication/login?httpOnly=$httpOnly',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  AuthenStruct? data(dynamic response) =>
      AuthenStruct.maybeFromMap(getJsonField(
        response,
        r'''$.data''',
      ));
  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  bool? emailVerificationRequired(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.emailVerificationRequired''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.accessToken''',
      ));
  String? accessTokenExpiryTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.accessTokenExpiryTime''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refreshToken''',
      ));
  bool? informationRequired(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.informationRequired''',
      ));
}

class ApiV1AuthenticationTokenRefreshPOSTCall {
  Future<ApiCallResponse> call({
    bool? httpOnly,
    String? accessToken = '',
    String? refreshToken = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "accessToken": "$accessToken",
  "refreshToken": "$refreshToken"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/token/refresh POST',
      apiUrl:
          '$baseUrl/api/v1/authentication/token/refresh?httpOnly=$httpOnly',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.accessToken''',
      ));
  String? accessTokenExpiryTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.accessTokenExpiryTime''',
      ));
  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.refreshToken''',
      ));
}

class ApiV1AuthenticationEmailVerifyGETCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? verificationCode = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/email/verify GET',
      apiUrl: '$baseUrl/api/v1/authentication/email/verify',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'email': email,
        'verificationCode': verificationCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AuthenticationEmailResendVerificationPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "email": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/email/resend-verification POST',
      apiUrl: '$baseUrl/api/v1/authentication/email/resend-verification',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AuthenticationPasswordChangePOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "oldPassword": "",
  "newPassword": "",
  "confirmPassword": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/password/change POST',
      apiUrl: '$baseUrl/api/v1/authentication/password/change',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AuthenticationPasswordForgotPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "email": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/password/forgot POST',
      apiUrl: '$baseUrl/api/v1/authentication/password/forgot',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AuthenticationPasswordResetPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "email": "",
  "password": "",
  "confirmPassword": "",
  "token": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/password/reset POST',
      apiUrl: '$baseUrl/api/v1/authentication/password/reset',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1AuthenticationLoginGoogleGETCall {
  Future<ApiCallResponse> call({
    String? code = '',
    bool? httpOnly,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/authentication/login/google GET',
      apiUrl: '$baseUrl/api/v1/authentication/login/google',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'code': code,
        'httpOnly': httpOnly,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommentsPOSTCall {
  Future<ApiCallResponse> call({
    String? parentCommentId = '',
    String? postId = '',
    String? accountId = '',
    String? content = '',
    String? attachments = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "content": "$content",
  "attachments": "$attachments",
  "accountId": "$accountId",
  "postId": "$postId",
  "parentCommentId": "$parentCommentId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/comments POST',
      apiUrl: '$baseUrl/api/v1/comments',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommentsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? accountId = '',
    String? postId = '',
    String? parentCommentId = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/comments GET',
      apiUrl: '$baseUrl/api/v1/comments',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'AccountId': accountId,
        'PostId': postId,
        'ParentCommentId': parentCommentId,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? comments(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class ApiV1CommentsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "content": "",
  "likesCount": 0,
  "attachments": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/comments/{id} PUT',
      apiUrl: '$baseUrl/api/v1/comments/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommentsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/comments/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/comments/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommunityPostsPOSTCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? accountId = '',
    int? visibility,
    bool? isProfessional,
    String? attachments = '',
    String? imageUrl = '',
    String? content = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "title": "$title",
  "content": "$content",
  "imageUrl": "$imageUrl",
  "attachments": "$attachments",
  "isProfessional": $isProfessional,
  "visibility": $visibility,
  "accountId": "$accountId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/community-posts POST',
      apiUrl: '$baseUrl/api/v1/community-posts',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommunityPostsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    bool? isProfessional,
    bool? isFollowing,
    String? visibility = '',
    String? accountId = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/community-posts GET',
      apiUrl: '$baseUrl/api/v1/community-posts',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'IsProfessional': isProfessional,
        'IsFollowing': isFollowing,
        'Visibility': visibility,
        'AccountId': accountId,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<PostComunityStruct>? posts(dynamic response) => (getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => PostComunityStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ApiV1CommunityPostsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "title": "",
  "content": "",
  "imageUrl": "",
  "attachments": "",
  "visibility": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/community-posts/{id} PUT',
      apiUrl: '$baseUrl/api/v1/community-posts/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommunityPostsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/community-posts/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/community-posts/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1DishesPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "name": "",
    "description": "",
    "image": "",
    "kcal": 0,
    "weight": 0,
    "protein": 0,
    "carbohydrates": 0,
    "fat": 0,
    "nutrients": [
      {
        "postProcessingAmount": 0,
        "name": "",
        "nutritionId": 0,
        "conversionRate": 0,
        "amount": 0,
        "unitName": "",
        "unitCode": "",
        "fractionalQuantity": 0,
        "nutritionCode": 0
      }
    ],
    "ingredientIds": [
      ""
    ]
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/dishes POST',
      apiUrl: '$baseUrl/api/v1/dishes',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1DishesGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? mealId = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/dishes GET',
      apiUrl: '$baseUrl/api/v1/dishes',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'MealId': mealId,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dishes(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List? dishNutrient(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrients''',
        true,
      ) as List?;
  List<DishStruct>? dishDataType(dynamic response) => (getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => DishStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ApiV1DishesDishIngredientsPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "dishId": "",
  "ingredientIds": [
    ""
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/dishes/dish-ingredients POST',
      apiUrl: '$baseUrl/api/v1/dishes/dish-ingredients',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1DishesidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "description": "",
  "image": "",
  "kcal": 0,
  "weight": 0,
  "protein": 0,
  "carbohydrates": 0,
  "fat": 0,
  "nutrients": [
    {
      "id": "",
      "postProcessingAmount": 0,
      "name": "",
      "nutritionId": 0,
      "conversionRate": 0,
      "amount": 0,
      "unitName": "",
      "unitCode": "",
      "fractionalQuantity": 0,
      "nutritionCode": 0
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/dishes/{id} PUT',
      apiUrl: '$baseUrl/api/v1/dishes/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1DishesidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/dishes/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/dishes/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1DishesDishIngredientsdishIdingredientIdDELETECall {
  Future<ApiCallResponse> call({
    String? dishId = '',
    String? ingredientId = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName:
          '/api/v1/dishes/dish-ingredients/{dishId}/{ingredientId} DELETE',
      apiUrl:
          '$baseUrl/api/v1/dishes/dish-ingredients/$dishId/$ingredientId',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1FollowsPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "expertId": "",
  "userId": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/follows POST',
      apiUrl: '$baseUrl/api/v1/follows',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1FollowsDELETECall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/follows DELETE',
      apiUrl: '$baseUrl/api/v1/follows',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1HealthsPOSTCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? type,
    double? value,
    int? unit,
    String? date = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
[
  {
    "userId": "$userId",
    "type": $type,
    "value": $value,
    "unit": $unit,
    "date": "$date"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/healths POST',
      apiUrl: '$baseUrl/api/v1/healths',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1HealthsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? userId = '',
    String? date = '',
    bool? filterWeight,
    bool? filterHeight,
    bool? filterSize,
    bool? filterBloodPressureSys,
    bool? filterBloodPressureDia,
    bool? filterHeartbeat,
    bool? filterContractility,
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/healths GET',
      apiUrl: '$baseUrl/api/v1/healths',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'UserId': userId,
        'Date': date,
        'FilterWeight': filterWeight,
        'FilterHeight': filterHeight,
        'FilterSize': filterSize,
        'FilterBloodPressureSys': filterBloodPressureSys,
        'FilterBloodPressureDia': filterBloodPressureDia,
        'FilterHeartbeat': filterHeartbeat,
        'FilterContractility': filterContractility,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? healths(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? value(dynamic response) => (getJsonField(
        response,
        r'''$[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<int>? type(dynamic response) => (getJsonField(
        response,
        r'''$[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ApiV1HealthsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
    double? value,
    int? unit,
    int? type,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "type": $type,
  "value":$value,
  "unit":$unit
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/healths/{id} PUT',
      apiUrl: '$baseUrl/api/v1/healths/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1HealthsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/healths/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/healths/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1IngredientsPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "name": "",
    "description": "",
    "image": "",
    "animal": false,
    "kcal": 0,
    "kcalDefault": 0,
    "weight": 0,
    "unit": 0,
    "numberOfDecimalPart": 0,
    "disposalRate": 0,
    "foodGroupId": 0,
    "indexFoodGroup": 0,
    "foodGroup": "",
    "protein": 0,
    "carbohydrates": 0,
    "fat": 0,
    "alco": 0,
    "source": "",
    "sourceUrl": "",
    "index": 0,
    "nutrients": [
      {
        "postProcessingAmount": 0,
        "name": "",
        "nutritionId": 0,
        "conversionRate": 0,
        "amount": 0,
        "unitName": "",
        "unitCode": "",
        "fractionalQuantity": 0,
        "nutritionCode": 0
      }
    ]
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ingredients POST',
      apiUrl: '$baseUrl/api/v1/ingredients',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1IngredientsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? dishId = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ingredients GET',
      apiUrl: '$baseUrl/api/v1/ingredients',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'DishId': dishId,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? ingredients(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class ApiV1IngredientsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "description": "",
  "image": "",
  "kcal": 0,
  "kcalDefault": 0,
  "weight": 0,
  "unit": 0,
  "numberOfDecimalPart": 0,
  "disposalRate": 0,
  "foodGroupId": 0,
  "indexFoodGroup": 0,
  "foodGroup": "",
  "protein": 0,
  "carbohydrates": 0,
  "fat": 0,
  "alco": 0,
  "source": "",
  "sourceUrl": "",
  "index": 0,
  "nutrients": [
    {
      "id": "",
      "postProcessingAmount": 0,
      "name": "",
      "nutritionId": 0,
      "conversionRate": 0,
      "amount": 0,
      "unitName": "",
      "unitCode": "",
      "fractionalQuantity": 0,
      "nutritionCode": 0
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ingredients/{id} PUT',
      apiUrl: '$baseUrl/api/v1/ingredients/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1IngredientsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ingredients/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/ingredients/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MealsPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "name": 0,
    "dishIds": [
      ""
    ]
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/meals POST',
      apiUrl: '$baseUrl/api/v1/meals',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MealsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? menuId = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/meals GET',
      apiUrl: '$baseUrl/api/v1/meals',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'MenuId': menuId,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? meals(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<MealStruct>? mealDataType(dynamic response) => (getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => MealStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ApiV1MealsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": 0,
  "dishIds": [
    ""
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/meals/{id} PUT',
      apiUrl: '$baseUrl/api/v1/meals/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MealsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/meals/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/meals/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MealsMealDishmealIddishIdDELETECall {
  Future<ApiCallResponse> call({
    String? mealId = '',
    String? dishId = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/meals/meal-dish/{mealId}/{dishId} DELETE',
      apiUrl: '$baseUrl/api/v1/meals/meal-dish/$mealId/$dishId',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "name": "",
    "description": "",
    "image": "",
    "kcal": 0,
    "protein": 0,
    "carbohydrates": 0,
    "fat": 0,
    "alco": 0,
    "fiber": 0,
    "nutrients": [
      {
        "postProcessingAmount": 0,
        "name": "",
        "nutritionId": 0,
        "conversionRate": 0,
        "amount": 0,
        "unitName": "",
        "unitCode": "",
        "fractionalQuantity": 0,
        "nutritionCode": 0
      }
    ],
    "mealIds": [
      ""
    ]
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus POST',
      apiUrl: '$baseUrl/api/v1/menus',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusGETCall {
  Future<ApiCallResponse> call({
    bool? orderByDescending,
    bool? isDeleted,
    List<int>? kcalValuesList,
    String? search = '',
    int? pageIndex = 1,
    int? pageSize = 50,
    String? order = 'kcal',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();
    final kcalValues = _serializeList(kcalValuesList);

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus GET',
      apiUrl: '$baseUrl/api/v1/menus',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'KcalValues': kcalValues,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
        'Order': order,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "description": "",
  "image": "",
  "kcal": 0,
  "protein": 0,
  "carbohydrates": 0,
  "fat": 0,
  "alco": 0,
  "fiber": 0,
  "nutrients": [
    {
      "id": "",
      "postProcessingAmount": 0,
      "name": "",
      "nutritionId": 0,
      "conversionRate": 0,
      "amount": 0,
      "unitName": "",
      "unitCode": "",
      "fractionalQuantity": 0,
      "nutritionCode": 0
    }
  ],
  "mealIds": [
    ""
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/{id} PUT',
      apiUrl: '$baseUrl/api/v1/menus/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/menus/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusMenuMealsPOSTCall {
  Future<ApiCallResponse> call({
    String? menuId = '',
    List<String>? mealIdsList,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();
    final mealIds = _serializeList(mealIdsList);

    final ffApiRequestBody = '''
[
  {
    "menuId": "$menuId",
    "mealIds": $mealIds
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/menu-meals POST',
      apiUrl: '$baseUrl/api/v1/menus/menu-meals',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusMenuMealsmenuIdmealIdDELETECall {
  Future<ApiCallResponse> call({
    String? menuId = '',
    String? mealId = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/menu-meals/{menuId}/{mealId} DELETE',
      apiUrl: '$baseUrl/api/v1/menus/menu-meals/$menuId/$mealId',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusUserMenusPOSTCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? menuId = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
[
  {
    "userId": "$userId",
    "menuId": "$menuId"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/user-menus POST',
      apiUrl: '$baseUrl/api/v1/menus/user-menus',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusUserMenususerIdmenuIdDELETECall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? menuId = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/user-menus/{userId}/{menuId} DELETE',
      apiUrl: '$baseUrl/api/v1/menus/user-menus/$userId/$menuId',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusRecommendationsGETCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    int? pageIndex = 1,
    int? pageSize = 50,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/recommendations GET',
      apiUrl: '$baseUrl/api/v1/menus/recommendations',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'AccountId': accountId,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? menus(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  double? kcalRecomment(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$[0].kcalRecomment''',
      ));
}

class ApiV1NotificationsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    bool? isRead,
    String? receiverId = '',
    String? senderId = '',
    String? communityPostId = '',
    String? notificationTypeId = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notifications GET',
      apiUrl: '$baseUrl/api/v1/notifications',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'IsRead': isRead,
        'ReceiverId': receiverId,
        'SenderId': senderId,
        'CommunityPostId': communityPostId,
        'NotificationTypeId': notificationTypeId,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotificationSettingsPUTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "id": "",
  "isEnabled": false,
  "accountId": "",
  "notificationTypeId": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notification-settings PUT',
      apiUrl: '$baseUrl/api/v1/notification-settings',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotificationSettingsGETCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notification-settings GET',
      apiUrl: '$baseUrl/api/v1/notification-settings',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'AccountId': accountId,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotificationTypesPUTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "id": "",
  "name": 0,
  "content": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notification-types PUT',
      apiUrl: '$baseUrl/api/v1/notification-types',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1ReportsPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "note": "",
  "reason": 0,
  "commentId": "",
  "communityPostId": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/reports POST',
      apiUrl: '$baseUrl/api/v1/reports',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1ReportsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    String? reason = '',
    String? status = '',
    String? commentId = '',
    String? communityPostId = '',
    bool? isDeleted,
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/reports GET',
      apiUrl: '$baseUrl/api/v1/reports',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'Reason': reason,
        'Status': status,
        'CommentId': commentId,
        'CommunityPostId': communityPostId,
        'IsDeleted': isDeleted,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1ReportsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/reports/{id} GET',
      apiUrl: '$baseUrl/api/v1/reports/$id',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1ReportsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "status": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/reports/{id} PUT',
      apiUrl: '$baseUrl/api/v1/reports/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1ReportsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/reports/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/reports/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SafefoodsPOSTCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    bool? isSafe,
    String? source = '',
    String? sourceUrl = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$name",
  "description": "$description",
  "isSafe": $isSafe,
  "source": "$source",
  "sourceUrl": "$sourceUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/safefoods POST',
      apiUrl: '$baseUrl/api/v1/safefoods',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SafefoodsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? isSafe = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/safefoods GET',
      apiUrl: '$baseUrl/api/v1/safefoods',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'IsSafe': isSafe,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? safeFoods(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class ApiV1SafefoodsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? name = '',
    String? description = '',
    bool? isSafe = false,
    String? source = '',
    String? sourceUrl = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "description": "",
  "isSafe": false,
  "source": "",
  "sourceUrl": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/safefoods/{id} PUT',
      apiUrl: '$baseUrl/api/v1/safefoods/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SafefoodsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/safefoods/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/safefoods/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SchedulesPOSTCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? location = '',
    String? note = '',
    String? date = '',
    String? userId = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "title": "$title",
  "location": "$location",
  "note": "$note",
  "date": "$date",
  "userId": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/schedules POST',
      apiUrl: '$baseUrl/api/v1/schedules',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SchedulesGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? userId = '',
    String? date = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/schedules GET',
      apiUrl: '$baseUrl/api/v1/schedules',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'UserId': userId,
        'Date': date,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SchedulesidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "id": "",
  "title": "",
  "location": "",
  "note": "",
  "date": {
    "year": 0,
    "month": 0,
    "day": 0,
    "dayOfWeek": 0,
    "dayOfYear": 0,
    "dayNumber": 0
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/schedules/{id} PUT',
      apiUrl: '$baseUrl/api/v1/schedules/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SchedulesidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/schedules/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/schedules/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1WeeklyPostsPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "week": 0,
    "aboutBaby": "",
    "aboutMother": "",
    "advice": "",
    "size": 0,
    "weight": 0,
    "source": "",
    "sourceUrl": ""
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/weekly-posts POST',
      apiUrl: '$baseUrl/api/v1/weekly-posts',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1WeeklyPostsGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/weekly-posts GET',
      apiUrl: '$baseUrl/api/v1/weekly-posts',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1WeeklyPostsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/weekly-posts/{id} GET',
      apiUrl: '$baseUrl/api/v1/weekly-posts/$id',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1WeeklyPostsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "week": 0,
  "aboutBaby": "",
  "aboutMother": "",
  "advice": "",
  "size": 0,
  "weight": 0,
  "source": "",
  "sourceUrl": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/weekly-posts/{id} PUT',
      apiUrl: '$baseUrl/api/v1/weekly-posts/$id',
      callType: ApiCallType.PUT,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1WeeklyPostsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/weekly-posts/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/weekly-posts/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1WeeklyPostsWeeksweekGETCall {
  Future<ApiCallResponse> call({
    int? week,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/weekly-posts/weeks/{week} GET',
      apiUrl: '$baseUrl/api/v1/weekly-posts/weeks/$week',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic weekPost(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  double? weight(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.weight''',
      ));
  double? size(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.size''',
      ));
}

class NotesGETCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? searchTerm = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'notesGET',
      apiUrl: '$baseUrl/api/v1/notes',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'UserId': userId,
        'Date': date,
        'SearchTerm': searchTerm,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? notes(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class NotesPOSTCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? trimester,
    String? title = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "title": "$title",
  "trimester": $trimester,
  "userId": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'notesPOST',
      apiUrl: '$baseUrl/api/v1/notes',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic note(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class IngredientSearchGETCall {
  Future<ApiCallResponse> call({
    String? order = '',
    bool? orderByDescending,
    bool? isDeleted,
    String? foodGroup = '',
    String? search = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'IngredientSearchGET',
      apiUrl: '$baseUrl/api/v1/ingredientSearch',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {
        'Order': order,
        'OrderByDescending': orderByDescending,
        'IsDeleted': isDeleted,
        'FoodGroup': foodGroup,
        'Search': search,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? ingredientSearchs(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List? nutrients(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrients''',
        true,
      ) as List?;
}

class IngredientSearchManualGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'IngredientSearchManualGET',
      apiUrl: '$baseUrl/api/v1/ingredientSearch/$id',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? ingredientSearch(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List? nutrients(dynamic response) => getJsonField(
        response,
        r'''$.data.nutrients''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.name''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.image''',
      ));
  int? kcal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.kcal''',
      ));
  int? disposalRate(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.disposalRate''',
      ));
  int? foodGroupId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.foodGroupId''',
      ));
  int? indexFoodGroup(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.indexFoodGroup''',
      ));
  String? foodGroup(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.foodGroup''',
      ));
  double? protein(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.protein''',
      ));
  double? carbohydrates(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.carbohydrates''',
      ));
  double? fat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.fat''',
      ));
  int? water(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.water''',
      ));
  String? source(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.source''',
      ));
  String? sourceUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.sourceUrl''',
      ));
}

class NotificationGetCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'notificationGet',
      apiUrl: '$baseUrl/api/v1/notification-settings',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? notifications(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class RatingsGETCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ratingsGET',
      apiUrl: '$baseUrl/api/v1/ratings',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? ratings(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<int>? stars(dynamic response) => (getJsonField(
        response,
        r'''$[:].star''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class MenuUserGETCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'menuUserGET',
      apiUrl: '$baseUrl/api/v1/menus/user-menus/$userId',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AccountGetCall {
  Future<ApiCallResponse> call({
    String? id = '22F82B5F-D67F-4438-2491-08DCBDFBC59B',
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'accountGet',
      apiUrl: '$baseUrl/api/v1/accounts/{id}',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AccountSubscriptionCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? type,
    int? price,
  }) async {
    final baseUrl = PolabyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "subscriptionType":$type,
  "price": $price
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'accountSubscription',
      apiUrl: '$baseUrl/api/v1/accounts/$id/subscription',
      callType: ApiCallType.POST,
      headers: {
        'ngrok-skip-browser-warning': '69420',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Polaby Group Code

/// Start PolabyV2 Group Code

class PolabyV2Group {
  static String getBaseUrl() => 'https://polabyapiv1.azurewebsites.net';
  static Map<String, String> headers = {};
  static ApiV1AccountsidCheckPasswordPOSTCall
      apiV1AccountsidCheckPasswordPOSTCall =
      ApiV1AccountsidCheckPasswordPOSTCall();
  static ApiV1CommentsidGETCall apiV1CommentsidGETCall =
      ApiV1CommentsidGETCall();
  static ApiV1CommunityPostsidGETCall apiV1CommunityPostsidGETCall =
      ApiV1CommunityPostsidGETCall();
  static ApiV1DishesidGETCall apiV1DishesidGETCall = ApiV1DishesidGETCall();
  static ApiV1EmotionsPOSTCall apiV1EmotionsPOSTCall = ApiV1EmotionsPOSTCall();
  static ApiV1EmotionsGETCall apiV1EmotionsGETCall = ApiV1EmotionsGETCall();
  static ApiV1EmotionsidDELETECall apiV1EmotionsidDELETECall =
      ApiV1EmotionsidDELETECall();
  static ApiV1ExpertRegistrationsidGETCall apiV1ExpertRegistrationsidGETCall =
      ApiV1ExpertRegistrationsidGETCall();
  static ApiV1ExpertRegistrationsEmailsemailGETCall
      apiV1ExpertRegistrationsEmailsemailGETCall =
      ApiV1ExpertRegistrationsEmailsemailGETCall();
  static ApiV1HealthsidGETCall apiV1HealthsidGETCall = ApiV1HealthsidGETCall();
  static ApiV1IngredientsidGETCall apiV1IngredientsidGETCall =
      ApiV1IngredientsidGETCall();
  static ApiV1MealsidGETCall apiV1MealsidGETCall = ApiV1MealsidGETCall();
  static ApiV1MenusidGETCall apiV1MenusidGETCall = ApiV1MenusidGETCall();
  static ApiV1NotesGETCall apiV1NotesGETCall = ApiV1NotesGETCall();
  static ApiV1NotesPOSTCall apiV1NotesPOSTCall = ApiV1NotesPOSTCall();
  static ApiV1NotesidPUTCall apiV1NotesidPUTCall = ApiV1NotesidPUTCall();
  static ApiV1NotesidDELETECall apiV1NotesidDELETECall =
      ApiV1NotesidDELETECall();
  static ApiV1NotesidGETCall apiV1NotesidGETCall = ApiV1NotesidGETCall();
  static ApiV1NotificationsidGETCall apiV1NotificationsidGETCall =
      ApiV1NotificationsidGETCall();
  static ApiV1RatingsGETCall apiV1RatingsGETCall = ApiV1RatingsGETCall();
  static ApiV1RatingsidPUTCall apiV1RatingsidPUTCall = ApiV1RatingsidPUTCall();
  static ApiV1RatingsidDELETECall apiV1RatingsidDELETECall =
      ApiV1RatingsidDELETECall();
  static ApiV1RatingsidGETCall apiV1RatingsidGETCall = ApiV1RatingsidGETCall();
  static ApiV1SafefoodsidGETCall apiV1SafefoodsidGETCall =
      ApiV1SafefoodsidGETCall();
  static ApiV1SchedulesidGETCall apiV1SchedulesidGETCall =
      ApiV1SchedulesidGETCall();
  static RatingsPostCall ratingsPostCall = RatingsPostCall();
  static NotificationsettingsGetCall notificationsettingsGetCall =
      NotificationsettingsGetCall();
}

class ApiV1AccountsidCheckPasswordPOSTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    const ffApiRequestBody = '''
{
  "password": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/accounts/{id}/check-password POST',
      apiUrl: '$baseUrl/api/v1/accounts/$id/check-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommentsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/comments/{id} GET',
      apiUrl: '$baseUrl/api/v1/comments/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1CommunityPostsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/community-posts/{id} GET',
      apiUrl: '$baseUrl/api/v1/community-posts/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1DishesidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/dishes/{id} GET',
      apiUrl: '$baseUrl/api/v1/dishes/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1EmotionsPOSTCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    List<int>? emotionTypesList,
    dynamic notesJson,
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();
    final emotionTypes = _serializeList(emotionTypesList);
    final notes = _serializeJson(notesJson, true);
    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "date": "$date",
  "emotionTypes": $emotionTypes,
  "notes": $notes
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/emotions POST',
      apiUrl: '$baseUrl/api/v1/emotions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1EmotionsGETCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/emotions GET',
      apiUrl: '$baseUrl/api/v1/emotions',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'UserId': userId,
        'Date': date,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1EmotionsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/emotions/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/emotions/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1ExpertRegistrationsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/expert-registrations/{id} GET',
      apiUrl: '$baseUrl/api/v1/expert-registrations/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1ExpertRegistrationsEmailsemailGETCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/expert-registrations/emails/{email} GET',
      apiUrl: '$baseUrl/api/v1/expert-registrations/emails/$email',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1HealthsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/healths/{id} GET',
      apiUrl: '$baseUrl/api/v1/healths/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1IngredientsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ingredients/{id} GET',
      apiUrl: '$baseUrl/api/v1/ingredients/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MealsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/meals/{id} GET',
      apiUrl: '$baseUrl/api/v1/meals/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1MenusidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/menus/{id} GET',
      apiUrl: '$baseUrl/api/v1/menus/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotesGETCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? trimester = '',
    String? searchTerm = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notes GET',
      apiUrl: '$baseUrl/api/v1/notes',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'UserId': userId,
        'Date': date,
        'Trimester': trimester,
        'SearchTerm': searchTerm,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotesPOSTCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    const ffApiRequestBody = '''
{
  "title": "",
  "trimester": 0,
  "userId": "",
  "date": {
    "year": 0,
    "month": 0,
    "day": 0,
    "dayOfWeek": 0,
    "dayOfYear": 0,
    "dayNumber": 0
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notes POST',
      apiUrl: '$baseUrl/api/v1/notes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotesidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    const ffApiRequestBody = '''
{
  "title": "",
  "trimester": 0,
  "userId": "",
  "date": {
    "year": 0,
    "month": 0,
    "day": 0,
    "dayOfWeek": 0,
    "dayOfYear": 0,
    "dayNumber": 0
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notes/{id} PUT',
      apiUrl: '$baseUrl/api/v1/notes/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotesidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notes/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/notes/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotesidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notes/{id} GET',
      apiUrl: '$baseUrl/api/v1/notes/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1NotificationsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/notifications/{id} GET',
      apiUrl: '$baseUrl/api/v1/notifications/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1RatingsGETCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ratings GET',
      apiUrl: '$baseUrl/api/v1/ratings',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'AccountId': accountId,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1RatingsidPUTCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    const ffApiRequestBody = '''
{
  "userId": "",
  "expertId": "",
  "star": 0,
  "comment": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ratings/{id} PUT',
      apiUrl: '$baseUrl/api/v1/ratings/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1RatingsidDELETECall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ratings/{id} DELETE',
      apiUrl: '$baseUrl/api/v1/ratings/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1RatingsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/ratings/{id} GET',
      apiUrl: '$baseUrl/api/v1/ratings/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SafefoodsidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/safefoods/{id} GET',
      apiUrl: '$baseUrl/api/v1/safefoods/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiV1SchedulesidGETCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/v1/schedules/{id} GET',
      apiUrl: '$baseUrl/api/v1/schedules/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RatingsPostCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? expertId = '',
    int? start,
    String? comment = '',
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "expertId": "$expertId",
  "star": $start,
  "comment": "$comment"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ratingsPost',
      apiUrl: '$baseUrl/api/v1/ratings',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificationsettingsGetCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    int? pageIndex,
    int? pageSize,
  }) async {
    final baseUrl = PolabyV2Group.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'notificationsettingsGet',
      apiUrl: '$baseUrl/api/v1/notification-settings',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End PolabyV2 Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
