import 'package:entaqel_task/common/btns.dart';
import 'package:entaqel_task/common/text_field.dart';
import 'package:entaqel_task/helpers/colors.dart';
import 'package:entaqel_task/helpers/images.dart';
import 'package:entaqel_task/pages/newPlace/screen/steps.dart';
import 'package:flutter/material.dart';

class AddNewPlace extends StatefulWidget {
  const AddNewPlace({super.key});

  @override
  State<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends State<AddNewPlace> {
  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _imageUrlControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.scaffoldBg,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(ImagesHelper.circleBack)),
        backgroundColor: ColorsHelper.scaffoldBg,
        title: const Text(
          'Add a new place',
          style: TextStyle(fontSize: 14.0, fontFamily: 'Poppins'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Place Information',
              style: TextStyle(
                  fontSize: 15,
                  color: ColorsHelper.fourth,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16.5,
            ),
            const Text(
              'Place Name',
              style: TextStyle(
                  fontSize: 15,
                  color: ColorsHelper.fourth,
                  fontWeight: FontWeight.normal),
            ),
            CustomTextField(hint: '', controller: _nameControler),
            const SizedBox(
              height: 16.5,
            ),
            const Text(
              'Logo/image URL',
              style: TextStyle(
                  fontSize: 15,
                  color: ColorsHelper.fourth,
                  fontWeight: FontWeight.normal),
            ),
            CustomTextField(hint: '', controller: _imageUrlControler),
            const Spacer(),
            CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => StepsScreen(
                              placeName: _nameControler.text,
                              placeLogo: _imageUrlControler.text,
                            )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
