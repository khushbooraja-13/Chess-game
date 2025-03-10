import 'package:chess_game/components/piece.dart';
import 'package:chess_game/values/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final void Function()? onTap;

  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.isValidMove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    //if selected, square is green
    if(isSelected) {
      squareColor = Colors.green;
    }
    else if(isValidMove) {
      squareColor = Colors.greenAccent.withOpacity(0.6);
    }
    //otherwise, it's white or black
    else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        margin: EdgeInsets.all(isValidMove ? 8 : 0),
        child: piece != null
            ? Image.asset(
          piece!.imagePath,
          color:piece!.isWhite ? Colors.white : Colors.black,
        )
            : null,
      ),
    );
  }
}
