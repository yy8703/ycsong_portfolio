import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/tab_bar_data.dart';
import 'package:flutter_my_portfolio/ui/components/clone/tap_bar_button.dart';
import 'package:flutter_my_portfolio/util/global.dart';

class TapBarFragment extends StatelessWidget {
  const TapBarFragment({
    super.key,
    required this.list,
    required this.onTapEvent,
    this.seletedTapBarTitle,
  });

  final List<TapBarData> list;
  final ValueCallback<String> onTapEvent;
  final String? seletedTapBarTitle;

  @override
  Widget build(BuildContext context) {
    return Row(children: widgetList());
  }

  List<Widget> widgetList() {
    List<Widget> result = [];

    for (TapBarData data in list) {
      result.add(TapBarButton(
        buttonTitle: data.title,
        isSeleted: (seletedTapBarTitle == data.title),
        onTapEvent: (value) => onTapEvent(value),
      ));
    }

    return result;
  }
}
