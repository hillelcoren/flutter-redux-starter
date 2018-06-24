import 'package:flutter/material.dart';

class SaveIconButton extends StatelessWidget {

  SaveIconButton({this.isLoading, this.onPressed});
  final bool isLoading;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {

    if (isLoading) {
      return IconButton(
        onPressed: null,
        icon: SizedBox(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    }

    return IconButton(
      onPressed: onPressed,
      tooltip: 'Save',
      icon: Icon(
        Icons.cloud_upload,
        color: Colors.white,
      ),
    );
  }
}