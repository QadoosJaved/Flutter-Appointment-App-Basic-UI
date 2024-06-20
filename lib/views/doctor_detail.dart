import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:doctor_appointment/Constants/AppColor.dart';
import 'package:doctor_appointment/FakeData/Data.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
// Import the color palette

class DoctorDetail extends StatefulWidget {
  final Map<String, String> doctor;

  DoctorDetail({required this.doctor});

  @override
  _DoctorDetailState createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  bool isBooked = false;
  
  void bookAppointment  () {
    setState(() {
      isBooked = true;
      bookedAppointments.add(widget.doctor);
    });
    final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Success!',
      color: AppColors.primary,
      message:
          'Appointment booked with ${widget.doctor['name']}!',
      contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      widget.doctor['image']!,
                      width: double.infinity,
                      //height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.fitHeight,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.doctor['name']!,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop( context),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          widget.doctor['description']!,
                          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Experience: ${widget.doctor['experience']}',
                          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Specialization: ${widget.doctor['specialization']}',
                          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.doctor['details']!,
                          style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
                        ),
                        Spacer(),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: isBooked ? null : bookAppointment,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                isBooked ? 'Appointment Booked' : 'Book an Appointment',
                                style: TextStyle(fontSize: 16, color: AppColors.cardBackground, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
