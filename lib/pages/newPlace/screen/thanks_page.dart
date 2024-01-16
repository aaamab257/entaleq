import 'package:entaqel_task/common/btns.dart';
import 'package:entaqel_task/helpers/colors.dart';
import 'package:entaqel_task/helpers/images.dart';
import 'package:entaqel_task/pages/places/screen/places_screen.dart';
import 'package:flutter/material.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Review',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesHelper.saved,
            scale: 4,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Thanks',
            style: TextStyle(
              color: ColorsHelper.frist,
            ),
          ),
          const Text(
            'Your review submitted successfully',
          ),
          CustomButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const PlacesScreen()),
                  (route) => false);
            },
            text: 'Go To Home',
          ),
        ],
      ),
    );
  }
}
