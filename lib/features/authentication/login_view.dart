import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hc_2/features/authentication/authentication.dart';
import 'package:hc_2/features/authentication/register.dart';
import 'package:hc_2/features/authentication/restore_password.dart';
import 'package:hc_2/features/materials/widgets.dart';
import 'package:hc_2/features/portal_screens/main_screen.dart';
import 'package:hc_2/variables.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
  }

  @override
  void dispose() {
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    super.dispose();
  }

  double pHeight = 340;
  double pWidth = 350;

  @override
  Widget build(BuildContext context) {
    Variables va = Variables();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _usernameController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double spacing = constraints.maxHeight * 0.1;
        print(spacing);
        return HCContainer(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Container(
                    height: spacing * 0.01,
                  ),
                  Image(
                    height: pHeight,
                    width: pWidth,
                    image: const AssetImage(
                        'assets/images/Health_professional_team_cuate.png'),
                  ),
                  Container(
                    height: spacing * 0.01,
                  ),
                  Column(
                    children: [
                      const Text(
                        '''قم بتسجيل الدخول الآن
             لتحصل على الرعاية التي تحتاجها''',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cairo Regular"),
                        textAlign: TextAlign.right,
                      ),
                      Container(
                        height: spacing * 0.15,
                      ),
                      Column(
                        children: [
                          InputField(
                            controller: _usernameController,
                            label: "Email",
                            radius: va.inputFieldRadius,
                            labelColor: va.inputFieldLabelColor,
                            borderColor: va.inputFieldBorderColor,
                            borderWidth: va.inputFieldBorderWidth,
                            icon: Icons.alternate_email_sharp,
                            isPassword: false,
                            onTap: () {},
                            onSubmitted: (val) {
                              FocusScope.of(context)
                                  .requestFocus(secondFocusNode);
                            },
                          ),
                          Container(
                            height: spacing * 0.15,
                          ),
                          InputField(
                            controller: _passwordController,
                            label: "Password",
                            radius: va.inputFieldRadius,
                            labelColor: va.inputFieldLabelColor,
                            borderColor: va.inputFieldBorderColor,
                            borderWidth: va.inputFieldBorderWidth,
                            icon: Icons.key_rounded,
                            isPassword: true,
                            onTap: () {
                              if (kDebugMode) {
                                print("hi InputField");
                              }
                            },
                            onSubmitted: (String val) {
                              FocusScope.of(context)
                                  .unfocus(); // Close the keyboard
                            },
                            focusNode: secondFocusNode,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const RestorePassword();
                                }));
                              },
                              child: const Text(
                                "هل نسيت كلمة المرور؟",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Container(
                        height: spacing * 0.50,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          print("7777777777");
                          var auth = Authentication();
                          var res = await auth.login(_usernameController.text,
                              _passwordController.text);

                          if (kDebugMode) {
                            print('dasdasdasdas $res');
                          }
                          if (res['success'] == true) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const MainScreen();
                            }));
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        child: const Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: spacing * 0.7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: const Text(
                              " انشئ واحد الآن",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Register();
                              }));
                            },
                          ),
                          Container(
                            width: 2,
                          ),
                          const Text("ليس لديك حساب بعد؟"),
                        ],
                      ),
                    ],
                  ),
                ])));
      }),
    );
  }
}
