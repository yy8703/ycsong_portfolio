import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/ui/components/clone/item_align_button.dart';
import 'package:flutter_my_portfolio/util/global.dart';

class ItemAlignFragment extends StatelessWidget {
  const ItemAlignFragment({
    super.key,
    required this.selectedButton,
    required this.buttonTitle1,
    required this.buttonTitle2,
    required this.buttonTitle3,
    required this.buttonTitle4,
    required this.buttonTitle5,
    required this.alignEvent,
  });

  final int selectedButton;
  final String buttonTitle1;
  final String buttonTitle2;
  final String buttonTitle3;
  final String buttonTitle4;
  final String buttonTitle5;
  final ValueCallback<int> alignEvent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ItemAlignButton(
          isSelected: selectedButton == 1,
          title: buttonTitle1,
          onTap: () => (selectedButton != 1) ? alignEvent(1) : null,
        ),
        ItemAlignButton(
          isSelected: selectedButton == 2,
          title: buttonTitle2,
          onTap: () => (selectedButton != 2) ? alignEvent(2) : null,
        ),
        ItemAlignButton(
          isSelected: selectedButton == 3,
          title: buttonTitle3,
          onTap: () => (selectedButton != 3) ? alignEvent(3) : null,
        ),
        ItemAlignButton(
          isSelected: selectedButton == 4,
          title: buttonTitle4,
          onTap: () => (selectedButton != 4) ? alignEvent(4) : null,
        ),
        ItemAlignButton(
          isSelected: selectedButton == 5,
          title: buttonTitle5,
          onTap: () => (selectedButton != 5) ? alignEvent(5) : null,
        ),
      ],
    );
  }
}
