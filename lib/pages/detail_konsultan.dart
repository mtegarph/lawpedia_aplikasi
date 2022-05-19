part of 'page.dart';

class DetailKonsultan extends StatefulWidget {
  final int id;
  const DetailKonsultan({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailKonsultan> createState() => _DetailKonsultanState();
}

class _DetailKonsultanState extends State<DetailKonsultan> {
  bool loading_home = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RekomendasiCubit>().getRekomendasiKonsultan();
    context
        .read<KonstultanhukumdetailCubit>()
        .getDetailKonsultan(widget.id)
        .then((value) {
      setState(() {
        loading_home = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      width: 0,
      child: BlocBuilder<KonstultanhukumdetailCubit,
              KonstultanhukumdetailState>(
          builder: (context, state) => (state is KonsultanHukumDetailSukses)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                        radius: 75,
                        backgroundImage:
                            state.detailkonsultan.data!.konsultanHukum!.khImg !=
                                    null
                                ? NetworkImage(state.detailkonsultan.data!
                                    .konsultanHukum!.khImg!)
                                : AssetImage('assets/image/user_vector.png')
                                    as ImageProvider),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        state.detailkonsultan.data!.konsultanHukum!.khName!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 50),
                        child: Text(
                          'Data Diri',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      width: 450,
                      height: 280,
                      child: Text(
                        state.detailkonsultan.data!.konsultanHukum!.khDesc!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Raleway',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    TitleWithMoreBtn(
                        title: 'Konsultan Hukum Lainnya', press: () {}),
                    SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<RekomendasiCubit, RekomendasiState>(
                        builder: (context, state) => (state
                                is RekomendasiSukses)
                            ? SizedBox(
                                height: 200,
                                child: Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.detailkonsultan.data!
                                        .konsultanHukum!.data!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      DetailKonsultan(
                                                          id: state
                                                              .detailkonsultan
                                                              .data!
                                                              .konsultanHukum!
                                                              .data![index]
                                                              .khId!)));
                                          // Get.offUntil(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             DetailKonsultan(
                                          //                 id: state
                                          //                     .detailkonsultan
                                          //                     .data!
                                          //                     .konsultanHukum!
                                          //                     .data![index]
                                          //                     .khId!)),
                                          //     (route) => true);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      //color: 'C6B69D'.toColor(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                      image: DecorationImage(
                                                          image: state
                                                                      .detailkonsultan
                                                                      .data!
                                                                      .konsultanHukum!
                                                                      .data![
                                                                          index]
                                                                      .khImg !=
                                                                  null
                                                              ? NetworkImage(state
                                                                  .detailkonsultan
                                                                  .data!
                                                                  .konsultanHukum!
                                                                  .data![index]
                                                                  .khImg
                                                                  .toString())
                                                              : AssetImage(
                                                                      'assets/image/user_vector.png')
                                                                  as ImageProvider,
                                                          fit: BoxFit.contain)),
                                                  height: 110,
                                                  width: 130,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15.0,
                                                          vertical: 10.0),
                                                      child: Text(
                                                        state
                                                            .detailkonsultan
                                                            .data!
                                                            .konsultanHukum!
                                                            .data![index]
                                                            .khName!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Raleway',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Loading())
                  ],
                )
              : loading_home == true
                  ? Loading()
                  : Container()),
      page: 'Konstultan Hukum',
    );
  }
}
