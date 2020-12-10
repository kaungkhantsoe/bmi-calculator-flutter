import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconData, @required this.onPressed});

  final IconData iconData;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kLightGreyColor,
      elevation: 6.0,
      disabledElevation: 6.0,
      child: Icon(iconData),
    );
  }
}
