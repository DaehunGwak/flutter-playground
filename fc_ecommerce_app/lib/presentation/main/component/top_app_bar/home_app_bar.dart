import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../cubit/mall_type_cubit.dart';
import 'widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          color: state.theme.backgroundColor,
          duration: Duration(milliseconds: 400),
          child: AppBar(
            leading: SvgIconButton(
              icon: AppIcons.mainLogo,
              color: state.theme.logoColor,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  decoration: ShapeDecoration(
                    color: state.theme.containerColor,
                    shape: StadiumBorder(),
                  ),
                  duration: Duration(milliseconds: 400),
                  child: SizedBox(
                    height: 28,
                    child: DefaultTabController(
                      length: MallType.values.length,
                      initialIndex: state.index,
                      child: TabBar(
                        tabs: MallType.values
                            .map((type) => Tab(text: type.toName))
                            .toList(),
                        isScrollable: true,
                        indicator: ShapeDecoration(
                          color: state.theme.indicatorColor,
                          shape: StadiumBorder(),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        labelColor: state.theme.labelColor,
                        labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                        labelPadding: EdgeInsets.symmetric(horizontal: 12),
                        unselectedLabelColor: state.theme.unselectedLabelColor,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.labelLarge,
                        overlayColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        onTap: (index) =>
                            context.read<MallTypeCubit>().changeIndex(index),
                        splashFactory: NoSplash.splashFactory,
                        tabAlignment: TabAlignment.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              SvgIconButton(
                icon: AppIcons.location,
                color: state.theme.iconColor,
              ),
              SvgIconButton(
                icon: AppIcons.cart,
                color: state.theme.iconColor,
              ),
            ],
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leadingWidth: 86,
          ),
        );
      },
    );
  }
}
