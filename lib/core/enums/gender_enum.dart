import '../extensions/string_extension.dart';

enum GenderEnum {
  male,
  female;

  const GenderEnum();

  @override
  String toString() => name.capitalize;
}
