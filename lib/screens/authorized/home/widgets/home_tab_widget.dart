import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorized/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class HomeTabWidget extends StatefulWidget {
  final HomeCubit bloc;

  final ScrollController controller;

  HomeTabWidget(this.bloc, this.controller);

  @override
  _HomeTabWidgetState createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  static const TAG = 'HomeTabWidget';

  HomeCubit get bloc => widget.bloc;

  ScrollController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      bloc: bloc,
      builder: (context,state) => Container(
        margin: const EdgeInsets.only(top: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => bloc.selectTab(0),
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 24,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: bloc.state.data.indexTab == 0 ? AppColors.blue : Colors.transparent
                        ),
                        child: Text(
                          S.current.gainers,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: bloc.state.data.indexTab == 0 ? AppColors.white : AppColors.textGray,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () => bloc.selectTab(1),
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 24,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: bloc.state.data.indexTab == 1 ? AppColors.blue : Colors.transparent
                        ),
                        child: Text(
                          S.current.losers,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: bloc.state.data.indexTab == 1 ? AppColors.white : AppColors.textGray,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () => bloc.selectTab(2),
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 24,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: bloc.state.data.indexTab == 2 ? AppColors.blue : Colors.transparent
                        ),
                        child: Text(
                          S.current.favorite,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: bloc.state.data.indexTab == 2 ? AppColors.white : AppColors.textGray,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is OverscrollNotification) {
                  controller.jumpTo(
                      controller.offset + scrollNotification.overscroll);
                }
                return true;
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context,index) {
                  return _renderItem(index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderItem(index) {
    return SwipeActionCell(
      key: Key('index$index'),
      backgroundColor: Colors.transparent,
      performsFirstActionWithFullSwipe: true,
      trailingActions: <SwipeAction>[
        SwipeAction(
            onTap: (CompletionHandler handler) async {
            },
            color: Colors.transparent,
            widthSpace: 200,
            forceAlignmentToBoundary: true,
            content: Container(
              color: AppColors.blue,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 12),
              child: Text(
                S.current.add_favorite,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
        ),
      ],
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageConstants.icLogo,
              width: 25,
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'NEO ',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white
                          )
                        ),
                        TextSpan(
                          text: '/ USDT',
                          style: Theme.of(context).textTheme.subtitle2
                        )
                      ]
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Vol 143,170,895',
                      style: Theme.of(context).textTheme.subtitle2
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              child: Text(
                '7079.78159283',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.w600
                )
              ),
            ),
            const SizedBox(width: 12,),
            Container(
              width: 62,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: index %2 == 0 ? AppColors.red : AppColors.green
              ),
              child: Text(
                '+10.04%',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

}