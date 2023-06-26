import 'package:bloc_2_localization/app_localizations.dart';
import 'package:bloc_2_localization/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting".tr(context)),
      ),
      body: Center(
        child: BlocConsumer<LocaleCubit, LocaleState>(
          listener: (context, state) {
            if (state is ChangeLocalState) Navigator.pop(context);
          },
          builder: (context, state) {
            if (state is ChangeLocalState) {
              return DropdownButton<String>(
                value: state.locale.languageCode,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: ['ar', 'en'].map((String items) {
                  return DropdownMenuItem<String>(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // BlocProvider.of<LocaleCubit>(context)
                    //     .changeLanguage(newValue);

                    context.read<LocaleCubit>().changeLanguage(newValue);
                    // Navigator.pop(context);
                  }
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
