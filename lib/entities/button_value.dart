import 'package:calculator/utils/color_utils.dart';

enum ButtonType {
  operator,
  number,
  controller,
  divider
}

enum ButtonValue {
  btnDel(text: 'D', color: ColorType.primaryLight, size: 4, type: ButtonType.controller),
  btnClr(text: 'C', color: ColorType.primaryLight, size: 4, type: ButtonType.controller),
  btnPer(text: '%', color: ColorType.primary, size: 4, type: ButtonType.operator),
  btnMul(text: 'x', color: ColorType.primary, size: 4, type: ButtonType.operator),
  btn7(text: '7', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btn8(text: '8', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btn9(text: '9', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btnDiv(text: '÷', color: ColorType.primary, size: 4, type: ButtonType.operator),
  btn4(text: '4', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btn5(text: '5', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btn6(text: '6', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btnPls(text: '+', color: ColorType.primary, size: 4, type: ButtonType.operator),
  btn1(text: '1', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btn2(text: '2', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btn3(text: '3', color: ColorType.primaryDark, size: 4, type: ButtonType.number),
  btnMin(text: '-', color: ColorType.primary, size: 4, type: ButtonType.operator),
  btn0(text: '0', color: ColorType.primaryDark, size: 2, type: ButtonType.number),
  btnDot(text: '.', color: ColorType.primaryDark, size: 4, type: ButtonType.divider),
  btnEql(text: '=', color: ColorType.primary, size: 4, type: ButtonType.controller);

  const ButtonValue({
    required this.text, required this.color, required this.size, required this.type
  });

  final String text;
  final ColorType color;
  final int size;
  final ButtonType type;
}