import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDialog extends StatelessWidget {
  ///
  CommonDialog({
    super.key,
    required this.width,
    required this.height,
    this.text = '',
    this.buttonType = ButtonType.oneButton,
    this.reversButton = false,
    this.mainButtonTitle = 'confirm',
    this.subButtonTitle = 'cancel',
    required this.mainButtonOnTap,
    this.subButtonOnTap,
  }) {
    mainButtonTitle = (mainButtonTitle != null) ? mainButtonTitle : LocaleKeys.modal_ok.tr();
    subButtonTitle = (subButtonTitle != null) ? subButtonTitle : LocaleKeys.modal_cancel.tr();
  }

  ///
  double width;

  ///
  double height;

  ///
  String text;

  ///
  ButtonType buttonType;

  ///
  bool reversButton;

  ///
  String? mainButtonTitle;

  ///
  String? subButtonTitle;

  ///
  VoidCallback mainButtonOnTap;

  ///
  VoidCallback? subButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removeViewInsets(
      context: context,
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      child: Dialog(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(top: 30.w, bottom: 25.w, left: 20.w, right: 20.w),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 13.sp),
              ),
              const Spacer(),
              buttonArea(type: buttonType),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonArea({required ButtonType type}) {
    Widget result = Container();

    switch (type) {
      case ButtonType.oneButton:
        result = modalButton(title: mainButtonTitle!, isMain: true, event: mainButtonOnTap);
        break;
      case ButtonType.twoButton:
        (reversButton)
            ? result = Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: modalButton(title: subButtonTitle!, isMain: false, event: subButtonOnTap),
                  ),
                  Container(width: 6.w),
                  Expanded(
                    flex: 7,
                    child: modalButton(title: mainButtonTitle!, isMain: true, event: mainButtonOnTap),
                  ),
                ],
              )
            : result = Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: modalButton(title: mainButtonTitle!, isMain: true, event: mainButtonOnTap),
                  ),
                  Container(width: 6.w),
                  Expanded(
                    flex: 3,
                    child: modalButton(title: subButtonTitle!, isMain: false, event: subButtonOnTap),
                  ),
                ],
              );
        break;
      default:
    }

    return result;
  }

  ///
  Widget modalButton({required String title, required bool isMain, required VoidCallback? event}) {
    return GestureDetector(
      onTap: event,
      child: Container(
        height: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (isMain) ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 12.sp, color: (isMain) ? Colors.white : Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
