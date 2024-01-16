import 'dart:convert';

import 'package:entaqel_task/common/place_item.dart';
import 'package:entaqel_task/helpers/constant.dart';
import 'package:entaqel_task/pages/newPlace/model/places.dart';
import 'package:entaqel_task/pages/newPlace/screen/add_new_place.dart';
import 'package:entaqel_task/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  List<Places> places = List.empty(growable: true);
  late SharedPreferences sp;

  getSharedPrefrences() async {
    sp = await SharedPreferences.getInstance();
    getPlaces();
  }

  getPlaces() {
    //
    List<String>? placesListString = sp.getStringList(AppConstant.PLACE_KEY);
    if (placesListString != null) {
      places = placesListString
          .map((contact) => Places.fromJson(json.decode(contact)))
          .toList();
    }
    setState(() {});
    //
  }

  @override
  void initState() {
    getSharedPrefrences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
                maintainState: false,
                builder: (BuildContext context) => const AddNewPlace()),
          );
        },
        backgroundColor: ColorsHelper.frist,
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return CustomPlaceItem(
                  name: places[index].pName!,
                  logoUrl: places[index].pImage!,
                  pScore: places[index].pRate!,
                  servicesScore: places[index].servicesRate!,
                  wcScore: places[index].wcRate!,
                  doorsScore: places[index].doorsRate!,
                );
              }),
        ),
      ),
    );
  }
}
