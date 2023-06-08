import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pr_galaxy/models/json_decode.dart';


class jsonProvider extends ChangeNotifier{
  String? data;

  List<decode> galaxyDetails =[];

  loadJson ()async{
    data = await rootBundle.loadString('lib/json/planet_details.json');

    List decodeList = jsonDecode(data!);

    galaxyDetails = decodeList
         .map(
            (e) =>decode.map(data:e),
    )
    .toList();
  }
}

