import 'package:collection/collection.dart';

enum Diet {
  NoAnimalProducts,
  ModerateAnimalProducts,
  HighAnimalProducts,
}

enum HealthUnit {
  kg,
  cm,
  mmhg,
  BPM,
  CPH,
}

enum ActivityEnum {
  Light,
  Moderate,
  Intense,
}

enum StressEnum {
  Low,
  Moderate,
  High,
}

enum Gender {
  Unknown,
  Male,
  Female,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Diet):
      return Diet.values.deserialize(value) as T?;
    case (HealthUnit):
      return HealthUnit.values.deserialize(value) as T?;
    case (ActivityEnum):
      return ActivityEnum.values.deserialize(value) as T?;
    case (StressEnum):
      return StressEnum.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    default:
      return null;
  }
}
