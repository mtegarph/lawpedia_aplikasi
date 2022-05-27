part of 'page.dart';

class KategoriKamusHukum extends StatefulWidget {
  const KategoriKamusHukum({Key? key}) : super(key: key);

  @override
  State<KategoriKamusHukum> createState() => _KategoriKamusHukumState();
}

class _KategoriKamusHukumState extends State<KategoriKamusHukum> {
  List<KahuCategory> kategori = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    KonsultanHukumServices.getKategoriKamusHukum().then((value) {
      setState(() {
        kategori = value.value!.data!.kahuCategory!;
        isLoading = false;
      });
      print(kategori[2].idCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: kategori.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return isLoading == true
              ? Container(
                  alignment: Alignment.center,
                  height: 160.0,
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: "F0F0F0".toColor(),
                        onPrimary: Colors.black,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 1.7, 70)),
                    onPressed: () async {
                      Get.to(KamusHukum(id: kategori[index].idCategory));
                    },
                    child: Text(
                      kategori[index].category.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: '878787'.toColor(),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
        },
      ),
      width: 8.5,
      page: "Kategori Kamus hukum",
    );
  }
}
