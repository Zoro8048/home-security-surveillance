import 'package:flutter/material.dart';
import 'package:my_app/src/core/theme/theme.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  final bool? loading;
  const ScreenWrapper({
    Key? key,
    required this.child,
    this.floatingActionButton,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.backgroundColor,
      body: SafeArea(
        bottom: false,
        top: true,
        child: Stack(
          children: [
            IgnorePointer(
              ignoring: loading ?? false,
              child: child,
            ),
            if (loading ?? false)
              Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.backgroundColor,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
