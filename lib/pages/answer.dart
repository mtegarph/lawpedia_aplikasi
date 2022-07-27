part of 'page.dart';

class Answer extends StatefulWidget {
  final bool? visible;
  final String? id;
  final String? jawab;
  const Answer(
      {Key? key,
      @required this.visible = false,
      @required this.id,
      @required this.jawab = null})
      : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool loading = true;
  String? desc;
  // DatumQuestionDetail? detail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.jawab == false) {
      print("Tidak ada jawaban");
    } else {
      final document = parse(widget.jawab);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;
      setState(() {
        desc = parsedString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        width: 0,
        page: '',
        child: BlocBuilder<QuestiondetailCubit, QuestiondetailState>(
          builder: (context, state) => (state is QuestionDetailSuccess)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 10, right: 10, left: 10),
                        child: Text(
                          state.questionDetail.data!.questions!.qTitle
                              .toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: SizedBox(
                            height: 100,
                            width: 490,
                            child: Text(
                              state.questionDetail.data!.questions!.qBody
                                  .toString(),
                              style: TextStyle(
                                  color: '4D4D4D'.toColor(),
                                  fontSize: 18,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.justify,
                            ),
                          )),
                      state.questionDetail.data!.questions!.answer != null
                          ? Container(
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
                              width: 500,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: "FF4A4A".toColor(),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 25, bottom: 10, left: 25),
                                      child: Text(
                                        "Jawab",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 8, bottom: 10, left: 25),
                                      width: 440,
                                      height: 400,
                                      child: Text(
                                        '$desc',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Raleway',
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      // Visibility(
                      //   visible: widget.visible!,
                      //   child:
                      // )
                    ],
                  ),
                )
              : const Center(child: Loading()),
        ));
  }
}
