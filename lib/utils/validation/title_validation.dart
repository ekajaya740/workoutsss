import 'package:formz/formz.dart';

enum TitleValidationError {
  empty;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Nama tidak boleh kosong';
    }
  }
}

class TitleFormz extends FormzInput<String, TitleValidationError> {
  const TitleFormz.pure(super.value) : super.pure();

  const TitleFormz.dirty(super.value) : super.dirty();

  @override
  TitleValidationError? validator(String value) {
    if (value.isEmpty) {
      return TitleValidationError.empty;
    }

    return null;
  }
}
