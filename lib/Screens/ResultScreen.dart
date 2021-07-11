import 'package:back_pressed/back_pressed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:xrayanalysis/Controller/Controller.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final controller = Get.put(Controller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnBackPressed(
      perform: (){
        SystemNavigator.pop();
      },
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(children: [
          Row(
            children: [
              Text(
                '  Results',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope'),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Atelectasis_p0.toDouble(),
            center: Text(
              "                                           Atelectasis ",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Cardiomegaly_p1.toDouble(),
            center: Text(
              "                                           Cardiomegaly",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Consolidation_p2.toDouble(),
            center: Text(
              "                                           Consolidation",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Edema_p3.toDouble(),
            center: Text(
              "                                           Edema",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Effusion_p4.toDouble(),
            center: Text(
              "                                           Effusion",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Emphysema_p5.toDouble(),
            center: Text(
              "                                           Emphysema",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Fibrosis_p6.toDouble(),
            center: Text(
              "                                           Fibrosis",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Hernia_p7.toDouble(),
            center: Text(
              "                                           Hernia",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Infiltration_p8.toDouble(),
            animation: true,
            center: Text(
              "                                           Infiltration",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Mass_p9.toDouble(),
            center: Text(
              "                                           Mass",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.NoFinding_p10.toDouble(),
            center: Text(
              "                                           NoFinding",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Nodule_p11.toDouble(),
            center: Text(
              "                                           Nodule",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            percent: controller.Pleural_Thickening_p12.toDouble(),
            center: Text(
              "                                           Pleural_Thickening",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            animation: true,
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            animation: true,
            lineHeight: 14.0,
            percent: controller.Pneumonia_p13.toDouble(),
            center: Text(
              "                                           Pneumonia",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 20,
            lineHeight: 14.0,
            animation: true,
            percent: controller.Pneumothorax_p14.toDouble(),
            center: Text(
              "                                           Pneumothorax",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            backgroundColor: Colors.blueGrey[100],
            progressColor: Colors.blue,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(

                    title: "\nUnder Supervision",
                    content: Column(
                      children: [
                        Text("Mr. Naveed Anwer Butt\nAssistant Prof. University of Gujrat",style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),),
                        Text("www.linkedin.com/in/naveed-anwer-butt-b669a7133/\n",style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),

                        Column(
                          children: [
                            Text("Group ( BSCS 17-A )",style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),),
                            Text("*Muhammad Suleman Hamza\n*Aqeel Tariq\n*Hafiz Muneeb Ahmed ",style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                child: Tooltip(
                  message: 'App Info',
                  child: FlatButton(
                    minWidth: 100,
                    child: Icon(
                      Icons.info_outline,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      )),
    );
  }
}
