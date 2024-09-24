// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends FFFirebaseStruct {
  DataStruct({
    String? firstName,
    String? lastName,
    int? gender,
    String? dateOfBirth,
    String? image,
    String? email,
    bool? emailConfirmed,
    String? role,
    int? diet,
    int? frequencyOfActivity,
    int? frequencyOfStress,
    String? babyName,
    int? babyGender,
    String? dueDate,
    int? bmi,
    String? clinicAddress,
    String? description,
    String? education,
    String? yearsOfExperience,
    String? workplace,
    String? level,
    String? subscriptionStartDate,
    String? subscriptionEndDate,
    bool? isSubscriptionActive,
    String? id,
    String? creationDate,
    String? createdBy,
    String? modificationDate,
    String? modifiedBy,
    String? deletionDate,
    String? deletedBy,
    bool? isDeleted,
    double? height,
    double? initialWeight,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _lastName = lastName,
        _gender = gender,
        _dateOfBirth = dateOfBirth,
        _image = image,
        _email = email,
        _emailConfirmed = emailConfirmed,
        _role = role,
        _diet = diet,
        _frequencyOfActivity = frequencyOfActivity,
        _frequencyOfStress = frequencyOfStress,
        _babyName = babyName,
        _babyGender = babyGender,
        _dueDate = dueDate,
        _bmi = bmi,
        _clinicAddress = clinicAddress,
        _description = description,
        _education = education,
        _yearsOfExperience = yearsOfExperience,
        _workplace = workplace,
        _level = level,
        _subscriptionStartDate = subscriptionStartDate,
        _subscriptionEndDate = subscriptionEndDate,
        _isSubscriptionActive = isSubscriptionActive,
        _id = id,
        _creationDate = creationDate,
        _createdBy = createdBy,
        _modificationDate = modificationDate,
        _modifiedBy = modifiedBy,
        _deletionDate = deletionDate,
        _deletedBy = deletedBy,
        _isDeleted = isDeleted,
        _height = height,
        _initialWeight = initialWeight,
        super(firestoreUtilData);

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "gender" field.
  int? _gender;
  int get gender => _gender ?? 0;
  set gender(int? val) => _gender = val;

  void incrementGender(int amount) => gender = gender + amount;

  bool hasGender() => _gender != null;

  // "dateOfBirth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;

  bool hasDateOfBirth() => _dateOfBirth != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "emailConfirmed" field.
  bool? _emailConfirmed;
  bool get emailConfirmed => _emailConfirmed ?? false;
  set emailConfirmed(bool? val) => _emailConfirmed = val;

  bool hasEmailConfirmed() => _emailConfirmed != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "diet" field.
  int? _diet;
  int get diet => _diet ?? 0;
  set diet(int? val) => _diet = val;

  void incrementDiet(int amount) => diet = diet + amount;

  bool hasDiet() => _diet != null;

  // "frequencyOfActivity" field.
  int? _frequencyOfActivity;
  int get frequencyOfActivity => _frequencyOfActivity ?? 0;
  set frequencyOfActivity(int? val) => _frequencyOfActivity = val;

  void incrementFrequencyOfActivity(int amount) =>
      frequencyOfActivity = frequencyOfActivity + amount;

  bool hasFrequencyOfActivity() => _frequencyOfActivity != null;

  // "frequencyOfStress" field.
  int? _frequencyOfStress;
  int get frequencyOfStress => _frequencyOfStress ?? 0;
  set frequencyOfStress(int? val) => _frequencyOfStress = val;

  void incrementFrequencyOfStress(int amount) =>
      frequencyOfStress = frequencyOfStress + amount;

  bool hasFrequencyOfStress() => _frequencyOfStress != null;

  // "babyName" field.
  String? _babyName;
  String get babyName => _babyName ?? '';
  set babyName(String? val) => _babyName = val;

  bool hasBabyName() => _babyName != null;

  // "babyGender" field.
  int? _babyGender;
  int get babyGender => _babyGender ?? 0;
  set babyGender(int? val) => _babyGender = val;

  void incrementBabyGender(int amount) => babyGender = babyGender + amount;

  bool hasBabyGender() => _babyGender != null;

  // "dueDate" field.
  String? _dueDate;
  String get dueDate => _dueDate ?? '';
  set dueDate(String? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "bmi" field.
  int? _bmi;
  int get bmi => _bmi ?? 0;
  set bmi(int? val) => _bmi = val;

  void incrementBmi(int amount) => bmi = bmi + amount;

  bool hasBmi() => _bmi != null;

  // "clinicAddress" field.
  String? _clinicAddress;
  String get clinicAddress => _clinicAddress ?? '';
  set clinicAddress(String? val) => _clinicAddress = val;

  bool hasClinicAddress() => _clinicAddress != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "education" field.
  String? _education;
  String get education => _education ?? '';
  set education(String? val) => _education = val;

  bool hasEducation() => _education != null;

  // "yearsOfExperience" field.
  String? _yearsOfExperience;
  String get yearsOfExperience => _yearsOfExperience ?? '';
  set yearsOfExperience(String? val) => _yearsOfExperience = val;

  bool hasYearsOfExperience() => _yearsOfExperience != null;

  // "workplace" field.
  String? _workplace;
  String get workplace => _workplace ?? '';
  set workplace(String? val) => _workplace = val;

  bool hasWorkplace() => _workplace != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  set level(String? val) => _level = val;

  bool hasLevel() => _level != null;

  // "subscriptionStartDate" field.
  String? _subscriptionStartDate;
  String get subscriptionStartDate => _subscriptionStartDate ?? '';
  set subscriptionStartDate(String? val) => _subscriptionStartDate = val;

  bool hasSubscriptionStartDate() => _subscriptionStartDate != null;

  // "subscriptionEndDate" field.
  String? _subscriptionEndDate;
  String get subscriptionEndDate => _subscriptionEndDate ?? '';
  set subscriptionEndDate(String? val) => _subscriptionEndDate = val;

  bool hasSubscriptionEndDate() => _subscriptionEndDate != null;

  // "isSubscriptionActive" field.
  bool? _isSubscriptionActive;
  bool get isSubscriptionActive => _isSubscriptionActive ?? false;
  set isSubscriptionActive(bool? val) => _isSubscriptionActive = val;

  bool hasIsSubscriptionActive() => _isSubscriptionActive != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "creationDate" field.
  String? _creationDate;
  String get creationDate => _creationDate ?? '';
  set creationDate(String? val) => _creationDate = val;

  bool hasCreationDate() => _creationDate != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "modificationDate" field.
  String? _modificationDate;
  String get modificationDate => _modificationDate ?? '';
  set modificationDate(String? val) => _modificationDate = val;

  bool hasModificationDate() => _modificationDate != null;

  // "modifiedBy" field.
  String? _modifiedBy;
  String get modifiedBy => _modifiedBy ?? '';
  set modifiedBy(String? val) => _modifiedBy = val;

  bool hasModifiedBy() => _modifiedBy != null;

  // "deletionDate" field.
  String? _deletionDate;
  String get deletionDate => _deletionDate ?? '';
  set deletionDate(String? val) => _deletionDate = val;

  bool hasDeletionDate() => _deletionDate != null;

  // "deletedBy" field.
  String? _deletedBy;
  String get deletedBy => _deletedBy ?? '';
  set deletedBy(String? val) => _deletedBy = val;

  bool hasDeletedBy() => _deletedBy != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "initialWeight" field.
  double? _initialWeight;
  double get initialWeight => _initialWeight ?? 0.0;
  set initialWeight(double? val) => _initialWeight = val;

  void incrementInitialWeight(double amount) =>
      initialWeight = initialWeight + amount;

  bool hasInitialWeight() => _initialWeight != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        gender: castToType<int>(data['gender']),
        dateOfBirth: data['dateOfBirth'] as String?,
        image: data['image'] as String?,
        email: data['email'] as String?,
        emailConfirmed: data['emailConfirmed'] as bool?,
        role: data['role'] as String?,
        diet: castToType<int>(data['diet']),
        frequencyOfActivity: castToType<int>(data['frequencyOfActivity']),
        frequencyOfStress: castToType<int>(data['frequencyOfStress']),
        babyName: data['babyName'] as String?,
        babyGender: castToType<int>(data['babyGender']),
        dueDate: data['dueDate'] as String?,
        bmi: castToType<int>(data['bmi']),
        clinicAddress: data['clinicAddress'] as String?,
        description: data['description'] as String?,
        education: data['education'] as String?,
        yearsOfExperience: data['yearsOfExperience'] as String?,
        workplace: data['workplace'] as String?,
        level: data['level'] as String?,
        subscriptionStartDate: data['subscriptionStartDate'] as String?,
        subscriptionEndDate: data['subscriptionEndDate'] as String?,
        isSubscriptionActive: data['isSubscriptionActive'] as bool?,
        id: data['id'] as String?,
        creationDate: data['creationDate'] as String?,
        createdBy: data['createdBy'] as String?,
        modificationDate: data['modificationDate'] as String?,
        modifiedBy: data['modifiedBy'] as String?,
        deletionDate: data['deletionDate'] as String?,
        deletedBy: data['deletedBy'] as String?,
        isDeleted: data['isDeleted'] as bool?,
        height: castToType<double>(data['height']),
        initialWeight: castToType<double>(data['initialWeight']),
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'firstName': _firstName,
        'lastName': _lastName,
        'gender': _gender,
        'dateOfBirth': _dateOfBirth,
        'image': _image,
        'email': _email,
        'emailConfirmed': _emailConfirmed,
        'role': _role,
        'diet': _diet,
        'frequencyOfActivity': _frequencyOfActivity,
        'frequencyOfStress': _frequencyOfStress,
        'babyName': _babyName,
        'babyGender': _babyGender,
        'dueDate': _dueDate,
        'bmi': _bmi,
        'clinicAddress': _clinicAddress,
        'description': _description,
        'education': _education,
        'yearsOfExperience': _yearsOfExperience,
        'workplace': _workplace,
        'level': _level,
        'subscriptionStartDate': _subscriptionStartDate,
        'subscriptionEndDate': _subscriptionEndDate,
        'isSubscriptionActive': _isSubscriptionActive,
        'id': _id,
        'creationDate': _creationDate,
        'createdBy': _createdBy,
        'modificationDate': _modificationDate,
        'modifiedBy': _modifiedBy,
        'deletionDate': _deletionDate,
        'deletedBy': _deletedBy,
        'isDeleted': _isDeleted,
        'height': _height,
        'initialWeight': _initialWeight,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.int,
        ),
        'dateOfBirth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'emailConfirmed': serializeParam(
          _emailConfirmed,
          ParamType.bool,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'diet': serializeParam(
          _diet,
          ParamType.int,
        ),
        'frequencyOfActivity': serializeParam(
          _frequencyOfActivity,
          ParamType.int,
        ),
        'frequencyOfStress': serializeParam(
          _frequencyOfStress,
          ParamType.int,
        ),
        'babyName': serializeParam(
          _babyName,
          ParamType.String,
        ),
        'babyGender': serializeParam(
          _babyGender,
          ParamType.int,
        ),
        'dueDate': serializeParam(
          _dueDate,
          ParamType.String,
        ),
        'bmi': serializeParam(
          _bmi,
          ParamType.int,
        ),
        'clinicAddress': serializeParam(
          _clinicAddress,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'education': serializeParam(
          _education,
          ParamType.String,
        ),
        'yearsOfExperience': serializeParam(
          _yearsOfExperience,
          ParamType.String,
        ),
        'workplace': serializeParam(
          _workplace,
          ParamType.String,
        ),
        'level': serializeParam(
          _level,
          ParamType.String,
        ),
        'subscriptionStartDate': serializeParam(
          _subscriptionStartDate,
          ParamType.String,
        ),
        'subscriptionEndDate': serializeParam(
          _subscriptionEndDate,
          ParamType.String,
        ),
        'isSubscriptionActive': serializeParam(
          _isSubscriptionActive,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'creationDate': serializeParam(
          _creationDate,
          ParamType.String,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'modificationDate': serializeParam(
          _modificationDate,
          ParamType.String,
        ),
        'modifiedBy': serializeParam(
          _modifiedBy,
          ParamType.String,
        ),
        'deletionDate': serializeParam(
          _deletionDate,
          ParamType.String,
        ),
        'deletedBy': serializeParam(
          _deletedBy,
          ParamType.String,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'initialWeight': serializeParam(
          _initialWeight,
          ParamType.double,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.int,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['dateOfBirth'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        emailConfirmed: deserializeParam(
          data['emailConfirmed'],
          ParamType.bool,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        diet: deserializeParam(
          data['diet'],
          ParamType.int,
          false,
        ),
        frequencyOfActivity: deserializeParam(
          data['frequencyOfActivity'],
          ParamType.int,
          false,
        ),
        frequencyOfStress: deserializeParam(
          data['frequencyOfStress'],
          ParamType.int,
          false,
        ),
        babyName: deserializeParam(
          data['babyName'],
          ParamType.String,
          false,
        ),
        babyGender: deserializeParam(
          data['babyGender'],
          ParamType.int,
          false,
        ),
        dueDate: deserializeParam(
          data['dueDate'],
          ParamType.String,
          false,
        ),
        bmi: deserializeParam(
          data['bmi'],
          ParamType.int,
          false,
        ),
        clinicAddress: deserializeParam(
          data['clinicAddress'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        education: deserializeParam(
          data['education'],
          ParamType.String,
          false,
        ),
        yearsOfExperience: deserializeParam(
          data['yearsOfExperience'],
          ParamType.String,
          false,
        ),
        workplace: deserializeParam(
          data['workplace'],
          ParamType.String,
          false,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.String,
          false,
        ),
        subscriptionStartDate: deserializeParam(
          data['subscriptionStartDate'],
          ParamType.String,
          false,
        ),
        subscriptionEndDate: deserializeParam(
          data['subscriptionEndDate'],
          ParamType.String,
          false,
        ),
        isSubscriptionActive: deserializeParam(
          data['isSubscriptionActive'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        creationDate: deserializeParam(
          data['creationDate'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.String,
          false,
        ),
        modificationDate: deserializeParam(
          data['modificationDate'],
          ParamType.String,
          false,
        ),
        modifiedBy: deserializeParam(
          data['modifiedBy'],
          ParamType.String,
          false,
        ),
        deletionDate: deserializeParam(
          data['deletionDate'],
          ParamType.String,
          false,
        ),
        deletedBy: deserializeParam(
          data['deletedBy'],
          ParamType.String,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        initialWeight: deserializeParam(
          data['initialWeight'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        gender == other.gender &&
        dateOfBirth == other.dateOfBirth &&
        image == other.image &&
        email == other.email &&
        emailConfirmed == other.emailConfirmed &&
        role == other.role &&
        diet == other.diet &&
        frequencyOfActivity == other.frequencyOfActivity &&
        frequencyOfStress == other.frequencyOfStress &&
        babyName == other.babyName &&
        babyGender == other.babyGender &&
        dueDate == other.dueDate &&
        bmi == other.bmi &&
        clinicAddress == other.clinicAddress &&
        description == other.description &&
        education == other.education &&
        yearsOfExperience == other.yearsOfExperience &&
        workplace == other.workplace &&
        level == other.level &&
        subscriptionStartDate == other.subscriptionStartDate &&
        subscriptionEndDate == other.subscriptionEndDate &&
        isSubscriptionActive == other.isSubscriptionActive &&
        id == other.id &&
        creationDate == other.creationDate &&
        createdBy == other.createdBy &&
        modificationDate == other.modificationDate &&
        modifiedBy == other.modifiedBy &&
        deletionDate == other.deletionDate &&
        deletedBy == other.deletedBy &&
        isDeleted == other.isDeleted &&
        height == other.height &&
        initialWeight == other.initialWeight;
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        gender,
        dateOfBirth,
        image,
        email,
        emailConfirmed,
        role,
        diet,
        frequencyOfActivity,
        frequencyOfStress,
        babyName,
        babyGender,
        dueDate,
        bmi,
        clinicAddress,
        description,
        education,
        yearsOfExperience,
        workplace,
        level,
        subscriptionStartDate,
        subscriptionEndDate,
        isSubscriptionActive,
        id,
        creationDate,
        createdBy,
        modificationDate,
        modifiedBy,
        deletionDate,
        deletedBy,
        isDeleted,
        height,
        initialWeight
      ]);
}

DataStruct createDataStruct({
  String? firstName,
  String? lastName,
  int? gender,
  String? dateOfBirth,
  String? image,
  String? email,
  bool? emailConfirmed,
  String? role,
  int? diet,
  int? frequencyOfActivity,
  int? frequencyOfStress,
  String? babyName,
  int? babyGender,
  String? dueDate,
  int? bmi,
  String? clinicAddress,
  String? description,
  String? education,
  String? yearsOfExperience,
  String? workplace,
  String? level,
  String? subscriptionStartDate,
  String? subscriptionEndDate,
  bool? isSubscriptionActive,
  String? id,
  String? creationDate,
  String? createdBy,
  String? modificationDate,
  String? modifiedBy,
  String? deletionDate,
  String? deletedBy,
  bool? isDeleted,
  double? height,
  double? initialWeight,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataStruct(
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      dateOfBirth: dateOfBirth,
      image: image,
      email: email,
      emailConfirmed: emailConfirmed,
      role: role,
      diet: diet,
      frequencyOfActivity: frequencyOfActivity,
      frequencyOfStress: frequencyOfStress,
      babyName: babyName,
      babyGender: babyGender,
      dueDate: dueDate,
      bmi: bmi,
      clinicAddress: clinicAddress,
      description: description,
      education: education,
      yearsOfExperience: yearsOfExperience,
      workplace: workplace,
      level: level,
      subscriptionStartDate: subscriptionStartDate,
      subscriptionEndDate: subscriptionEndDate,
      isSubscriptionActive: isSubscriptionActive,
      id: id,
      creationDate: creationDate,
      createdBy: createdBy,
      modificationDate: modificationDate,
      modifiedBy: modifiedBy,
      deletionDate: deletionDate,
      deletedBy: deletedBy,
      isDeleted: isDeleted,
      height: height,
      initialWeight: initialWeight,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataStruct? updateDataStruct(
  DataStruct? data, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    data
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataStructData(
  Map<String, dynamic> firestoreData,
  DataStruct? data,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (data == null) {
    return;
  }
  if (data.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && data.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataData = getDataFirestoreData(data, forFieldValue);
  final nestedData = dataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = data.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataFirestoreData(
  DataStruct? data, [
  bool forFieldValue = false,
]) {
  if (data == null) {
    return {};
  }
  final firestoreData = mapToFirestore(data.toMap());

  // Add any Firestore field values
  data.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataListFirestoreData(
  List<DataStruct>? datas,
) =>
    datas?.map((e) => getDataFirestoreData(e, true)).toList() ?? [];
