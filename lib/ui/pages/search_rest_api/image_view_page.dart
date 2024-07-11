import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/search/search_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/search/search_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageViewPage extends StatefulWidget {
  static const String routePath = '/main/image_view_page';

  const ImageViewPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const ImageViewPage());
  }

  @override
  _ImageViewPageState createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) => Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 40.h, right: 20.w),
          alignment: Alignment.topRight,
          decoration: (state.fullImageData != null)
              ? BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(state.fullImageData!.imageUrl),
                    fit: BoxFit.fill,
                  ),
                )
              : null,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: Icon(
                Icons.close,
                size: 40.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
