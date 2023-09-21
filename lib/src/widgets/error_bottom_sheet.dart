import 'package:flutter/material.dart';
import 'package:it_zone_task/src/widgets/design_elevated_button.dart';

class ErrorBottomSheet extends StatelessWidget {
  const ErrorBottomSheet({
    Key? key,
    this.title,
    this.onPositiveTapped,
    this.onNegativeTapped,
    this.subtitle,
    this.negativeBtnTitle,
    this.positiveBtnTitle,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final String? negativeBtnTitle;
  final String? positiveBtnTitle;
  final Function()? onPositiveTapped;
  final Function()? onNegativeTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 26),
            const Icon(
              Icons.error_outline_sharp,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(
              height: 28,
            ),
            Visibility(
              visible: title != null,
              child: Column(
                children: [
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Text(
              subtitle ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            DesignElevatedButton(
              title: positiveBtnTitle ?? 'Ok',
              borderRadius: 16,
              titleColor: Colors.white,
              onTap: onPositiveTapped,
            ),
            const SizedBox(
              height: 16,
            ),
            negativeBtnTitle != null
                ? DesignElevatedButton(
                    borderRadius: 16,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    title: negativeBtnTitle ?? '',
                    onTap: onNegativeTapped,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
