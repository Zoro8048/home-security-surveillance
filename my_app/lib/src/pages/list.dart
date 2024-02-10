import 'package:flutter/material.dart';
import 'package:my_app/src/core/theme/theme.dart';
import 'package:my_app/src/widgets/detail_form.dart';
import 'package:my_app/src/widgets/fade_animation.dart';
import 'package:my_app/src/widgets/screen_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return FadeAnimation(
            milliseconds: index * 100,
            child: const ListItem(),
          );
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 20,
      ),
      elevation: 4,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Image.network(
                  'https://i.kym-cdn.com/photos/images/original/001/534/993/542.jpg',
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black12,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Rahul",
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.backgroundColor,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              try {
                                await launchUrl(Uri.parse("tel:9347701688"));
                              } catch (err) {
                                print(err);
                              }
                            },
                            icon: Icon(
                              Icons.phone,
                              color:
                                  Theme.of(context).colorScheme.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const DetailForm(),
        ],
      ),
    );
  }
}
