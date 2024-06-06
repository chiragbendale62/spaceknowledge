import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaceknowledge/providers/index_provider.dart';

class BottomBarItemWidget extends StatelessWidget {
  const BottomBarItemWidget({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight,
    required this.index,
    required this.activeImagePath,
  });

  final void Function()? onTap;
  final int index;
  final String imagePath;
  final String activeImagePath;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<IndexProvider>(context, listen: true);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              reverseDuration: const Duration(milliseconds: 250),
              crossFadeState: provider.selectedIndex == index ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: Image.asset(
                imagePath,
                width: imageWidth,
                height: imageHeight,
              ),
              secondChild: Image.asset(
                activeImagePath,
                width: imageWidth,
                height: imageHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
