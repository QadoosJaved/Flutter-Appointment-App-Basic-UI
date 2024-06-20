import 'package:doctor_appointment/Constants/AppColor.dart';
import 'package:doctor_appointment/FakeData/Data.dart';
import 'package:flutter/material.dart';
import 'doctor_detail.dart';
import 'appointment_list.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  int numOfAppointments = bookedAppointments.length;
  void updateAppointmentCount() {
    setState(() {
      numOfAppointments = bookedAppointments.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.background,
        actions: [
          IconButton(
            icon: Icon(Icons.event_note),
            onPressed: () async {
              // Navigate to the appointment list screen and await the result
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppointmentList()),
              );
              updateAppointmentCount();
            },
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Dashboard Stats
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: [
                _buildDashboardCard(
                  context,
                  icon: Icons.medical_services,
                  title: 'Total Doctors',
                  value: doctors.length.toString(),
                ),
                _buildDashboardCard(
                  context,
                  icon: Icons.event_available,
                  title: 'Appointments',
                  value: numOfAppointments.toString(),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Active Doctors Label
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Active Doctors',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Doctors List
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.cardBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15.0),
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(doctors[index]['image']!),
                          ),
                          Positioned(
                            right: 3,
                            top: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green, // Green dot for active status
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        doctors[index]['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      subtitle: Text(
                        doctors[index]['description']!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.secondary,
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorDetail(doctor: doctors[index]),
                          ),
                        );
                        updateAppointmentCount();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, {required IconData icon, required String title, required String value}) {
    return Card(
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppColors.primary),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

