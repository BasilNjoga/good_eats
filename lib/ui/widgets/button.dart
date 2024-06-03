import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color? color;
  final Color? titleColor;
  final ValueNotifier<bool>? loading;
  final String? leftImage;
  const Button({super.key, this.onPressed, required this.title, this.color, this.titleColor, this.loading, this.leftImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ValueListenableBuilder(
        valueListenable: loading ?? ValueNotifier(false),
        builder: (BuildContext context, bool loading, Widget? child){
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.black,
              //elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                //side: const BorderSide(color: Colors.black)
              )
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leftImage != null ?
                      SizedBox(height: 30, child: Image.asset(leftImage!)) : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: titleColor ?? (color != null ? Colors.white : Colors.white), 
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                    
                      ),
                  ),
                    loading ? const CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: Colors.transparent,
                      color: Colors.white,
                    ) : Container()
                ],
              ),
            ),
                    );
        }),
    );
  }
}