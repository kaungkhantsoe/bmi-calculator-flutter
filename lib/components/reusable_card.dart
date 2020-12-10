import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({
  //   Key key,
  // }) : super(key: key);

  ReusableCard({@required this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget cardChild;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
