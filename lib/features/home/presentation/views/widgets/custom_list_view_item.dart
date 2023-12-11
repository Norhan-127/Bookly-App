import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
      child: AspectRatio(
        aspectRatio: 3.5 / 5.5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.yellow,
              image: const DecorationImage(
                  image: AssetImage(AssetData.item), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
