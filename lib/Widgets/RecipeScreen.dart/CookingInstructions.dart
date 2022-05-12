import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  String instruction;

  Instructions(this.instruction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 25),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.drag_indicator, color: Colors.orange[400], size: 22),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  instruction,
                  style: TextStyle(
                      fontFamily: 'SansPro', fontSize: 19, color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
