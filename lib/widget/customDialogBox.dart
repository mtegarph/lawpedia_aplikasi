part of 'widget.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, yes;
  final String img;
  final VoidCallback goTo;
  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.yes,
      required this.img,
      required this.goTo})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  double defaultMargin = 24;
  double padding = 20;
  double avatarRadius = 45;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: padding,
              top: avatarRadius + padding,
              right: padding,
              bottom: padding),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(color: Colors.black38, blurRadius: 30.0),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  widget.descriptions,
                  style: TextStyle(
                     // letterSpacing: 2.5,
                      fontSize: 23,
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: "FF3232".toColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPrimary: Colors.black,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width / 2, 80),
                          maximumSize:
                              Size(MediaQuery.of(context).size.width / 2, 80),
                          alignment: Alignment.centerLeft),
                      onPressed: () {
                        Navigator.of(context).pop();
                        widget.goTo();
                      },
                      child: Center(
                        child: Text(
                          widget.yes,
                          style: TextStyle(
                              fontSize: 30,
                              color: 'F2F2F2'.toColor(),
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
                child: Image.asset(widget.img)),
          ),
        ),
      ],
    );
  }
}
