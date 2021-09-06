import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:self_host_group_chat_app/features/domain/entities/onBoarding_entity.dart';
import 'package:self_host_group_chat_app/features/presentation/widgets/theme/style.dart';


import '../../../page_const.dart';
import 'login_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _pageIndex = 0;
  double _progressIndicatorValue = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          _rowWidget(),
          _pageViewBuilder(),
          SizedBox(
            height: 30,
          ),
          _buttonIndicator(),
        ],
      ),
    );
  }

  Widget _rowWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _pageIndex == 0
              ? Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Geri",style: TextStyle(color: Colors.white),)
                  ],
                )
              : Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: colorD96F43,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Geri")
                  ],
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                child: Image.asset('assets/turtle_logo.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Turtle")
            ],
          ),
          Container(
            height: 40,
            width: 40,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _pageViewBuilder() {
    return Container(
      height: 360,
      child: PageView.builder(
        itemCount: OnBoardingEntity.onBoardingData.length,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
          _progress();
        },
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                    height: 250,
                    child: Image.asset(
                        OnBoardingEntity.onBoardingData[index].image)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${OnBoardingEntity.onBoardingData[index].heading}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${OnBoardingEntity.onBoardingData[index].description}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buttonIndicator() {
    return Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: LinearPercentIndicator(
              lineHeight: 12.0,
              animation: true,
              animateFromLastPercent: false,
              restartAnimation: false,
              percent: _progressIndicatorValue,
              backgroundColor: Colors.grey,
              progressColor: colorD96F43,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              if (_pageIndex==2){
                Navigator.pushNamed(context,PageConst.loginPage);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    _pageIndex == 2 ? "Let's just begin" : "Go on",
                    style: TextStyle(color: colorD96F43, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: colorD96F43,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _progress() {
    setState(() {
      if (_pageIndex == 0) {
        _progressIndicatorValue = 0.3;
      } else if (_pageIndex == 1) {
        _progressIndicatorValue = 0.7;
      } else {
        _progressIndicatorValue = 1.0;
      }
    });
  }
}
