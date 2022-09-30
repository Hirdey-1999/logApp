// ignore_for_file: file_names, camel_case_types, no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log_app/constants/constants.dart';
import 'package:log_app/constants/otpinputboxes.dart';
import 'package:log_app/screens/logged.dart';
import 'package:log_app/screens/signin.dart';

class otpScreen extends StatefulWidget {
  final String phoneNumber;

  otpScreen(this.phoneNumber);

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  int start = 30;
  void timer() {
    const onSec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  String? _verificationCode;
  FocusNode otp1 = FocusNode();
  FocusNode otp2 = FocusNode();
  FocusNode otp3 = FocusNode();
  FocusNode otp4 = FocusNode();
  FocusNode otp5 = FocusNode();
  FocusNode otp6 = FocusNode();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phoneNumber}',
      codeSent: (String verificationId, resendingToken) {
        _verificationCode = verificationId;
      },
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            print('user logged in');
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );
    @override
    void initState() {
      _verifyPhone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 110,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text('Enter OTP',
                      style: GoogleFonts.lora(
                          fontSize: 28, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'An six digit code has been sent to +91-${widget.phoneNumber} ',
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'CeraPro',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.values[2],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Incorrect Number?',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Change',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => loginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 136,
              ),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 57.6,
                      child: TextFormField(
                        autofocus: true,
                        autofillHints: [AutofillHints.oneTimeCode],
                        keyboardType: TextInputType.number,
                        controller: c1,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length >= 1) {
                            FocusScope.of(context).requestFocus(otp2);
                          }
                        },
                        style: const TextStyle(
                          fontFamily: 'sfui',
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                            fillColor: kgreycolor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 57.6,
                      child: TextFormField(
                        autofocus: true,
                        controller: c2,
                        autofillHints: [
                          AutofillHints.oneTimeCode.characters.string[1]
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: otp2,
                        style: const TextStyle(
                          fontFamily: 'sfui',
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if (value.length >= 1) {
                            FocusScope.of(context).requestFocus(otp3);
                          } else {
                            FocusScope.of(context).requestFocus(otp1);
                          }
                        },
                        decoration: const InputDecoration(
                            fillColor: kyellgr,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 57.6,
                      child: TextFormField(
                        autofocus: true,
                        controller: c3,
                        keyboardType: TextInputType.number,
                        autofillHints: [
                          AutofillHints.oneTimeCode.characters.string[2]
                        ],
                        textAlign: TextAlign.center,
                        focusNode: otp3,
                        onChanged: (value) {
                          if (value.length >= 1) {
                            FocusScope.of(context).requestFocus(otp4);
                          } else {
                            FocusScope.of(context).requestFocus(otp2);
                          }
                        },
                        style: const TextStyle(
                            fontFamily: 'sfui',
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                            fillColor: kgreycolor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 57.6,
                      child: TextFormField(
                        controller: c4,
                        autofocus: true,
                        autofillHints: [
                          AutofillHints.oneTimeCode.characters.string[3]
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: otp4,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).requestFocus(otp5);
                          } else {
                            FocusScope.of(context).requestFocus(otp3);
                          }
                        },
                        style: const TextStyle(
                            fontFamily: 'sfui',
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          fillColor: kgreycolor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 57.6,
                      child: TextFormField(
                        controller: c5,
                        autofocus: true,
                        autofillHints: [
                          AutofillHints.oneTimeCode.characters.string[4]
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: otp5,
                        onChanged: (value) {
                          if (value.length >= 1) {
                            FocusScope.of(context).requestFocus(otp6);
                          } else {
                            FocusScope.of(context).requestFocus(otp4);
                          }
                        },
                        style: const TextStyle(
                          fontFamily: 'sfui',
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 57.6,
                      child: TextFormField(
                        autofillHints: [
                          AutofillHints.oneTimeCode.characters.string[5]
                        ],
                        controller: c6,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        focusNode: otp6,
                        onChanged: (value) {
                          if (value.length == 1) {
                          } else {
                            FocusScope.of(context).requestFocus(otp5);
                          }
                        },
                        style: const TextStyle(
                          fontFamily: 'sfui',
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(
                        '${c1.text}${c2.text}${c3.text}${c4.text}${c5.text}${c6.text}');
                    String pin =
                        '${c1.text}${c2.text}${c3.text}${c4.text}${c5.text}${c6.text}';
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode!, smsCode: pin))
                          .then(
                        (value) async {
                          value.user != null
                              ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => loggedIn(),
                                  ),
                                )
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text('Entered Wrong OTP'),
                                ));
                        },
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Entered Wrong OTP'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kgreencolor,
                    fixedSize: const Size(
                      380,
                      58,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'CeraPro',
                    ),
                  )),
              const SizedBox(
                height: 25,
              ),
              start == 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Didn\'t Got The OTP',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'Resend OTP',
                            style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                          onPressed: initState,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Resend OTP in ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'CeraPro',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "00:$start",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'CeraPro',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    timer();
    _verifyPhone();
    super.initState();
  }
}
