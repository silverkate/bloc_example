import 'package:flutter/material.dart';

class ExpandedCardWidget extends StatelessWidget {
  const ExpandedCardWidget({
    required this.child,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
