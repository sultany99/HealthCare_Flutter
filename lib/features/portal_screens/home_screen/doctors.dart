import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctore_profile.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen_controller.dart';
import 'package:hc_2/features/materials/widgets.dart';

class DoctorsScreen extends StatefulWidget {
  bool isDepartment;
  int departmentId;

  DoctorsScreen(this.isDepartment, {super.key, this.departmentId = -1});

  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final TextEditingController _controller = TextEditingController();
  String doctorSearch = '';

  @override
  Widget build(BuildContext context) {
    HomeScreenController hmc = HomeScreenController();
    return Expanded(
      child: Column(children: [
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
          width: double.infinity,
          child: const Text(
            ": الأطباء",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo Regular"),
            textAlign: TextAlign.right,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              splashRadius: 5,
              onPressed: () {
                setState(() {
                  doctorSearch = _controller.text;
                  print("dsfsdfsdoooooooooo ${doctorSearch} ${_controller.text}");
                });
              },
              icon: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Icon(Icons.search),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: 300,
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    label: const Text(
                      "بحث",
                      style: TextStyle(fontSize: 18),
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        FutureBuilder(
          future: hmc.getDoctors(doctorSearch,widget.departmentId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return const Center(
                  child: Text('No doctors found.'),
                );
              } else {
                print("asdasd");
                final doctorImage = snapshot.data[0].image;
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    // padding: EdgeInsets.all(30),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final doctor = snapshot.data[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DoctorProfile(doctor: doctor);
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      doctor.name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          doctor.jobTitle,
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                        const Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            "الاختصاص :",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Image.memory(doctor.image, height: 80,width: 80,fit: BoxFit.fill,)
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
      ]),
    );
  }
}
