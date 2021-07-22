import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/constant/preference_key.dart';
import 'package:coinhe/data/model/banner_link.dart';
import 'package:coinhe/screens/authorized/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/home_tab_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TAG = 'HomePage';

  CarouselController carouselController = CarouselController();

  final ScrollController controller = ScrollController();

  int indexSlider = 0;

  Timer _timer;

  List<BannerLink> dataSlide = [
    BannerLink(
      image: ImageConstants.imageBackgroundSplash,
      url: "https://google.com",
      index: 0
    ),
    BannerLink(
      image: ImageConstants.imageLogo,
      url: "https://google.com",
      index: 1
    ),
    BannerLink(
      image: ImageConstants.imageBackgroundSplash,
      url: "https://google.com",
      index: 2
    )
  ];

  void loadingSlider() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (bloc.state.data.indexSlider == dataSlide.length - 1) {
        indexSlider = 0;
        bloc.changeIndexSlide(indexSlider);
      } else {
        indexSlider++;
        bloc.changeIndexSlide(indexSlider);
      }
      if (controller.position.pixels < 200) {
        carouselController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut
        );
      }
    });
  }

  void openTournament(String url) async {

  }

  final bloc = HomeCubit();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadingSlider();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset(
            ImageConstants.imageLogo,
            width: 135,
            height: 24,
          ),
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  ImageConstants.icNotification,
                  width: 36,
                  height: 36,
                ),
              ),
              Positioned(
                top: 0,
                right: 14,
                child: Container(
                  height: 18,
                  width: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blue
                  ),
                  child: Text(
                    '1',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white
                    ),
                  ),
                ),
              )
            ]
          )
        ]
      ),
      body: BlocConsumer<HomeCubit,HomeState>(
        bloc: bloc,
        listener: (context,state) {

        },
        builder: (context,state) => Container(
          child: ListView(
            controller: controller,
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                            autoPlay: false,
                            pageSnapping: false,
                            scrollPhysics: NeverScrollableScrollPhysics(),
                            initialPage: dataSlide.length,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 500),
                            viewportFraction: 1.0,
                            height: 170
                        ),
                        items: dataSlide.map((item) => Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              image: DecorationImage(
                                  image: AssetImage(
                                    item.image,
                                  ),
                                  fit: BoxFit.fitWidth
                              )
                          ),
                        )).toList(),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _indicatorAnimation(state.data.indexSlider),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                PreferenceKey.CHC_USD.toUpperCase(),
                                style: Theme.of(context).textTheme.subtitle2.copyWith(
                                  color: AppColors.textGrey
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "6000000000",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5.copyWith(
                                    color: AppColors.white
                                ),
                              ),
                            ),
                            Text(
                              "+2.35%",
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: AppColors.green,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                PreferenceKey.ETH_USD.toUpperCase(),
                                style: Theme.of(context).textTheme.subtitle2.copyWith(
                                    color: AppColors.textGrey
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "1210.121",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5.copyWith(
                                    color: AppColors.white
                                ),
                              ),
                            ),
                            Text(
                              "+2.35%",
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                PreferenceKey.BTC_USD.toUpperCase(),
                                style: Theme.of(context).textTheme.subtitle2.copyWith(
                                    color: AppColors.textGrey
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "1210.121",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5.copyWith(
                                    color: AppColors.white
                                ),
                              ),
                            ),
                            Text(
                              "+2.35%",
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 5,
                color: AppColors.lineDark,
              ),
              HomeTabWidget(bloc,controller)
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicatorAnimation(index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: dataSlide.map((item) => Container(
        height: 4,
        width: item.index == index ? 14 : 4,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
      )).toList()
    );
  }
}