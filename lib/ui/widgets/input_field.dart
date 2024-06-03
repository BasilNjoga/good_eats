import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final bool isPassword;
  final TextInputType type;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Widget? icon;

  const InputField({super.key,
  this.hintText,
  this.isPassword = false,
  this.type = TextInputType.text,
  this.onSaved,
  this.validator, this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
                style: const TextStyle(color: Colors.black),
                validator: validator ?? (String? value) {
                  return value == null || value.isEmpty
                      ? 'Field is required'
                      : null;
                },
                //keyboardType: TextInputType.multiline,
                maxLines: 1,
                decoration:  InputDecoration(
                  hintStyle: const TextStyle(color: Colors.black45, fontSize: 17, fontFamily: 'Lato'),
                  hintText: hintText,
                  suffixIcon: icon,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                    
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black12)
                      ),
                       errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.red)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black12)
                      ),
                    //filled: true,
                    //fillColor: Colors.white,
                                      
                        ),
                    obscureText: isPassword,
                    keyboardType: type,
                    onSaved: onSaved,
                    controller: controller,
                    ),
    );
  }
}