import 'package:flutter/material.dart';

var animationMS = 300;

class Accordion extends StatefulWidget {
  final String title;
  final Widget body;
  const Accordion({super.key, required this.title, required this.body});

  @override
  State<Accordion> createState() => _AppAccordionState();
}

class _AppAccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var open = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: animationMS),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if (open) {
              _controller.animateTo(0 / 360);
            } else {
              _controller.animateTo(180 / 360);
            }
            setState(() {
              open = !open;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              RotatedBox(
                quarterTurns: 3,
                child: RotationTransition(
                  turns: _controller,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(
            width: double.infinity,
          ),
          secondChild: Column(
            children: [
              const Divider(),
              widget.body,
            ],
          ),
          crossFadeState:
              open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(
            milliseconds: animationMS,
          ),
        ),
      ],
    );
  }
}
