// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PostComunityStruct extends FFFirebaseStruct {
  PostComunityStruct({
    String? id,
    String? title,
    String? content,
    int? likesCount,
    int? commentsCount,
    int? reportsCount,
    String? imageUrl,
    String? attachments,
    bool? isProfessional,
    bool? isLiked,
    int? visibility,
    String? userId,
    String? userName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _content = content,
        _likesCount = likesCount,
        _commentsCount = commentsCount,
        _reportsCount = reportsCount,
        _imageUrl = imageUrl,
        _attachments = attachments,
        _isProfessional = isProfessional,
        _isLiked = isLiked,
        _visibility = visibility,
        _userId = userId,
        _userName = userName,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "likesCount" field.
  int? _likesCount;
  int get likesCount => _likesCount ?? 0;
  set likesCount(int? val) => _likesCount = val;

  void incrementLikesCount(int amount) => likesCount = likesCount + amount;

  bool hasLikesCount() => _likesCount != null;

  // "commentsCount" field.
  int? _commentsCount;
  int get commentsCount => _commentsCount ?? 0;
  set commentsCount(int? val) => _commentsCount = val;

  void incrementCommentsCount(int amount) =>
      commentsCount = commentsCount + amount;

  bool hasCommentsCount() => _commentsCount != null;

  // "reportsCount" field.
  int? _reportsCount;
  int get reportsCount => _reportsCount ?? 0;
  set reportsCount(int? val) => _reportsCount = val;

  void incrementReportsCount(int amount) =>
      reportsCount = reportsCount + amount;

  bool hasReportsCount() => _reportsCount != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "attachments" field.
  String? _attachments;
  String get attachments => _attachments ?? '';
  set attachments(String? val) => _attachments = val;

  bool hasAttachments() => _attachments != null;

  // "isProfessional" field.
  bool? _isProfessional;
  bool get isProfessional => _isProfessional ?? false;
  set isProfessional(bool? val) => _isProfessional = val;

  bool hasIsProfessional() => _isProfessional != null;

  // "isLiked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  set isLiked(bool? val) => _isLiked = val;

  bool hasIsLiked() => _isLiked != null;

  // "visibility" field.
  int? _visibility;
  int get visibility => _visibility ?? 0;
  set visibility(int? val) => _visibility = val;

  void incrementVisibility(int amount) => visibility = visibility + amount;

  bool hasVisibility() => _visibility != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  static PostComunityStruct fromMap(Map<String, dynamic> data) =>
      PostComunityStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        likesCount: castToType<int>(data['likesCount']),
        commentsCount: castToType<int>(data['commentsCount']),
        reportsCount: castToType<int>(data['reportsCount']),
        imageUrl: data['imageUrl'] as String?,
        attachments: data['attachments'] as String?,
        isProfessional: data['isProfessional'] as bool?,
        isLiked: data['isLiked'] as bool?,
        visibility: castToType<int>(data['visibility']),
        userId: data['userId'] as String?,
        userName: data['userName'] as String?,
      );

  static PostComunityStruct? maybeFromMap(dynamic data) => data is Map
      ? PostComunityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'content': _content,
        'likesCount': _likesCount,
        'commentsCount': _commentsCount,
        'reportsCount': _reportsCount,
        'imageUrl': _imageUrl,
        'attachments': _attachments,
        'isProfessional': _isProfessional,
        'isLiked': _isLiked,
        'visibility': _visibility,
        'userId': _userId,
        'userName': _userName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'likesCount': serializeParam(
          _likesCount,
          ParamType.int,
        ),
        'commentsCount': serializeParam(
          _commentsCount,
          ParamType.int,
        ),
        'reportsCount': serializeParam(
          _reportsCount,
          ParamType.int,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'attachments': serializeParam(
          _attachments,
          ParamType.String,
        ),
        'isProfessional': serializeParam(
          _isProfessional,
          ParamType.bool,
        ),
        'isLiked': serializeParam(
          _isLiked,
          ParamType.bool,
        ),
        'visibility': serializeParam(
          _visibility,
          ParamType.int,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostComunityStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostComunityStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        likesCount: deserializeParam(
          data['likesCount'],
          ParamType.int,
          false,
        ),
        commentsCount: deserializeParam(
          data['commentsCount'],
          ParamType.int,
          false,
        ),
        reportsCount: deserializeParam(
          data['reportsCount'],
          ParamType.int,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        attachments: deserializeParam(
          data['attachments'],
          ParamType.String,
          false,
        ),
        isProfessional: deserializeParam(
          data['isProfessional'],
          ParamType.bool,
          false,
        ),
        isLiked: deserializeParam(
          data['isLiked'],
          ParamType.bool,
          false,
        ),
        visibility: deserializeParam(
          data['visibility'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostComunityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostComunityStruct &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        reportsCount == other.reportsCount &&
        imageUrl == other.imageUrl &&
        attachments == other.attachments &&
        isProfessional == other.isProfessional &&
        isLiked == other.isLiked &&
        visibility == other.visibility &&
        userId == other.userId &&
        userName == other.userName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        content,
        likesCount,
        commentsCount,
        reportsCount,
        imageUrl,
        attachments,
        isProfessional,
        isLiked,
        visibility,
        userId,
        userName
      ]);
}

PostComunityStruct createPostComunityStruct({
  String? id,
  String? title,
  String? content,
  int? likesCount,
  int? commentsCount,
  int? reportsCount,
  String? imageUrl,
  String? attachments,
  bool? isProfessional,
  bool? isLiked,
  int? visibility,
  String? userId,
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostComunityStruct(
      id: id,
      title: title,
      content: content,
      likesCount: likesCount,
      commentsCount: commentsCount,
      reportsCount: reportsCount,
      imageUrl: imageUrl,
      attachments: attachments,
      isProfessional: isProfessional,
      isLiked: isLiked,
      visibility: visibility,
      userId: userId,
      userName: userName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostComunityStruct? updatePostComunityStruct(
  PostComunityStruct? postComunity, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postComunity
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostComunityStructData(
  Map<String, dynamic> firestoreData,
  PostComunityStruct? postComunity,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postComunity == null) {
    return;
  }
  if (postComunity.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postComunity.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postComunityData =
      getPostComunityFirestoreData(postComunity, forFieldValue);
  final nestedData =
      postComunityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postComunity.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostComunityFirestoreData(
  PostComunityStruct? postComunity, [
  bool forFieldValue = false,
]) {
  if (postComunity == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postComunity.toMap());

  // Add any Firestore field values
  postComunity.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostComunityListFirestoreData(
  List<PostComunityStruct>? postComunitys,
) =>
    postComunitys?.map((e) => getPostComunityFirestoreData(e, true)).toList() ??
    [];
