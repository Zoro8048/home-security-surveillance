import 'package:flutter/material.dart';
import 'package:my_app/src/core/theme/theme.dart';

class UnknownCard extends StatelessWidget {
  final String text;
  final double opacity;
  final bool reject;
  const UnknownCard({
    super.key,
    this.text = "",
    this.opacity = 0,
    this.reject = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Theme.of(context).colorScheme.shadowColor,
      color: Theme.of(context).colorScheme.dark,
      child: Stack(
        children: [
          Image.network(
            "https://i.kym-cdn.com/photos/images/original/001/534/993/542.jpg",
            fit: BoxFit.contain,
            height: double.infinity,
          ),
          Opacity(
            opacity: opacity,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: reject
                        ? Theme.of(context).colorScheme.errorColor
                        : Theme.of(context).colorScheme.successColor,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: Text(
                  text,
                  style: TextStyle(
                    color: reject
                        ? Theme.of(context).colorScheme.errorColor
                        : Theme.of(context).colorScheme.successColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
