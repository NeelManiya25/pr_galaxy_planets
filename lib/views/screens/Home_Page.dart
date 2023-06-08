import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pr_galaxy/controllers/providers/json_provider.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

  }
  loadData()async{
    Provider.of<jsonProvider>(context,listen: false).loadJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  padding: EdgeInsets.all(6.w),
                  height: 18.h,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('settings_page');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.settings, size: 4.h),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Settings",
                              style: TextStyle(fontSize: 2.5.h),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('favorites_page');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.favorite_border_rounded, size: 4.h),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Favorites",
                              style: TextStyle(fontSize: 2.5.h),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.dehaze),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<jsonProvider>(context).galaxyDetails.length,
      itemBuilder:(context,index) => Container(
        child: Column(
          children: [
            TweenAnimationBuilder(tween: Tween<double>(
              begin: 0,
              end: 2 * pi,
            ),
                duration: Duration(seconds: 8),
                curve: Curves.easeInOut,
                child: Image.asset(Provider.of<jsonProvider>(context,listen: false)
                    .galaxyDetails[index]
                    .image),
                builder: (context,value,widget){
              return Transform.rotate(
                  angle: value,
                 child: widget,
              );
                }
            ),
          ],
        ),
      ),
      ),
    );
  }
}
