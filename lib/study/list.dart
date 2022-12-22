import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class Study extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String mt;
  const Study({Key? key, required this.mt}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StudyState createState() {
    return _StudyState();
  }
}

class _StudyState extends State<Study> {
  var mlist = [];
  var total = 0;
  @override
  void initState() {
    super.initState();
    getStudy();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_interpolation_to_compose_strings
    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext ctx, int i) {
        var mitem = mlist[i];
        // return Text(mitem['En']);
        return Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('英文：${mitem['En']}'),
                  Text('中文：${mitem['Zh']}'),
                  Text('场景：${mitem['Classification']}'),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  getStudy() async {
    var response = await dio.get('http://192.168.1.3:90/searchjson');
    var result = response.data;
    // ignore: avoid_print, prefer_interpolation_to_compose_strings
    print(result);

    // try {
    //   var res = await Dio().get('http://192.168.1.3:90/searchjson');
    //   var result = res.data;
    //   print(res);
    // } catch (e) {
    //   print(e);
    // }

    setState(() {
      mlist = result['subject'];
      total = result['subject'];
    });
  }
}
