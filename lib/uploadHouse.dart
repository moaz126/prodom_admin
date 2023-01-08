// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:path/path.dart' as p;

class UploadHouse extends StatefulWidget {
  const UploadHouse({super.key});

  @override
  State<UploadHouse> createState() => _UploadHouseState();
}

class _UploadHouseState extends State<UploadHouse> {
  List<File> multipleImages = [];
  List<String> houseImages = [];
  File interior1 = File('');
  File interior2 = File('');
  String finterior1 = '';
  String finterior2 = '';
  File thumbnail = File('');
  String fthumbnail = '';
  List<String> images = [];
  final spinkit = SpinKitFadingCube(
    color: Colors.white,
    size: 2.h,
  );
  bool loader = false;
  final storageRef = FirebaseStorage.instance.ref();
  selectMultipleImages() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (result != null) {
      multipleImages =
          multipleImages + result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }
  }

  selectFile1() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => interior1 = File(path));
  }

  selectFile2() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => interior2 = File(path));
  }

  selectThumbnail() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => thumbnail = File(path));
  }

  TextEditingController groundL = TextEditingController();
  TextEditingController groundW = TextEditingController();
  TextEditingController ghalway = TextEditingController();
  TextEditingController gwardrobe = TextEditingController();
  TextEditingController ghall = TextEditingController();
  TextEditingController gbedroom = TextEditingController();
  TextEditingController gbathroom = TextEditingController();
  TextEditingController gliving = TextEditingController();
  TextEditingController gkitchen = TextEditingController();
  TextEditingController gpantry = TextEditingController();
  TextEditingController grestroom = TextEditingController();
  TextEditingController atticL = TextEditingController();
  TextEditingController atticW = TextEditingController();
  TextEditingController ahalway = TextEditingController();
  TextEditingController awardrobe = TextEditingController();
  TextEditingController ahall = TextEditingController();
  TextEditingController abedroom = TextEditingController();
  TextEditingController abathroom = TextEditingController();
  TextEditingController aliving = TextEditingController();
  TextEditingController akitchen = TextEditingController();
  TextEditingController apantry = TextEditingController();
  TextEditingController arestroom = TextEditingController();

  TextEditingController dhalway = TextEditingController();
  TextEditingController dwardrobe = TextEditingController();
  TextEditingController dhall = TextEditingController();
  TextEditingController dbedroom = TextEditingController();
  TextEditingController dbathroom = TextEditingController();
  TextEditingController dliving = TextEditingController();
  TextEditingController dkitchen = TextEditingController();
  TextEditingController dpantry = TextEditingController();
  TextEditingController drestroom = TextEditingController();
  TextEditingController technology = TextEditingController();
  TextEditingController psoCost = TextEditingController();
  TextEditingController turnkeyCost = TextEditingController();

  Widget field(TextEditingController controller) {
    return Container(
      // rectangle1KJS (14:105)
      width: 60,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color(0xffe8e8e8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: '0',
              hintStyle: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('prodom admin'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            '1-ЫЙ ЭТАЖ',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(groundL),
                        SizedBox(
                          height: 10,
                        ),
                        Text('/'),
                        field(groundW),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Прихожая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(ghalway),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Гардеробная',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(gwardrobe),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Холл',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(ghall),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Спальня',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(gbedroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Ванная комната',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(gbathroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Гостиная',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(gliving),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Кухня + столовая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(gkitchen),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Кладовая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(gpantry),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Комната отдыха',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(grestroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                //second
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'МАНСАРДА',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(atticL),
                        SizedBox(
                          height: 10,
                        ),
                        Text('/'),
                        field(atticW),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Прихожая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(ahalway),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Гардеробная',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(awardrobe),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Холл',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(ahall),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Спальня',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(abedroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Ванная комната',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(abathroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Гостиная',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(aliving),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Кухня + столовая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(akitchen),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Кладовая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(apantry),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Комната отдыха',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(arestroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),

                //thired
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    /*    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'ПЛОЩАДЬ И ГАБАРИТЫ',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dhalway),
                        SizedBox(
                          height: 10,
                        ),
                        Text('/'),
                        field(groundL),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ), */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Прихожая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dhalway),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Гардеробная',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dwardrobe),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Холл',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dhall),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Спальня',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dbedroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Ванная комната',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dbathroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Гостиная',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dliving),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Кухня + столовая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dkitchen),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Кладовая',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(dpantry),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Комната отдыха',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(drestroom),
                        SizedBox(
                          width: 10,
                        ),
                        Text('m²'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Стоимость под ПСО',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(psoCost),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 15,
                          child: Text(
                            'Стоимость под ключ',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                              decorationColor: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        field(turnkeyCost),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('ТЕХНОЛОГИЯ СТРОИТЕЛЬСТВА',
                    style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // rectangle1KJS (14:105)
                  width: 90.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xffe8e8e8),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: technology,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        border: InputBorder.none,
                        hintText: 'ТЕХНОЛОГИЯ СТРОИТЕЛЬСТВА',
                        hintStyle: TextStyle(fontSize: 12)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Thumbnail'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        await selectThumbnail();
                        setState(() {});
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: thumbnail.path == ''
                              ? DottedBorder(
                                  dashPattern: [4, 6],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.add_a_photo)),
                                )
                              : Image.file(
                                  File(thumbnail.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Images'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < multipleImages.length; i++)
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await selectMultipleImages();
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.4),
                                        ),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: multipleImages.isEmpty
                                          ? DottedBorder(
                                              dashPattern: [4, 6],
                                              strokeWidth: 2,
                                              color: Colors.grey,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child:
                                                      Icon(Icons.add_a_photo)),
                                            )
                                          : Image.file(
                                              File(multipleImages[i].path),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            multipleImages.removeAt(i);
                                          });
                                        },
                                        child: const Icon(Icons.close)))
                              ],
                            ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () async {
                              await selectMultipleImages();
                              setState(() {});
                            },
                            child: Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: DottedBorder(
                                    dashPattern: [4, 6],
                                    strokeWidth: 2,
                                    color: Colors.grey,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(Icons.add_a_photo)),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Interior images'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        await selectFile1();
                        setState(() {});
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: interior1.path == ''
                              ? DottedBorder(
                                  dashPattern: [4, 6],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.add_a_photo)),
                                )
                              : Image.file(
                                  File(interior1.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await selectFile2();
                        setState(() {});
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: interior2.path == ''
                              ? DottedBorder(
                                  dashPattern: [4, 6],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.add_a_photo)),
                                )
                              : Image.file(
                                  File(interior2.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      loader = true;
                    });
                    if (thumbnail.path != '') {
                      FirebaseStorage storage = FirebaseStorage.instance;
                      Reference ref =
                          storage.ref().child(p.basename(thumbnail.path));
                      UploadTask uploadTask = ref.putFile(thumbnail);

                      var dowurl =
                          await (await uploadTask.whenComplete(() => null))
                              .ref
                              .getDownloadURL();
                      print('dddddddddddddd');
                      print(dowurl);
                      fthumbnail = dowurl;
                    }
                    if (interior1.path != '') {
                      FirebaseStorage storage = FirebaseStorage.instance;
                      Reference ref =
                          storage.ref().child(p.basename(interior1.path));
                      UploadTask uploadTask = ref.putFile(interior1);

                      var dowurl =
                          await (await uploadTask.whenComplete(() => null))
                              .ref
                              .getDownloadURL();
                      print('dddddddddddddd');
                      print(dowurl);
                      finterior1 = dowurl;
                    }
                    if (interior2.path != '') {
                      FirebaseStorage storage = FirebaseStorage.instance;
                      Reference ref =
                          storage.ref().child(p.basename(interior2.path));
                      UploadTask uploadTask = ref.putFile(interior2);

                      var dowurl =
                          await (await uploadTask.whenComplete(() => null))
                              .ref
                              .getDownloadURL();
                      print('dddddddddddddd');
                      print(dowurl);
                      finterior2 = dowurl;
                    }
                    if (multipleImages.isNotEmpty) {
                      for (var i = 0; i < multipleImages.length; i++) {
                        FirebaseStorage storage = FirebaseStorage.instance;
                        Reference ref = storage
                            .ref()
                            .child(p.basename(multipleImages[i].path));
                        UploadTask uploadTask = ref.putFile(multipleImages[i]);

                        var dowurl =
                            await (await uploadTask.whenComplete(() => null))
                                .ref
                                .getDownloadURL();
                        print('dddddddddddddd');
                        print(dowurl);
                        houseImages.add(dowurl);
                      }
                    }

                    FirebaseFirestore.instance.collection('house').add({
                      "thumbnail": fthumbnail,
                      "interior1": finterior1,
                      "interior2": finterior2,
                      "images": houseImages,
                      "gbathroom": gbathroom.text,
                      'gbedroom': gbedroom.text,
                      'ghall': ghall.text,
                      'ghalway': ghalway.text,
                      'gkitchen': gkitchen.text,
                      'gliving': gliving.text,
                      'grestroom': grestroom.text,
                      'gpantry': gpantry.text,
                      'groundL': groundL.text,
                      'groundW': groundW.text,
                      'gwardrobe': gwardrobe.text,
                      'atticL': atticL.text,
                      'atticW': atticW.text,
                      'abathroom': abathroom.text,
                      'abedroom': abedroom.text,
                      'ahall': ahall.text,
                      'ahalway': ahalway.text,
                      'akitchen': akitchen.text,
                      'aliving': aliving.text,
                      'arestroom': arestroom.text,
                      'apantry': apantry.text,
                      'awardrobe': awardrobe.text,
                      'dbathroom': dbathroom.text,
                      'dbedroom': dbedroom.text,
                      'dhall': dhall.text,
                      'dhalway': dhalway.text,
                      'dkitchen': dkitchen.text,
                      'dliving': dliving.text,
                      'drestroom': drestroom.text,
                      'dpantry': dpantry.text,
                      'dwardrobe': dwardrobe.text,
                      'technology': technology.text,
                      'psoCost': psoCost.text,
                      'turnkeyCost': turnkeyCost.text,
                    });
                    setState(() {
                      loader = false;
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => UploadHouse()));
                  },
                  child: Container(
                    width: 70.w,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: loader
                        ? spinkit
                        : Text(
                            'Upload',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
