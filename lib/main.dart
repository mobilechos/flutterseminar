import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'res/locale_string.dart';
import 'ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _title = 'Seminar';
  const MyApp({Key? key}) : super();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print (Get.deviceLocale);
    return GetMaterialApp(
        title: _title,
        translations: LocaleString(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        initialRoute: '/',
        getPages: [
            GetPage(name: '/', page: () => Home(title: _title))
        ],
    );
  }
}