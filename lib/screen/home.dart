import 'package:bside_todolist/components/button.dart';
import 'package:bside_todolist/components/card_wrapper.dart';
import 'package:bside_todolist/design_system/colors.dart';
import 'package:bside_todolist/design_system/texts.dart';
import 'package:bside_todolist/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    var kakaoAccount = authProvider.kakaoUser?.kakaoAccount;
    var name = kakaoAccount?.profile?.nickname;
    var profileUrl = kakaoAccount?.profile?.thumbnailImageUrl;

    return Container(
      height: 200,
      decoration: BoxDecoration(color: MyColors.starGreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '일이삼사오육칠팔구십일이삼사오육',
                  style: MyTexts.KRBold17.copyWith(
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    profileUrl != null
                        ? CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(profileUrl),
                            backgroundColor: Colors.transparent,
                          )
                        : CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                          ),
                    SizedBox(height: 8),
                    name != null
                        ? Text(
                            name,
                            style: MyTexts.KRMedium14.copyWith(
                              color: Colors.white,
                            ),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    var kakaoAccount = authProvider.kakaoUser?.kakaoAccount;
    var name = kakaoAccount?.profile?.nickname;
    var profileUrl = kakaoAccount?.profile?.thumbnailImageUrl;

    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(color: MyColors.starGreen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '일이삼사오육칠팔구십일이삼사오육',
                      style: MyTexts.KRBold17.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        profileUrl != null
                            ? CircleAvatar(
                                radius: 16,
                                backgroundImage: NetworkImage(profileUrl),
                                backgroundColor: Colors.transparent,
                              )
                            : CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.transparent,
                              ),
                        SizedBox(height: 8),
                        name != null
                            ? Text(
                                name,
                                style: MyTexts.KRMedium14.copyWith(
                                  color: Colors.white,
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 90),
              SizedBox(
                height: 900,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: MyColors.starGreen,
                        child: Lottie.asset(
                          'assets/splash.json',
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 95, width: 113),
                            SizedBox(width: 36),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('수험생123 님을 위한', style: MyTexts.KRBold17),
                                  Text('오늘의 퀴즈!', style: MyTexts.KRBold17),
                                  SizedBox(height: 14),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.starGreen,
                                      shadowColor: Colors.transparent,
                                      padding: EdgeInsets.all(8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8), //
                                        // <-- Radius
                                      ),
                                      minimumSize: Size(170, 37),
                                    ),
                                    onPressed: () => {},
                                    child: Text(
                                      '오늘의 퀴즈 풀기',
                                      style: MyTexts.KRRegular14.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('오답노트 ️🗂', style: MyTexts.KRBold17),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 112,
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              height: 112,
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 56),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('퀴즈 만들기', style: MyTexts.KRBold17),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: MyCardWrapper(
                          borderRadius: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 24, horizontal: 40),
                            child: Column(
                              children: [
                                Text('복습이 필요한 문제를'),
                                Text('쏙쏙 골라서 나만의 시험을 만들어 보세요'),
                                SizedBox(height: 16),
                                MyButton(
                                  child: Text(
                                    '오늘의 퀴즈 풀기',
                                    style: MyTexts.KRBold14,
                                  ),
                                  onPressed: () {
                                    print('hello');
                                  },
                                  type: MyButtonType.starGreen,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  bool _stretch = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            stretch: _stretch,
            onStretchTrigger: () async {
              // Triggers when stretching
            },
            // [stretchTriggerOffset] describes the amount of overscroll that must occur
            // to trigger [onStretchTrigger]
            //
            // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
            // [onStretchTrigger] when the user has overscrolled by 300.0 pixels.
            stretchTriggerOffset: 300.0,
            expandedHeight: 200.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: 625,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(36),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: 95, width: 113),
                                SizedBox(width: 36),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('수험생123 님을 위한',
                                          style: MyTexts.KRBold17),
                                      Text('오늘의 퀴즈!', style: MyTexts.KRBold17),
                                      SizedBox(height: 14),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: MyColors.starGreen,
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.all(8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8), //
                                            // <-- Radius
                                          ),
                                          minimumSize: Size(170, 37),
                                        ),
                                        onPressed: () => {},
                                        child: Text(
                                          '오늘의 퀴즈 풀기',
                                          style: MyTexts.KRRegular14.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('오답노트 ️🗂', style: MyTexts.KRBold17),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 112,
                                  child: Container(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 112,
                                  child: Container(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 56),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('퀴즈 만들기', style: MyTexts.KRBold17),
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: MyCardWrapper(
                              borderRadius: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 40),
                                child: Column(
                                  children: [
                                    Text('복습이 필요한 문제를'),
                                    Text('쏙쏙 골라서 나만의 시험을 만들어 보세요'),
                                    SizedBox(height: 16),
                                    MyButton(
                                      child: Text(
                                        '오늘의 퀴즈 풀기',
                                        style: MyTexts.KRBold14,
                                      ),
                                      onPressed: () {
                                        print('hello');
                                      },
                                      type: MyButtonType.starGreen,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    ));
  }
}
