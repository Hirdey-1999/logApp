// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log_app/constants/constants.dart';
import 'package:log_app/screens/otpScreen.dart';
import 'package:log_app/screens/signin.dart';
import 'package:toggle_switch/toggle_switch.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneNumberController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 86,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 26,
              ),
              ToggleSwitch(
                labels: const ['Signin', 'Signup'],
                initialLabelIndex: 1,
                customTextStyles: const [
                  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.04,
                    fontFamily: 'CeraPro',
                  )
                ],
                borderColor: const [kwhitecolor],
                borderWidth: 1,
                minHeight: 50,
                minWidth: 100,
                fontSize: 14,
                activeBgColor: const [kgreencolor],
                cornerRadius: 35,
                radiusStyle: true,
                inactiveBgColor: Colors.white,
                changeOnTap: true,
                onToggle: (index) =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const loginPage(),
                )),
              ),
            ],
          ),
          Column(children: [
            const SizedBox(
              height: 68,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 17,
                ),
                Text(
                  'Welcome to App',
                  style: GoogleFonts.lora(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 58,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 17,
                ),
                Text(
                  ' Please signup with your phone number to \n get registered',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade800,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/indiaFlag.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              '+91',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'CeraPro',
                                color: kgreycolor,
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      child: Text(
                        '|',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w100,
                          height: 1,
                          color: kgreycolor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                            color: kgreycolor,
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => otpScreen(_phoneNumberController.text),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kgreencolor,
                fixedSize: const Size(380, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CeraPro'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
