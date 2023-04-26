// ignore_for_file: prefer_const_constructors, unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NasabahController extends GetxController {

  RxString setTimerNasabah = "".obs;
  RxString setDateNasabah = "".obs;

  String _formatDate(DateTime dateTime) {
    return DateFormat(
    "EEEE, d MMMM yyyy","id_ID"
  ).format(dateTime);
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    final String formattedDate = _formatDate(now);
    // setState(() {
    //   _timeString = formattedDateTime;
    // });
    setTimerNasabah.value = formattedDateTime;
    setDateNasabah.value = formattedDate;
  }


  // ignore: todo
  // TODO: Implement NasabahController

  final count = 0.obs;

  @override
  void onInit() {
    setTimerNasabah.value = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
