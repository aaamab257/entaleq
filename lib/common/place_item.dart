import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class CustomPlaceItem extends StatelessWidget {
  final String name, logoUrl;
  final num pScore, servicesScore, wcScore, doorsScore;
  const CustomPlaceItem(
      {required this.name,
      required this.logoUrl,
      required this.pScore,
      required this.doorsScore,
      required this.servicesScore,
      required this.wcScore,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.network(logoUrl),
              const SizedBox(
                width: 2,
              ),
              Text(name),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/parcking.png' , scale: 2,),
                const SizedBox(
                  width: 8,
                ),
                RatingBarIndicator(
                  rating: (pScore.toDouble() / 10) ,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 3,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
                Spacer(),
                Image.asset('assets/images/pavement.png' , scale: 2,),
                const SizedBox(
                  width: 8,
                ),
                RatingBarIndicator(
                  rating: (servicesScore.toDouble() / 10)  ,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 3,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/doors.png' , scale: 2,),
                const SizedBox(
                  width: 8,
                ),
                RatingBarIndicator(
                  rating: (doorsScore.toDouble() / 10) ,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 3,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
                Spacer(),
                Image.asset('assets/images/wc.png' , scale: 2,),
                const SizedBox(
                  width: 8,
                ),
                RatingBarIndicator(
                  rating: (wcScore.toDouble() / 10) ,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 3,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
