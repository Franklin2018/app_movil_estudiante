import 'package:flutter/material.dart';
import 'package:app_movil_estudiante/widgets/custom_chip.dart';
import 'package:app_movil_estudiante/widgets/image_circle_widget.dart';

class MyCustomList extends StatelessWidget {
  final title;
  final subtitle;
  final imgUri;
  final auxiliar;
  final item;
  final nameButton;
  final Function onPressed;

  const MyCustomList(
      {Key key,
      this.title,
      this.subtitle,
      this.imgUri,
      this.auxiliar,
      this.onPressed,
      this.item,
      this.nameButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      margin: EdgeInsets.only(right: 12, left: 12, top: 8, bottom: 8),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          key: Key('padre'),
          children: [
            Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                key: Key('hijo 2'),
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.yellow,
                            alignment: Alignment.topLeft,
                            child: ImageCircleWidget(
                              key: Key('value'),
                              fotoUrl: imgUri,
                              height: 50.0,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                          Row(
                            children: [
                              Text(this.subtitle,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 182, 183, 183),
                                      fontSize: 14),
                                  softWrap: true),
                              Icon(Icons.medical_services, color: Colors.black38,)
                            ],
                          )
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text('12-Nov-20',
                            style: TextStyle(
                                color: Color.fromARGB(255, 182, 183, 183),
                                fontSize: 12),
                            softWrap: true),
                      ))
                ],
              ),
            ),
            SizedBox(height: 5),
            Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                key: Key('hijo 2'),
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomChip(
                            label: 'Verificado',
                            textcolor: Colors.white,
                            color: Color.fromARGB(255, 32, 217, 148),
                            scale: .8,
                            fontSize: 12.0,
                          ),
                          CustomChip(
                            // key: Key('dw'),
                            label: '15-05-20',
                            textcolor: Color.fromARGB(255, 182, 183, 183),
                            color: Colors.transparent,
                            scale: .8,
                            fontSize: 10.0,
                          )
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Text('Co dsa das das dasd das dasdmentario',
                          style: TextStyle(
                              color: Color.fromARGB(255, 182, 183, 183),
                              fontSize: 15),
                          softWrap: true)),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: CustomChip(
                          key: Key('value'),
                          label: '4.0',
                          textcolor: Colors.white,
                          color: Color.fromARGB(255, 32, 217, 148),
                        ),
                      ))
                ],
              ),
            ),
            Divider(
              // color: Colors.black,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      this.item ?? "",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                      softWrap: true,
                    ),
                  ),
                
                MaterialButton(
                  child: Text(nameButton,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  color: Theme.of(context).primaryColor,
                  shape: StadiumBorder(),
                  elevation: 0,
                  splashColor: Colors.transparent,
                  onPressed: this.onPressed,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
