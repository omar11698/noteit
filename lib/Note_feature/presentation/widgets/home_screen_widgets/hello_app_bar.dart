import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noteit/core/config/themes/app_themes.dart';
import 'package:noteit/core/utils/constants/images/images_path.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/themes/theme_provider.dart';

class HelloAppBar extends StatefulWidget {
  final ThemeData themeColor;
  const HelloAppBar({
    super.key,
    required this.themeColor,
  });

  @override
  State<HelloAppBar> createState() => _HelloAppBarState();
}

class _HelloAppBarState extends State<HelloAppBar>
    with TickerProviderStateMixin {
  AnimationController? _staggeredAnimationController;
  AnimationController? _firstAnimationController;
  AnimationController? _secondAnimationController;
  AnimationController? _thirdAnimationController;

  Animation? _firstPointTopPositionAnimation;
  Animation? _secondPointTopPositionAnimation;
  Animation? _thirdPointTopPositionAnimation;
  Animation? _firstPointTopPositionAnimationReverse;
  Animation? _secondPointTopPositionAnimationReverse;
  Animation? _thirdPointTopPositionAnimationReverse;

  double firstTopCoordination = 20;
  double secondTopCoordination = 20;
  double thirdTopCoordination = 20;
  Animation? _rightPositionAnimation;

  @override
  void initState() {
    super.initState();

    const speedInMilliSeconds = 1000;
    _staggeredAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: speedInMilliSeconds,
      ),
    );
    // _firstAnimationController = AnimationController(
    //   vsync: this,
    //   duration:  const Duration(
    //     milliseconds: speedInMilliSeconds,
    //   ),
    // );
    // _secondAnimationController = AnimationController(
    //   vsync: this,
    //   duration:  const Duration(
    //
    //     milliseconds: speedInMilliSeconds,
    //
    //   ),
    // );
    // _thirdAnimationController = AnimationController(
    //   vsync: this,
    //   duration:  const Duration(
    //     milliseconds: speedInMilliSeconds,
    //   ),
    // );
    //
    //
    //
    //
    // _firstPointTopPositionAnimation =
    //     Tween<double>(begin: firstTopCoordination, end: 0).animate(
    //       CurvedAnimation(
    //         parent: _firstAnimationController!,
    //         curve: Curves.linear,
    //       ),
    //     );
    // _secondPointTopPositionAnimation =
    //     Tween<double>(begin: secondTopCoordination, end: 0).animate(
    //       CurvedAnimation(
    //         parent: _secondAnimationController!,
    //         curve: Curves.linear,
    //       ),
    //     );
    //
    // _thirdPointTopPositionAnimation =
    //     Tween<double>(begin: thirdTopCoordination, end: 0).animate(
    //       CurvedAnimation(
    //         parent: _thirdAnimationController!,
    //         curve: Curves.linear,
    //       ),
    //     );
    _firstPointTopPositionAnimation =
        Tween<double>(begin: firstTopCoordination, end: 0).animate(
      CurvedAnimation(
        parent: _staggeredAnimationController!,
        curve: const Interval(
          0,
          0.334,
          curve: Curves.linear,
        ),
      ),
    );

    _secondPointTopPositionAnimation =
        Tween<double>(begin: secondTopCoordination, end: 0).animate(
      CurvedAnimation(
        parent: _staggeredAnimationController!,
        curve: const Interval(
          0.1655,
          0.51,
          curve: Curves.linear,
        ),
      ),
    );

    _thirdPointTopPositionAnimation =
        Tween<double>(begin: thirdTopCoordination, end: 0).animate(
      CurvedAnimation(
        parent: _staggeredAnimationController!,
        curve: const Interval(
          0.334,
          0.668,
          curve: Curves.linear,
        ),
      ),
    );
    _firstPointTopPositionAnimationReverse =
        Tween<double>(begin: 0, end: firstTopCoordination).animate(
      CurvedAnimation(
        parent: _staggeredAnimationController!,
        curve: const Interval(
          0.334,
          0.668,
          curve: Curves.linear,
        ),
      ),
    );
    _secondPointTopPositionAnimationReverse =
        Tween<double>(begin: 0, end: secondTopCoordination).animate(
      CurvedAnimation(
        parent: _staggeredAnimationController!,
        curve: const Interval(
          0.51,
          0.8411,
          curve: Curves.linear,
        ),
      ),
    );
    _thirdPointTopPositionAnimationReverse =
        Tween<double>(begin: 0, end: thirdTopCoordination).animate(
      CurvedAnimation(
        parent: _staggeredAnimationController!,
        curve: const Interval(
          0.67,
          1,
          curve: Curves.linear,
        ),
      ),
    );

    Future.delayed(
      const Duration(seconds: 1),
      () {
        _staggeredAnimationController?.forward();
      },
    );

    Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      _staggeredAnimationController?.reset();
      // Call your function here
      _staggeredAnimationController?.forward();
    });

    // triggerTheAnimation(){
    //   _firstAnimationController?..reset()..forward();
    //   _firstPointTopPositionAnimation?.addListener(() {
    //
    //
    //     if (_firstPointTopPositionAnimation?.status == AnimationStatus.completed||_firstPointTopPositionAnimation?.status == AnimationStatus.dismissed) {
    //       _firstAnimationController?.reverse();
    //     }
    //
    //     if (_firstPointTopPositionAnimation?.value < firstTopCoordination / 2) {
    //       _secondAnimationController?.forward();
    //
    //       _secondPointTopPositionAnimation?.addListener(() {
    //
    //
    //         if (_firstPointTopPositionAnimation!.value < secondTopCoordination / 10) {
    //           _thirdAnimationController?..reset()..forward();
    //         }
    //
    //         _thirdPointTopPositionAnimation?.addStatusListener((status) {
    //           if (status == AnimationStatus.completed||status == AnimationStatus.dismissed)
    //           {
    //             _thirdAnimationController?.reverse();
    //
    //             Future.delayed(
    //               const Duration(seconds: 8),
    //                   () {
    //                 _firstAnimationController?.reset();
    //                 _secondAnimationController?.reset();
    //                 _thirdAnimationController?.reset();
    //                 _firstAnimationController?.forward();
    //
    //               },
    //             );
    //
    //
    //           }
    //
    //         });
    //
    //         // if (_thirdAnimationController?.status == AnimationStatus.completed)
    //         // {
    //         //   _thirdAnimationController?.reverse();
    //         // }
    //
    //         if (_secondAnimationController?.status == AnimationStatus.completed||_secondAnimationController?.status == AnimationStatus.dismissed) {
    //           _secondAnimationController?.reverse();
    //         }
    //       });
    //       // if (_secondAnimationController?.status ==
    //       //     AnimationStatus.completed) {
    //       //   _secondAnimationController?.reverse();
    //       // }
    //
    //     }
    //
    //
    //   });
    //
    // }

    // Future.delayed(const Duration(seconds: 2),() {
    //   triggerTheAnimation();
    //
    // },);

    startStaggeredAnimation() {}
  }

  @override
  void dispose() {
    super.dispose();
    _firstAnimationController?.dispose();
    _secondAnimationController?.dispose();
    _thirdAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: MyColors.primaryWhiteThemeColor(context),
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      centerTitle: true,
      toolbarHeight: 60,
      title: SizedBox(
        width: 200,
        // child: _buildAnimationPoints(int index),
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _firstPointTopPositionAnimation!,
            _secondPointTopPositionAnimation!,
            _thirdPointTopPositionAnimation!,
            _firstPointTopPositionAnimationReverse!,
            _secondPointTopPositionAnimationReverse!,
            _thirdPointTopPositionAnimationReverse!
          ]),
          builder: (BuildContext context, Widget? child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'HELLO',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Positioned(
                  right: 25,
                  top: _thirdPointTopPositionAnimation!.value > 0
                      ? _thirdPointTopPositionAnimation!.value
                      : _thirdPointTopPositionAnimationReverse!.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: CircleAvatar(
                      backgroundColor: widget.themeColor.splashColor,
                      radius: 3,
                    ),
                  ),
                ),
                Positioned(
                  right: 35,
                  top: _secondPointTopPositionAnimation!.value > 0
                      ? _secondPointTopPositionAnimation!.value
                      : _secondPointTopPositionAnimationReverse!.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: CircleAvatar(
                      backgroundColor: widget.themeColor.splashColor,
                      radius: 3,
                    ),
                  ),
                ),
                Positioned(
                  right: 45,
                  top: _firstPointTopPositionAnimation!.value > 0
                      ? _firstPointTopPositionAnimation!.value
                      : _firstPointTopPositionAnimationReverse!.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: CircleAvatar(
                      backgroundColor: widget.themeColor.splashColor,
                      radius: 3,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),

      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20), child: Container()),
      actions: [
        Consumer<ThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            bool switchValue = value.isThemeChanged;
            return Builder(builder: (context) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: Switch(
                      value: switchValue,
                      onChanged: (bool value) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme();
                      },
                      activeColor: Colors.white,
                      inactiveThumbImage: const AssetImage(crescentImage),
                      activeThumbImage: const AssetImage(
                        lightBulbImage,
                      ),
                      // inactiveThumbImage: const NetworkImage(
                      //     'https://img.freepik.com/free-vector/yellow-crescent-geometric-shape-vector_53876-164618.jpg'),
                      // activeThumbImage: const NetworkImage(
                      //   'https://t4.ftcdn.net/jpg/01/66/86/29/360_F_166862953_6Vy6pir6kahx4x6B5c9saPbwQ6yqNAnK.jpg',
                      // ),
                    ),
                  ));
            });
          },
        ),
      ],
    );
  }
}
