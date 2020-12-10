import 'package:flutter/cupertino.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  // const ReusableGender({
  //   Key key,
  // }) : super(key: key);

  final String label;
  final IconData iconData;

  IconContent({@required this.label, @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.iconData,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          this.label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
