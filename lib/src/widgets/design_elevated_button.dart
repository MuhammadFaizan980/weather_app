import 'package:flutter/material.dart';

class DesignElevatedButton extends StatelessWidget {
  const DesignElevatedButton({
    Key? key,
    this.onTap,
    this.title,
    this.elevation,
    this.backgroundColor = Colors.black,
    this.titleColor = Colors.white,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.matchTextDirection = true,
    this.isLoading = false,
    this.borderRadius = 32,
    this.titleSize = 14,
    this.height = 48,
  }) : super(key: key);
  final double? height;
  final VoidCallback? onTap;
  final String? title;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final Color titleColor;
  final double? elevation;
  final bool matchTextDirection;
  final bool isLoading;
  final double borderRadius;
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Padding(
        padding: padding!,
        child: ElevatedButton(
          onPressed: isLoading ? () {} : onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: elevation,
            disabledBackgroundColor: backgroundColor.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            // padding: const EdgeInsets.symmetric(
            //   vertical: 12,
            //   horizontal: 10,
            // ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                )
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    if (title != null)
                      Center(
                        child: Text(
                          title!,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: titleSize,
                            overflow: TextOverflow.ellipsis,
                            color: onTap == null ? Colors.black.withOpacity(0.25) : titleColor,
                          ),
                        ),
                      )
                  ],
                ),
        ),
      ),
    );
  }
}
