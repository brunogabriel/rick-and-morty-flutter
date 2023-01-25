import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/shared/extensions/string_extensions.dart';
import 'package:rick_and_morty/shared/theme/data/app_theme.dart';
import 'package:rick_and_morty/shared/theme/data/cubit/theme_cubit.dart';

import '../../../shared/theme/application_theme.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, String>(
      builder: (context, state) {
        return ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 32.0,
                ),
                ListTile(
                  title: Text('Themes',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                ...ApplicationTheme.themes.values.map(
                  (model) => RadioListTile(
                    title: Text(model.theme.title),
                    secondary: model.icon,
                    value: model,
                    groupValue: ApplicationTheme.byName(state),
                    onChanged: (value) =>
                        context.read<ThemeCubit>().changeTheme(
                              value?.theme?.name ?? AppTheme.light.name,
                            ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'External links',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Divider(),
                ),
                ListTile(
                  title: const Text('Flutter dev'),
                  leading: const Icon(
                    Icons.flutter_dash_outlined,
                    color: Colors.blueAccent,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => 'flutter.dev'.launchInBrowser(),
                ),
                ListTile(
                  title: const Text('Android Developers blog'),
                  leading: const Icon(
                    Icons.android,
                    color: Colors.greenAccent,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () =>
                      'android-developers.googleblog.com'.launchInBrowser(),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
