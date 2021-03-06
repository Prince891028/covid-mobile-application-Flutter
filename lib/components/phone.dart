import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatefulWidget {
  final Function setPhoneNumber;
  final String initialValue;
  const PhoneNumberInput(
      {required this.setPhoneNumber, this.initialValue = "", Key? key})
      : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String isoCode = "";
  PhoneNumber initialNumber = PhoneNumber();
  void getPhoneNumberInfo() async {
    try {
      PhoneNumber number =
          await PhoneNumber.getRegionInfoFromPhoneNumber(widget.initialValue);
      setState(() {
        initialNumber = number;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getPhoneNumberInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          widget.setPhoneNumber(number.phoneNumber ?? "");
        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
          trailingSpace: false,
          showFlags: false,
        ),
        initialValue: initialNumber,
        maxLength: 15,
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.black),
        formatInput: true,
        keyboardType:
            TextInputType.numberWithOptions(signed: true, decimal: true),
        inputDecoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          isDense: true,
          focusColor: Colors.black12,
          fillColor: Colors.black12,
          hoverColor: Colors.black12,
        ),
        isEnabled: widget.initialValue == "" ? true : false,
        hintText: "Mobile Number",
      ),
    );
  }
}
