import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocaleString extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'Login': 'Login',
      'Send': 'Send',
      'Receive': 'Receive'
    },
    'ko_KR': {
      'Login': '로그인',
      'Send': '보내기',
      'Receive': '받기'
    }
  };
}