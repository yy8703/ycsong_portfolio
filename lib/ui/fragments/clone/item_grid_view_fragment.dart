import 'package:flutter/widgets.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/ui/components/clone/item_area.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemGridViewFragment extends StatelessWidget {
  const ItemGridViewFragment({super.key, required this.itemDataList});

  final List<ItemData> itemDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (208 * itemDataList.length).h,
      alignment: Alignment.center,
      child: GridView.builder(
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.33.h,
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
        ),
        scrollDirection: Axis.vertical,
        itemCount: itemDataList.length,
        itemBuilder: (context, index) => ItemArea(itemData: itemDataList[index]),
      ),
    );
  }
}
