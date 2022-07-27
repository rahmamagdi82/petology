import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';

late String? token;

Widget textButton({
  required Function onPressed,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 30.0,
          fontFamily: 'Arial',
          color: HexColor('#C9C9C9'),
          height: 1.1333,
        ),
      ),
    );

Widget buttonInAppBar({
  bool selected = false,
  required Function onPressed,
  required String text,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 62.0,
        width: 208.0,
        decoration: BoxDecoration(
          border: Border.all(color: defaultColor, width: 2.0),
          borderRadius: BorderRadius.circular(28.0),
          color: (selected) ? HexColor('#FFFFFF') : null,
        ),
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 30.0,
              fontFamily: 'Arial',
              color: HexColor('#C9C9C9'),
            ),
          ),
        ),
      ),
    );

Widget fotterItems({
  required IconData icon,
  required String text,
}) =>
    Row(
      children: [
        Icon(
          icon,
          color: HexColor('#AE957B'),
          size: 53.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 41.0,
            fontWeight: FontWeight.bold,
            color: HexColor('#AE957B'),
          ),
        ),
      ],
    );

Widget textFormField({
  required TextEditingController controller,
  required TextInputType kType,
  required String? Function(String?) validator,
  required String label,
  IconData? suffix,
  bool locationIcon = false,
  bool obscure = false,
  Function? show,
}) =>
    Material(
      color: Colors.white,
      elevation: 6.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(41.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 80.0,
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          obscureText: obscure,
          validator: validator,
          controller: controller,
          keyboardType: kType,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: label,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              fontFamily: 'Arial',
            ),
            suffix: (locationIcon) ? Icon(Icons.location_on) : null,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );

Widget dropButton({
  String? itemSelected,
  required List items,
  required String hint,
Function(String?)? change,
})=>Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  shadowColor: Colors.black,
  elevation: 6.0,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(41.0)
  ),
  child: Container(
    padding: const EdgeInsets.all(12.0),
    height: 80.0,
    child: DropdownButton<String>(
      underline: SizedBox(),
      value: itemSelected,
      items: items.map((e) => DropdownMenuItem<String>(
        value: e,
        child: Text(
            e,
            style:TextStyle(fontSize: 25)),
      )).toList(),
      onChanged: change,
      hint:Text(
        hint,
        style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          fontFamily: 'Arial',
        ),
      ),
      icon:Icon(Icons.keyboard_arrow_down_rounded),
      isExpanded: true,
    ),
  ),
);

Widget button({
  required String text,
  required String buttonColor,
  required String textColor,
  required Function onPressed,
}) =>
    Material(
      elevation: 6.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(54.0),
      color: HexColor(buttonColor),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 80.0,
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            text,
            style: TextStyle(
              color: HexColor(textColor),
              fontFamily: 'Arial',
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

Widget categoryCard({
  required Function(bool) hover,
  required bool nameSelected,
  required String image,
  required VoidCallback onTap}) =>
    InkWell(
      onTap: onTap,
      onHover: hover,
      child: Container(
        height: 350.0,
        width: 330.0,
        decoration: BoxDecoration(
          color: (nameSelected) ? HexColor('#FFE3C5') : null,
          borderRadius: BorderRadius.circular(37.0),
          border: Border.all(
            width: 4.0,
            color: HexColor('#492F24'),
          ),
        ),
        child: Image(
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
