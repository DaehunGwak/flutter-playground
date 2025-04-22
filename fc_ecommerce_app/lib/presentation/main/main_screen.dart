import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';
import '../pages/search/search_page.dart';
import '../pages/user/user_page.dart';
import 'component/top_app_bar/top_app_bar.dart';
import 'cubit/bottom_nav_cubit.dart';
import 'cubit/mall_type_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => MallTypeCubit()),
      ],
      child: const MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          return switch (state) {
            BottomNav.home => const HomePage(),
            BottomNav.category => const CategoryPage(),
            BottomNav.search => const SearchPage(),
            BottomNav.user => const UserPage(),
          };
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) => BottomNavigationBar(
          items: BottomNav.values
              .map(
                (nav) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(nav.icon),
                  label: nav.toName,
                  activeIcon: SvgPicture.asset(nav.activeIcon),
                ),
              )
              .toList(growable: false),
          onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
          currentIndex: state.index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
