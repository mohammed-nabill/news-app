import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({
    super.key,
    required this.title,
    this.textColorBlack,
    required this.onTap,
  });

  final String title;
  final bool? textColorBlack;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: textColorBlack == null || false
                ? Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700)
                : Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
          ),
          TextButton(
            onPressed: () => onTap(),
            child: Text(
              "View all",
              style: textColorBlack == null || false
                  ? Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFFFCFC),
                    )
                  : Theme.of(context).textTheme.titleMedium!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF141414),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
