part of 'widget.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    @required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Row(
          children: <Widget>[
            TitleWithCustomUnderline(text: title),
            const Spacer(),
            press == null
                ? Container()
                : GestureDetector(
                    onTap: press,
                    child: Text(
                      "Lihat Selengkapnya",
                      style: TextStyle(
                          color: "DA2323".toColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
          ],
        ),
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16 / 4),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
