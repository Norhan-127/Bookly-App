import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07),
        child: IconButton(
          onPressed: () {
            print("object");
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.close,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.075),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 0.075),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
