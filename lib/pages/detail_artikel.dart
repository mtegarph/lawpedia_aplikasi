part of 'page.dart';

class DetailArtikel extends StatefulWidget {
  final int? id;
  const DetailArtikel({Key? key, @required this.id}) : super(key: key);

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  bool loading_artikel = true;
  String? desc;
  @override
  void initState() {
    super.initState();
    context
        .read<ArtikelCubit>()
        .getDetailArtikel(widget.id!.toInt())
        .then((value) {
      setState(() {
        desc = (context.bloc<ArtikelCubit>().state as DetailArtikelSukses)
            .artikelDetail
            .data!
            .detailArtikel!
            .articleBody;
      });
      final document = parse(desc);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;
      setState(() {
        loading_artikel = false;
        desc = parsedString;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        width: 0,
        page: '',
        child: BlocBuilder<ArtikelCubit, ArtikelState>(
            builder: (context, state) => (state is DetailArtikelSukses)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 18, top: 5),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 30,
                              width: MediaQuery.of(context).size.width / 1.6,
                              child: Text(
                                convertDateTime(state.artikelDetail.data!
                                    .detailArtikel!.publishedAt!),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          width: 500,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: "FF4A4A".toColor(),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 16, top: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                state.artikelDetail.data!.detailArtikel!
                                    .articleTitle
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                          width: 230,
                          margin: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: "F6F6F6".toColor(),
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         "https://i.pinimg.com/564x/94/17/82/941782f60e16a9d7f9b4cea4ae7025e0.jpg"),
                            //     fit: BoxFit.fill)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        'assets/image/user_vector.png')),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(right: 46, top: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.artikelDetail.data!.detailArtikel!
                                            .authorFirstName
                                            .toString(),
                                        style: TextStyle(
                                          color: 'FF5252'.toColor(),
                                          fontSize: 18,
                                          fontFamily: 'Raleway',
                                        ),
                                      ),
                                      Text(
                                        'Admin',
                                        style: TextStyle(
                                          color: 'FF5252'.toColor(),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 16, top: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 1.16,
                              child: Text(
                                "$desc",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'times',
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.justify,
                              ),
                            )),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    height: 160.0,
                    child: CircularProgressIndicator(),
                  )));
  }
}

String convertDateTime(DateTime dateTime) {
  String month;

  switch (dateTime.month) {
    case 1:
      month = 'Januari';
      break;
    case 2:
      month = 'Febuari';
      break;
    case 3:
      month = 'Maret';
      break;
    case 4:
      month = 'April';
      break;
    case 5:
      month = 'Mei';
      break;
    case 6:
      month = 'Juni';
      break;
    case 7:
      month = 'Juli';
      break;
    case 8:
      month = 'Agustus';
      break;
    case 9:
      month = 'September';
      break;
    case 10:
      month = 'Oktober';
      break;
    case 11:
      month = 'November';
      break;
    default:
      month = 'Desember';
  }

  return ' ${dateTime.day} $month ${dateTime.year}';
}
