import 'package:flutter/material.dart';

/*
 * 常用图片按钮
 */
class SimpleImageButton extends StatefulWidget {
  final String normalImage;
  final String pressedImage;
  final void Function() onPressed;
  final double width;
  final String? title;

  const SimpleImageButton({
    super.key,
    required this.normalImage,
    required this.pressedImage,
    required this.onPressed,
    required this.width,
    this.title,
  });

  @override
  State<StatefulWidget> createState() => _SimpleImageButtonState();
}

class _SimpleImageButtonState extends State<SimpleImageButton> {
  @override
  Widget build(BuildContext context) {
    return ImageButton(
      normalImage: Image(
        image: AssetImage(widget.normalImage),
        width: widget.width,
        height: widget.width,
      ),
      pressedImage: Image(
        image: AssetImage(widget.pressedImage),
        width: widget.width,
        height: widget.width,
      ),
      title: widget.title?? '',
      //文本是否为空
      normalStyle: const TextStyle(
          color: Colors.deepOrangeAccent,
          fontSize: 14,
          decoration: TextDecoration.none),
      pressedStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          decoration: TextDecoration.none),
      onPressed: widget.onPressed,
    );
  }
}

/*
 * 图片 按钮
 */
class ImageButton extends StatefulWidget {
  //常规状态
  final Image normalImage;

  //按下状态
  final Image pressedImage;

  //按钮文本
  final String title;

  //常规文本TextStyle
  final TextStyle? normalStyle;

  //按下文本TextStyle
  final TextStyle? pressedStyle;

  //按下回调
  final void Function() onPressed;

  //文本与图片之间的距离
  final double? padding;

  const ImageButton({
    super.key,
    required this.normalImage,
    required this.pressedImage,
    required this.onPressed,
    this.title = '',
    this.normalStyle,
    this.pressedStyle,
    this.padding,
  });

  @override
  State<StatefulWidget> createState() => _ImageButtonState();

}

class _ImageButtonState extends State<ImageButton> {
  var isPressed = false;

  @override
  Widget build(BuildContext context) {
    double? padding = widget.padding ?? 5;
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (d) {
        //按下，更改状态
        setState(() {
          isPressed = true;
        });
      },
      onTapCancel: () {
        //取消，更改状态
        setState(() {
          isPressed = false;
        });
      },
      onTapUp: (d) {
        //抬起，更改按下状态
        setState(() {
          isPressed = false;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          isPressed ? widget.pressedImage : widget.normalImage, //不同状态显示不同的Image
          widget.title.isNotEmpty ? Padding(padding: EdgeInsets.fromLTRB(0, padding, 0, 0)) : Container(),
          widget.title.isNotEmpty ? Text(widget.title, style: isPressed ? widget.pressedStyle : widget.normalStyle,) : Container(),
        ],
      ),
    );
  }
}

