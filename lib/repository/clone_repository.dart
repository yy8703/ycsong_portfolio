import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/data/clone/pop_up_data.dart';

class CloneRepository {
  List<PopUpData> popUpDataList = [
    const PopUpData(order: 1, imageLink: 'assets/images/clone/pop_up_1.png', link: 1, description: '메인 팝업'),
    const PopUpData(order: 2, imageLink: 'assets/images/clone/pop_up_2.png', link: 3, description: '베스트 팝업'),
    const PopUpData(order: 3, imageLink: 'assets/images/clone/pop_up_3.png', link: 5, description: '알뜰쇼핑 팝업'),
    const PopUpData(order: 4, imageLink: 'assets/images/clone/pop_up_4.png', link: 2, description: '선물랭킹 팝업'),
    const PopUpData(order: 5, imageLink: 'assets/images/clone/pop_up_5.png', link: 4, description: '신상품 팝업'),
  ];

  List<ItemData> itemDataList = [
    ItemData(title: '[사미헌] 갈비탕', itemImageLink: 'assets/images/clone/item_1.jpeg', price: 13000, discountRate: 0.14, reviewCnt: 1),
    ItemData(title: '[압구정주꾸미] 주꾸미 볶음', itemImageLink: 'assets/images/clone/item_2.jpeg', price: 8900, discountRate: 0.26, reviewCnt: 1),
    ItemData(title: '[KF365] 양념 소불고기', itemImageLink: 'assets/images/clone/item_3.jpeg', price: 21990, discountRate: 0.15, reviewCnt: 1),
    ItemData(title: '[올마레] 춘천 국물 닭갈비 떡볶이', itemImageLink: 'assets/images/clone/item_4.jpeg', price: 13200, discountRate: 0.15, reviewCnt: 1),
    ItemData(title: '[KF365] DOLE 실속 바나나', itemImageLink: 'assets/images/clone/item_5.jpeg', price: 4300, discountRate: 0.1, reviewCnt: 1),
    ItemData(title: '[Kurly] 유정란', itemImageLink: 'assets/images/clone/item_6.jpeg', price: 9990, discountRate: 0.16, reviewCnt: 1),
    ItemData(title: '국산 블루베리', itemImageLink: 'assets/images/clone/item_7.jpeg', price: 10900, discountRate: 0.26, reviewCnt: 1),
    ItemData(title: '대추방울 토마토', itemImageLink: 'assets/images/clone/item_8.jpeg', price: 9900, discountRate: 0.1, reviewCnt: 1),
    ItemData(title: '[이연복의 목란] 짬뽕', itemImageLink: 'assets/images/clone/item_9.jpeg', price: 13800, discountRate: 0.1, reviewCnt: 1),
    ItemData(title: '[하코야] 살엄음 동동 냉메밀 소바', itemImageLink: 'assets/images/clone/item_10.jpeg', price: 9900, discountRate: 0.16, reviewCnt: 1),
  ];
}
