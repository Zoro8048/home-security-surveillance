import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/widgets/unknown_person.dart';

class UnknownPersonPage extends StatefulWidget {
  const UnknownPersonPage({super.key});

  @override
  State<UnknownPersonPage> createState() => _UnknownPersonPageState();
}

class _UnknownPersonPageState extends State<UnknownPersonPage> {
  var text = "";
  bool reject = false;
  var iIndex = 0;
  List<double> opacityArr = List.generate(10, (index) => 0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: AppinioSwiper(
        onCardPositionChanged: (position) {
          print(iIndex);
          var halfWidth = MediaQuery.of(context).size.width / 2;
          if (position.offset.dx < 0) {
            text = "REJECT";
            reject = true;
          } else {
            text = "APPROVE";
            reject = false;
          }
          double opacity = (position.offset.dx / halfWidth);
          if (opacity < 0) {
            opacity = -1 * opacity;
          }
          if (opacity > 1) {
            opacity = 1;
          }
          opacityArr[iIndex - 1] = opacity;
          setState(() {});
        },
        cardCount: 10,
        swipeOptions: const SwipeOptions.only(
          up: false,
          down: false,
          left: true,
          right: true,
        ),
        onSwipeEnd: (a, b, c) {
          print(c.end?.dx);
          if (c.end == null) {
            return;
          }
          setState(() {
            text = "";
            opacityArr[iIndex - 1] = 0;
          });
          if (c.end!.dx > 0) {
            // TODO: implement approve
          } else {
            // TODO: implement reject
          }
        },
        cardBuilder: (context, index) {
          iIndex = index;
          return UnknownCard(
            opacity: opacityArr[index],
            text: text,
            reject: reject,
          );
        },
        backgroundCardOffset: const Offset(0.1, 0.1),
        onEnd: () {
          print("End reached");
        },
        threshold: 100,
      ),
    );
  }
}
