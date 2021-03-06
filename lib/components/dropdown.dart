import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final double padding;
  final Function onChange;
  final bool isUnderline;
  const DropDown({
    this.hintText = "",
    this.padding = 10,
    required this.items,
    required this.onChange,
    this.isUnderline = false,
    Key? key,
  }) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String currentSelectedValue = "";

  @override
  void initState() {
    currentSelectedValue = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: widget.padding),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              border: widget.isUnderline
                  ? UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              isDense: true,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text(widget.hintText),
                value: currentSelectedValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue!;
                  });
                  widget.onChange(newValue);
                },
                items: widget.items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
