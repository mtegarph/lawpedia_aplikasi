part of 'page.dart';

class Answer extends StatefulWidget {
  final bool? visible;
  final String? id;
  const Answer({Key? key, @required this.visible = false, @required this.id})
      : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool loading = true;
  // DatumQuestionDetail? detail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QuestiondetailCubit>().getQuestionDetail(widget.id);
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
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: Container(
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
                      state.questionDetail.data?.questions?.answeredAt != null
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
                                    Padding(
                                      padding: const EdgeInsets.only(
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
                                      margin: EdgeInsets.only(
                                          top: 8, bottom: 10, left: 25),
                                      width: 440,
                                      height: 400,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer suscipit enim consequat eros bibendum, non eleifend erat molestie. Nulla a nunc id quam euismod finibus sit amet in purus. Duis lacinia neque tortor, eu viverra sem vulputate id. Etiam pharetra purus tellus. Vivamus consectetur volutpat tincidunt. Nam facilisis commodo ante, finibus eleifend neque congue non. Vestibulum vel commodo leo, eget vestibulum turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc luctus vitae lectus et dictum. Cras eu porta magna. Suspendisse mi ligula, viverra non condimentum at, pretium sit amet urna.",
                                        style: TextStyle(
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
              : Loading(),
        ));
  }
}
