import 'package:flutter_regex/flutter_regex.dart';
import 'package:formz/formz.dart';

enum URLValidationError {
  empty,
  invalid;

  String getMessage() {
    switch (this) {
      case empty:
        return 'URL tidak boleh kosong';
      case invalid:
        return "URL tidak valid";
    }
  }
}

class URLFormz extends FormzInput<String, URLValidationError> {
  const URLFormz.pure(super.value) : super.pure();

  const URLFormz.dirty(super.value) : super.dirty();

  @override
  URLValidationError? validator(String value) {
    if (value.isEmpty) {
      return URLValidationError.empty;
    }

    if (!value.isUrl()) {
      return URLValidationError.invalid;
    }

    return null;
  }
}
