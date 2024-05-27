import 'package:flutter/material.dart';

const TempTextStyle = TextStyle(
  fontSize: 100,
  color: Colors.white,
);

const MessageTextStyle = TextStyle(
  fontSize: 60,
  color: Colors.white,
);

const EmojiTextStyle = TextStyle(
  fontSize: 60,
  color: Colors.white,
);
const ButtonTextStyle = TextStyle(fontSize: 30, color: Colors.white);

const TextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.black,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
);
