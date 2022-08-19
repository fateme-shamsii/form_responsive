import 'package:flutter/material.dart';

class FormsDesign extends StatelessWidget {
  var valid;
  String? hint;
  String? text;
  Icon? icon;
  double? width;
  double? height;
  FormsDesign(
      this.valid, this.hint, this.text, this.icon, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: const Color.fromARGB(255, 148, 48, 163),
                  )),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    text!,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: hint,
                  prefixIcon: icon,
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  contentPadding: const EdgeInsets.only(left: 10.0),
                ),
                validator: valid,
              ),
            ),
          ])),
    );
  }
}

OutlineInputBorder myinputborder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Color.fromRGBO(110, 106, 106, 0.639),
        width: 0.8,
      ));
}

OutlineInputBorder myfocusborder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 148, 48, 163),
        width: 0.8,
      ));
}
