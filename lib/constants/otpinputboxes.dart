import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_app/constants/constants.dart';

Widget otpboxes(BuildContext context) {
  FocusNode otp2 = FocusNode();
  FocusNode otp3 = FocusNode();
  FocusNode otp4 = FocusNode();
  FocusNode otp5 = FocusNode();
  return Form(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 57.6,
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
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
              if (value.length == 1) {
                FocusScope.of(context).requestFocus(otp3);
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
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            focusNode: otp3,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).requestFocus(otp4);
              }
            },
            style: const TextStyle(
                fontFamily: 'sfui', fontSize: 34, fontWeight: FontWeight.bold),
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
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            focusNode: otp4,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).requestFocus(otp5);
              }
            },
            style: const TextStyle(
                fontFamily: 'sfui', fontSize: 34, fontWeight: FontWeight.bold),
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
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            focusNode: otp5,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).unfocus();
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
  );
}
