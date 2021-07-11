
import 'dart:convert';

import 'package:back_pressed/back_pressed.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:xrayanalysis/Controller/Controller.dart';
import 'package:xrayanalysis/Screens/ResultScreen.dart';
Dio dio = new Dio();



class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File _image;
  final picker=ImagePicker();
  final controller = Get.put(Controller());


  postdata(){
    
  }
  Future getImageFromGallery()async{
    final pickedImage=await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage!=null){
        _image=File(pickedImage.path);
      }
      else {
        print("No Image Selected");
      }
    });
  }
  Future getImageFromCamera()async{
    final pickedImage=await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(pickedImage!=null){
        _image=File(pickedImage.path);

      }
      else {
        print("No Image Selected");
      }
    });
  }




  // uploadImageToServer(File imageFile) async {
  //   print("attempting to connect to server......");
  //
  //   var stream = new http.ByteStream(
  //       DelegatingStream.typed(imageFile.openRead()));
  //   var length = await imageFile.length();
  //   print(length);
  //
  //   var uri = Uri.parse('localhost:192.168.10.2:5000/predict/');
  //   print("connection established.");
  //   var request = new http.MultipartRequest("POST", uri);
  //
  //   var multipartFile = new http.MultipartFile('file', stream, length, filename: basename(imageFile.path));
  //   //contentType: new MediaType('image', 'png'));
  //   request.files.add(multipartFile);
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   print(response.statusCode);
  // }

  var mydata;
  var data;

  Upload(File imageFile) async {
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse('http://192.168.10.2:5000/predict/');
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      setState(() {
        mydata=value.toString();
        print(mydata);
        //decoding Data
        print('This is Response Data');
        var decodeddata=json.decode(mydata);
        controller.Atelectasis_p0=decodeddata["predictions"][0][0];
        controller.Cardiomegaly_p1=decodeddata["predictions"][0][1];
        controller.Consolidation_p2=decodeddata["predictions"][0][2];
        controller.Edema_p3=decodeddata["predictions"][0][3];
        controller.Effusion_p4=decodeddata["predictions"][0][4];
        controller.Emphysema_p5=decodeddata["predictions"][0][5];
        controller.Fibrosis_p6=decodeddata["predictions"][0][6];
        controller.Hernia_p7=decodeddata["predictions"][0][7];
        controller.Infiltration_p8=decodeddata["predictions"][0][8];
        controller.Mass_p9=decodeddata["predictions"][0][9];
        controller.NoFinding_p10=decodeddata["predictions"][0][10];
        controller.Nodule_p11=decodeddata["predictions"][0][11];
        controller.Pleural_Thickening_p12=decodeddata["predictions"][0][12];
        controller.Pneumonia_p13=decodeddata["predictions"][0][13];
        controller.Pneumothorax_p14=decodeddata["predictions"][0][14];
        print(controller.Atelectasis_p0);
      });

    });


  }





  @override
  Widget build(BuildContext context) {
    return OnBackPressed(
      perform: (){
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20.0),
            Container(

              child: _image ==null?Column(
                children: [
                  Text("No Image Selected"),
                ],
              ):Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.file(_image,height: 350,),
                  SizedBox(height: 1,),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black, //specify the button's elevation color
                      elevation: 4.0, //buttons Material shadow
                      textStyle: TextStyle(fontFamily: 'Manrope',fontWeight: FontWeight.bold,fontSize: 14),
                      //specify the button's text TextStyle
                      padding: EdgeInsets.only(right: 15,left: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)), // set the buttons shape. Make its birders rounded etc
                    ),
                    icon: Icon(
                      Icons.cloud_upload,
                      color: Colors.white,
                      size: 20.0,
                    ),



                    label: Text('Upload Image'),
                    onPressed: () {
                      print('Upload Image Button is Pressed');
                      Upload(_image);
                    },




                  )
                ],
              ),
              height: 410,
              width: 500,
            ),
            SizedBox(height: 30.0),


            //choose image from camera and gallery
            FlatButton(
              padding: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
              onPressed: getImageFromCamera,
              child: Text('Choose Image From Camera', style: TextStyle(
                  color: Colors.blue,fontSize: 18,fontFamily: 'Manrope',fontWeight: FontWeight.bold
              )),
              shape: RoundedRectangleBorder(side: BorderSide(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid
              ), borderRadius: BorderRadius.circular(50)),

            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black, //specify the button's elevation color
                elevation: 4.0, //buttons Material shadow
                textStyle: TextStyle(fontFamily: 'Manrope',fontWeight: FontWeight.bold,fontSize: 18),
                //specify the button's text TextStyle
                padding: EdgeInsets.only(top: 15,bottom: 15,right: 25,left: 25),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)), // set the buttons shape. Make its birders rounded etc
              ),
              child: Text('Choose Image From Gallery',),
              onPressed: getImageFromGallery,
            ),



          ],
        ),
      ),
    );
  }
}
