part of 'widget.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String? text;
  final int? size;
  final int length;
  final String? color;
  DescriptionTextWidget(
      {@required this.text,
      @required this.size,
      required this.length,
      @required this.color});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.toString().length > widget.length) {
      firstHalf = widget.text.toString().substring(0, widget.length);
      secondHalf = widget.text
          .toString()
          .substring(widget.length, widget.text.toString().length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: secondHalf.toString().isEmpty
          ? new Text(firstHalf.toString())
          : new Column(
              children: <Widget>[
                new Text(
                    flag
                        ? (firstHalf.toString() + "...")
                        : (firstHalf.toString() + secondHalf.toString()),
                    style: TextStyle(
                        color: widget.color == null
                            ? Colors.black38
                            : widget.color.toString().toColor(),
                        fontSize: widget.size?.toDouble(),
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.normal)),
                // new InkWell(
                //   child: new Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       new Text(
                //         flag ? "show more" : "show less",
                //         style: new TextStyle(color: Colors.blue),
                //       ),
                //     ],
                //   ),
                //   onTap: () {
                //     setState(() {
                //       flag = !flag;
                //     });
                //   },
                // ),
              ],
            ),
    );
  }
}
