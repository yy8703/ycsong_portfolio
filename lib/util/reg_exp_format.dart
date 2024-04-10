import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/reg_exp_state.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';

class RegExpFormat {
  static final RegExp USER_ID_REGEXP = RegExp(r'^[a-z0-9]{6,20}$');
  static final RegExp Password = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$');

  /// 아이디 정규식
  static RegExpState idRegularExpressionCheck({String? id}) {
    String? errorText;

    if (id == null || id.isEmpty) {
      errorText = LocaleKeys.sign_up_validator_id_input_error.tr();
    } else if (id.length < 6) {
      errorText = LocaleKeys.sign_up_validator_id_length_6_error.tr();
    } else if (id.length > 20) {
      errorText = LocaleKeys.sign_up_validator_id_length_20_error.tr();
    } else if (!USER_ID_REGEXP.hasMatch(id)) {
      errorText = LocaleKeys.sign_up_validator_id_correctly_error.tr();
    }

    return RegExpState(errorText: errorText ?? '', isEnabled: errorText == null, value: id);
  }

  /// 비밀번호 정규식
  static RegExpState passwordRegularExpressionCheck({String? password, String? confirmPassword}) {
    String? errorText;

    if (password == null || password.isEmpty) {
      errorText = LocaleKeys.sign_up_validator_password_input_error.tr();
    } else if (password.length < 8) {
      errorText = LocaleKeys.sign_up_validator_password_length_8_error.tr();
    } else if (password.length > 16) {
      errorText = LocaleKeys.sign_up_validator_password_length_16_error_max.tr();
    } else if (!Password.hasMatch(password)) {
      errorText = LocaleKeys.sign_up_validator_password_correctly_error.tr();
    } else if (password != confirmPassword) {
      errorText = LocaleKeys.sign_up_validator_password_not_match_error.tr();
    }

    return RegExpState(errorText: errorText ?? '', isEnabled: errorText == null, value: password);
  }

  /// 계정찾기 정보 정규식
  static RegExpState findDataRegularExpressionCheck({String? answer, String? findData}) {
    String? errorText;

    if (answer == null || answer.isEmpty) {
      errorText = LocaleKeys.sign_up_content_find_answer_hint_text.tr();
    } else if (findData == null || findData.isEmpty) {
      errorText = LocaleKeys.sign_up_content_find_data_hint_text.tr();
    }

    return RegExpState(errorText: errorText ?? '', isEnabled: errorText == null, value: '$answer\n$findData');
  }
}
