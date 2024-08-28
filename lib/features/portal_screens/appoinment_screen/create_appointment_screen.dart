import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_review_screen.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_screen_controller.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctor_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctors.dart';
import 'package:intl/intl.dart' as intl;

class CreateAppointmentScreen extends StatefulWidget {
  DoctorModel doctorModel;

  CreateAppointmentScreen({super.key, required this.doctorModel});

  @override
  _CreateAppointmentScreenState createState() =>
      _CreateAppointmentScreenState();
}

class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _selectedTime,
    ).then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      setState(() {
        _selectedTime = pickedTime;
      });
    });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    DoctorModel doctor = widget.doctorModel;
    AppointmentScreenController ac = AppointmentScreenController();
    var dateFormatter = intl.DateFormat('yyyy-MM-dd');
    var daterequestFormatter = intl.DateFormat('yyyy-MM-dd kk:mm');
    DateTime appointmentDate = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.outlined(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "طلبة موعد",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo Regular"),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              doctor.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Cairo Regular"),
                            ),
                          ),
                          const Text(
                            "الطبيب",
                            style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Cairo Regular"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              doctor.department,
                              style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Cairo Regular"),
                            ),
                          ),
                          Text(
                            "القسم",
                            style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Cairo Regular"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                dateFormatter.format(_selectedDate),
                                style: TextStyle(
                                    fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo Regular"),
                              ),
                            ),
                            onTap: () {
                              _presentDatePicker();
                            },
                          ),
                          Text(
                            "التاريخ",
                            style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Cairo Regular"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "${_selectedTime.format(context)}",
                                style: TextStyle(
                                    fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo Regular"),
                              ),
                            ),
                            onTap: () {
                              _presentTimePicker();
                            },
                          ),
                          Text(
                            "الوقت",
                            style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Cairo Regular"),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "الوصف",
                              style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Cairo Regular"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  controller: _controller,
                                  maxLines: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var response = await ac.setAppointment({
                            'employee_id': doctor.id,
                            'summary': _controller.text,
                            'date': daterequestFormatter.format(DateTime(
                              _selectedDate.year,
                              _selectedDate.month,
                              _selectedDate.day,
                              _selectedTime.hour,
                              _selectedTime.minute,
                            )),
                          });
                          print('$response');

                          Navigator.of(context).pop();
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        child: const Text(
                          "طلب الموعد",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
