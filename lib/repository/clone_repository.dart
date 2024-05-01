import 'package:flutter_my_portfolio/data/clone/pop_up_data.dart';

class CloneRepository {
  List<PopUpData> popUpDataList = [
    const PopUpData(order: 1, imageLink: 'assets/images/clone/pop_up_1.png', link: 1, description: '메인 팝업'),
    const PopUpData(order: 2, imageLink: 'assets/images/clone/pop_up_2.png', link: 3, description: '베스트 팝업'),
    const PopUpData(order: 3, imageLink: 'assets/images/clone/pop_up_3.png', link: 5, description: '알뜰쇼핑 팝업'),
    const PopUpData(order: 4, imageLink: 'assets/images/clone/pop_up_4.png', link: 2, description: '선물랭킹 팝업'),
    const PopUpData(order: 5, imageLink: 'assets/images/clone/pop_up_5.png', link: 4, description: '신상품 팝업'),
  ];
}
