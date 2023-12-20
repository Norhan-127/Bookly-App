import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetData.logo, height: 20),
          // const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouters.kSearchView);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
              )),
        ],
      ),
    );
  }
}
