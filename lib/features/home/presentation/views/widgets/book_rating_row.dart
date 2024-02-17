import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../../../../core/utils/styles.dart';

class BookRatingRow extends StatelessWidget {
  const BookRatingRow(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start, required this.count, required this.rating});
  final MainAxisAlignment mainAxisAlignment;
  final num count;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 15,
        ),
        const SizedBox(
          width: 6.3,
        ),
         Text(
          "$count",
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.5,
          child: Text("($rating)",
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
      ],
    );
  }
}
