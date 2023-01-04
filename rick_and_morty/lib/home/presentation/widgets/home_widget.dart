import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/home/presentation/cubit/navigation_cubit.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key}) : super(key: key);

  final _pages = {
    const Center(
      child: Text('Characters Page'),
    ): const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Characters',
    ),
    const Center(
      child: Text('Settings Page'),
    ): const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    )
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: _pages.keys.toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: _pages.values.toList(),
            currentIndex: state,
            onTap: (value) =>
                context.read<NavigationCubit>().onSelectTab(value),
          ),
        );
      },
    );
  }
}
