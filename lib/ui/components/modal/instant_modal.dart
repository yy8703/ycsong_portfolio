import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/ui/components/modal/common_dialog.dart';

Future<T?> showInstantModal<T>(
  context, {
  required double innerWidth,
  required double innerHeight,
  bool barrierDismissible = true,
  String modalText = '',
  ButtonType buttonType = ButtonType.oneButton,
  bool reversButton = false,
  String? mainButtonTitle,
  String? subButtonTitle,
  required VoidCallback mainButtonOnTap,
  VoidCallback? subButtonOnTap,
  Color? barrierColor,
}) async {
  return await showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: false,
    barrierColor: (barrierColor != null) ? barrierColor : const Color.fromRGBO(0, 0, 0, 0.8),
    useSafeArea: true,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          mainButtonOnTap.call();
          return false;
        },
        child: CommonDialog(
          width: innerWidth,
          height: innerHeight,
          text: modalText,
          buttonType: buttonType,
          reversButton: reversButton,
          mainButtonTitle: mainButtonTitle,
          subButtonTitle: subButtonTitle,
          mainButtonOnTap: mainButtonOnTap,
          subButtonOnTap: subButtonOnTap,
        ),
      );
    },
  );
}
