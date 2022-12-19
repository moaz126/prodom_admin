// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class UploadHouse extends StatefulWidget {
  const UploadHouse({super.key});

  @override
  State<UploadHouse> createState() => _UploadHouseState();
}

class _UploadHouseState extends State<UploadHouse> {
  List<File> multipleImages = [];
  File interior1 = File('');
  File interior2 = File('');
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('/'),
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('/'),
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                    Row(
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('/'),
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                        Container(
                          // rectangle1KJS (14:105)
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffe8e8e8),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
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
                )
              ],
            ),
          ),
        ));
  }
}
