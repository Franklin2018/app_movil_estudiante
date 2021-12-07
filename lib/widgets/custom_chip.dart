import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final label;
  final color;
  final textcolor;
  final scale;
  final fontSize;
  const CustomChip(
      {Key key,
      @required this.label,
      this.color,
      this.textcolor,
      this.fontSize,
      this.scale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: this.scale ?? 1.0,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 3, bottom: 3, right: 3, left: 3),
        decoration: BoxDecoration(
          border: Border.all(
              color: this.color ?? Color.fromARGB(255, 243, 245, 249)),
          borderRadius: BorderRadius.circular(150),
          color: this.color ?? Color.fromARGB(255, 243, 245, 249),
        ),

        child: Text(
          label,
          style: TextStyle(
              color: this.textcolor ?? Color.fromARGB(255, 36, 33, 52),
              fontSize: this.fontSize ?? 12),
        ),
        // labelPadding: EdgeInsets.all(2.0),
        // avatar: CircleAvatar(
        //   backgroundColor: Colors.white70,
        //   child: Text(label[0].toUpperCase()),
        // ),
        // label: Text(
        //   label,
        //   style: TextStyle(
        //       color: this.textcolor ?? Color.fromARGB(255, 36, 33, 52),
        //       fontSize: this.fontSize ?? 12),
        // ),
        // backgroundColor: this.color ?? Color.fromARGB(255, 243, 245, 249),
        // elevation: 3.0,
        // shadowColor: Colors.grey[60],
        // padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
