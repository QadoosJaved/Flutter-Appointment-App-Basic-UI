import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:doctor_appointment/Constants/AppColor.dart';
import 'package:doctor_appointment/FakeData/Data.dart';
import 'package:flutter/material.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appointments',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: bookedAppointments.length,
          itemBuilder: (context, index) {
            final appointment = bookedAppointments[index];
            return Card(
              color: AppColors.cardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5.0,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15.0),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(appointment['image']!),
                ),
                title: Text(
                  appointment['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                subtitle: Text(
                  appointment['description']!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                  ),
                ),
                trailing: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.cardBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      bookedAppointments.removeAt(index);
                    });
                    final snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Success!',
                      color: AppColors.primary,
                      message:
                          'This appointment has been removed!',
                      contentType: ContentType.success,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
                  },
                  child: Text('Cancel'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
