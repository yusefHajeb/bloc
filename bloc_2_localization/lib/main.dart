import 'package:bloc_2_localization/cubit/locale_cubit.dart';
import 'package:bloc_2_localization/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //..to access methode
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          if (state is ChangeLocalState)
            return MaterialApp(
              locale: state.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],

              //return and change local lunguage , supportedLocal that phon support
              localeResolutionCallback: (deviceLocal, supportedLocal) {
                for (var local in supportedLocal) {
                  // if my phone support deviceLocal
                  if (deviceLocal != null &&
                      deviceLocal.languageCode == local.languageCode) {
                    return deviceLocal;
                  }
                }

                return supportedLocal
                    .first; //covert eng when no support luanguage deviceLocal
              },
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const HomePage(),
            );

          return SizedBox();
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SettingPage(),
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hellow _msg".tr(context)),
            SizedBox(
              height: 10,
            ),
            Text("This text will not be translate "),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 16,
          )),
    );
  }
}
