import 'package:entaqel_task/helpers/colors.dart';
import 'package:entaqel_task/helpers/constant.dart';
import 'package:entaqel_task/pages/newPlace/model/places.dart';
import 'package:entaqel_task/pages/newPlace/model/review_model.dart';
import 'package:entaqel_task/pages/newPlace/screen/thanks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepsScreen extends StatefulWidget {
  final String placeName;
  final String placeLogo;
  const StepsScreen(
      {required this.placeLogo, required this.placeName, super.key});

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  int currentStep = 0;
  num parckingScore = 0, pavmentScore = 0, servicesAccessScore = 0, wcScore = 0;
  late SharedPreferences sharedPreference;
  int currentIndexResponse = 0;
  List<Places> places = List.empty(growable: true);

  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
  }

  loadSharedPreferences() async {
    sharedPreference = await SharedPreferences
        .getInstance(); //Instantiating the object of SharedPreferences class.
  }

  List<Places> getPlaces() {
    List<String>? placesListString =
        sharedPreference.getStringList(AppConstant.PLACE_KEY);
    if (placesListString != null) {
      places = placesListString
          .map((contact) => Places.fromJson(json.decode(contact)))
          .toList();
      return places;
    } else {
      return [];
    }
  }

  savePlace() async {
    List<String> placesListString =
        places.map((place) => jsonEncode(place.toJson())).toList();
    sharedPreference.setStringList(AppConstant.PLACE_KEY, placesListString);
  }

  Future<List<ReviewModle>> readJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('assets/data/review_questions.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ReviewModle.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Review'),
      ),
      body: FutureBuilder(
          future: readJsonData(),
          builder: (context, response) {
            if (response.hasError) {
              return Center(child: Text("${response.error}"));
            } else if (response.hasData) {
              var items = response.data as List<ReviewModle>;
              List<Step> getSteps() {
                List<Step> steps = [];
                for (var item in items) {
                  steps.add(Step(
                    isActive: currentStep >= int.parse(item.id!),
                    title: const Text(''),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.network(item.steps![0].imageUrl!),
                        Text(
                          item.steps![0].title!,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height / 2,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: item.steps![0].responses!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ListTile(
                                    selectedColor: ColorsHelper.frist,
                                    trailing: currentIndexResponse == index
                                        ? Icon(Icons.check_box)
                                        : SizedBox(),
                                    shape: currentIndexResponse == index
                                        ? RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : null,
                                    selected: currentIndexResponse == index,
                                    onTap: () {
                                      setState(() {
                                        switch (currentStep) {
                                          case 0:
                                            parckingScore = item.steps![0]
                                                .responses![index].score!;
                                          case 1:
                                            pavmentScore = item.steps![0]
                                                .responses![index].score!;
                                          case 2:
                                            servicesAccessScore = item.steps![0]
                                                .responses![index].score!;
                                          case 3:
                                            wcScore = item.steps![0]
                                                .responses![index].score!;
                                        }
                                        currentIndexResponse = index;
                                      });
                                    },
                                    title: Text(item
                                        .steps![0].responses![index].title!),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ));
                }
                return steps;
              }

              return Stepper(
                controlsBuilder: (context, details) {
                  return Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: FloatingActionButton(
                          onPressed: details.onStepCancel,
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: FloatingActionButton(
                          backgroundColor: ColorsHelper.frist,
                          onPressed: details.onStepContinue,
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                onStepContinue: () async {
                  bool isFinished = currentStep == getSteps().length - 1;
                  if (isFinished) {
                    Places place = Places(
                        pName: widget.placeName,
                        pImage: widget.placeLogo,
                        pRate: parckingScore,
                        doorsRate: pavmentScore,
                        servicesRate: servicesAccessScore,
                        wcRate: wcScore);
                    getPlaces().add(place);
                    savePlace();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ThanksScreen()),
                        (route) => false);
                  } else {
                    setState(() {
                      currentStep++;
                      currentIndexResponse = 0;
                    });
                  }
                },
                onStepCancel: () {
                  setState(() {
                    currentStep > 0 ? currentStep-- : Navigator.pop(context);
                  });
                },
                currentStep: currentStep,
                type: StepperType.horizontal,
                steps: getSteps(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
