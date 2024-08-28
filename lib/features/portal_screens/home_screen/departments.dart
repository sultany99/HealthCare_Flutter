import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/home_screen/department_profile.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen_controller.dart';
import 'package:hc_2/features/materials/widgets.dart';

class DepartmentsScreen extends StatefulWidget {
  const DepartmentsScreen({super.key});

  @override
  _DepartmentsScreenState createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    HomeScreenController().getDepartments();
  }
  @override
  Widget build(BuildContext context) {
    HomeScreenController hmc = HomeScreenController();
    return Column(children: [
      Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        width: double.infinity,
        child: const Text(
          ": الأقسام",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo Regular"),
          textAlign: TextAlign.right,
        ),
      ),
      SizedBox(
        height: 40,
        child: FutureBuilder(
          future: hmc.getDepartments(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            else if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return const Center(
                  child: Text('No departments found.'),
                );
              } else {
                print("asdasd ${snapshot.data}");
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    // padding: EdgeInsets.all(30),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final department = snapshot.data[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DepartmentProfile(department: department,);
                            }));
                          },
                          child: Text(
                            department.name,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo Regular"),
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
    ]);
  }
}
