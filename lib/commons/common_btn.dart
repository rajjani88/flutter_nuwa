import 'package:flutter/material.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';

class CommonBtn extends StatelessWidget {
  final String lable;
  final Function()? onTap;
  const CommonBtn({super.key, required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(mGreen),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child: SizedBox(
            width: 360,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lable,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mBlack, fontWeight: FontWeight.w600, fontSize: 30),
              ),
            ),
          ),
        )
      ],
    );
  }
}
