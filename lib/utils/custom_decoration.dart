import 'package:flutter/material.dart';
import 'package:stock_veer/utils/values.dart';

class MyDecoration {
  static simpledecoration({color}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.2,
          blurRadius: 2,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static decorationradiusonly(topleft, topright, color) {
    return BoxDecoration(
        color: color ?? AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topleft ?? 0),
            topRight: Radius.circular(topright ?? 0)));
  }

  static simple3decoration() {
    return BoxDecoration(
      color: AppColors.whiteColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.2,
          blurRadius: 2,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static simple2decoration({color}) {
    return BoxDecoration(
        color: color == null ? AppColors.whiteColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.0,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          )
        ]);
  }
}

BoxDecoration decorationbox2({color, radius, opacity}) {
  return BoxDecoration(
    color: color == null ? Colors.white : color,
    borderRadius: BorderRadius.circular(radius ?? 0.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(opacity ?? 0.1),
        spreadRadius: 0.0,
        blurRadius: 3,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  );
}

BoxDecoration decorationbox({color}) {
  return BoxDecoration(
    color: color == null ? Colors.white : color,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        spreadRadius: 0.2,
        blurRadius: 2,
        offset: Offset(0, 1), // changes position of shadow
      ),
    ],
  );
}
