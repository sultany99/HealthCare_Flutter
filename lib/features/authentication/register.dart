import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hc_2/features/authentication/authentication.dart';
import 'package:hc_2/features/materials/widgets.dart';
import 'package:hc_2/variables.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
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
                        'assets/images/Boost_your_inmune_system_amico.png'),
                  ),
                  Container(
                    height: spacing * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: const Text(
                          '''إنشاء حساب جديد''',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo Regular"),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        height: spacing * 0.25,
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
                        ],
                      ),
                      Container(
                        height: spacing * 0.70,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var auth = Authentication();
                          var res = auth.register('test', '123');
                          if (kDebugMode) {
                            print(res);
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        child: const Text(
                          "إنشاء حساب",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: spacing * 0.7,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "العودة لصفحة تسجيل الدخول",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ])));
      }),
    );
  }
}
