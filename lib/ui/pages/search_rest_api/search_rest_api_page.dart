import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/search/search_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/search/search_state.dart';
import 'package:flutter_my_portfolio/data/search/search_image_meta.dart';
import 'package:flutter_my_portfolio/ui/fragments/search/favorites_tab_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/search/search_tab_fragment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchRestApiPage extends StatefulWidget {
  static const String routePath = '/main/search_rest_api_page';

  const SearchRestApiPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SearchRestApiPage());
  }

  @override
  _SearchRestApiPageState createState() => _SearchRestApiPageState();
}

class _SearchRestApiPageState extends State<SearchRestApiPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    //인피니티 스크롤
    scrollController.addListener(() {
      SearchImageMeta? meta = context.read<SearchCubit>().searchImageMeta;
      if (meta != null && !meta.isEnd) {
        if (scrollController.offset >= scrollController.position.maxScrollExtent) {
          context.read<SearchCubit>().scrollSearchEvent(searchStr: textController.text);
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //로컬캐시 읽기
    context.read<SearchCubit>().getFavoritesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('메인 페이지'),
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(fontSize: 15.sp),
              controller: tabController,
              tabs: const [
                Tab(text: '검색'),
                Tab(text: '즐겨찾기'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  //검색
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) => SearchTabFragment(
                      isSearching: state.isSearching,
                      searchImageMeta: context.read<SearchCubit>().searchImageMeta,
                      searchImageDataList: state.searchImageDataList ?? [],
                      favoritesDataList: state.favoritesDataList ?? [],
                      textController: textController,
                      scrollController: scrollController,
                      favoritesEvent: (value) => context.read<SearchCubit>().favoritesEvent(data: value),
                      imageViewEvent: (value) async {
                        await context.read<SearchCubit>().viewFullImageEvent(data: value);

                        context.read<MainCubit>().fullImagePage();
                      },
                      searchButtonOnTap: () => context.read<SearchCubit>().searchEvent(searchStr: textController.text),
                    ),
                  ),
                  //즐겨찾기
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) => FavoritesTabFragment(
                      favoritesDataList: state.favoritesDataList ?? [],
                      favoritesEvent: (value) => context.read<SearchCubit>().favoritesEvent(data: value),
                      imageViewEvent: (value) async {
                        await context.read<SearchCubit>().viewFullImageEvent(data: value);

                        context.read<MainCubit>().fullImagePage();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
