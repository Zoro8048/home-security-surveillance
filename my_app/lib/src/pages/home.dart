import 'package:flutter/material.dart';
import 'package:my_app/src/core/theme/theme.dart';
import 'package:my_app/src/pages/list.dart';
import 'package:my_app/src/pages/unknown_person_page.dart';
import 'package:my_app/src/widgets/screen_wrapper.dart';

enum Tabs { home, list, liveCamera }

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tab = Tabs.home;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Column(
        children: [
          Expanded(
            child: tab == Tabs.home
                ? const UnknownPersonPage()
                : tab == Tabs.list
                    ? const List()
                    : const Placeholder(),
          ),
          Card(
            shape: Border.all(
              width: 0,
              color: Theme.of(context).colorScheme.transparent,
            ),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      tab = Tabs.home;
                    });
                  },
                  icon: const Icon(
                    Icons.home,
                    size: 28,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      tab = Tabs.list;
                    });
                  },
                  icon: const Icon(
                    Icons.window_outlined,
                    size: 28,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      tab = Tabs.liveCamera;
                    });
                  },
                  icon: const Icon(
                    Icons.camera_outdoor,
                    size: 28,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
