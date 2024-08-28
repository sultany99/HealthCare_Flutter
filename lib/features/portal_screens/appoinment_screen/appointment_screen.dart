import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_review_screen.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_screen_controller.dart';
import 'package:intl/intl.dart' as intl;

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    AppointmentScreenController ac = AppointmentScreenController();
    var dateFormatter = intl.DateFormat('yyyy-MM-dd – kk:mm');

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: ac.getAppointments(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return const Center(
                  child: Text('No appointments found.'),
                );
              } else {
                print("asdasdlllllllllllllllll ${snapshot.data}");
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    // padding: EdgeInsets.all(30),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final appointment = snapshot.data[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return AppointmentReviewScreen(
                                appointmentModel: appointment,
                              );
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.all(7),
                            margin: const EdgeInsets.only(
                                bottom: 7, right: 10, left: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dateFormatter.format(appointment.date),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      appointment.doctorName,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          appointment.department,
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                        const Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            "القسم :",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
