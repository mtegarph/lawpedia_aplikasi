part of 'page.dart';

class DetailArtikel extends StatefulWidget {
  const DetailArtikel({Key? key}) : super(key: key);

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  @override
  Widget build(BuildContext context) {
    return Template(
      width: 0,
        page: '',
        child: Padding(
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
                      "12 september 2020",
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
                    height: MediaQuery.of(context).size.height / 17,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                width: 230,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                          backgroundImage: AssetImage('assets/image/elon.png')),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 46, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Elon Musk',
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
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum at nulla bibendum, consequat libero vitae, suscipit magna. Fusce at elit velit. Phasellus convallis, nulla ullamcorper aliquet efficitur, ante ex gravida dui, a scelerisque ipsum nisi quis orci. Aenean vitae dictum eros. Donec sagittis est sit amet justo aliquam ultrices. Nullam felis lacus, mattis sed libero in, viverra molestie metus. In eros arcu, sodales et porta at, molestie vel diam. Pellentesque vitae tempus leo, interdum tristique lorem. Morbi semper magna risus, vel vestibulum sem sagittis ac. Curabitur vitae varius erat. Sed maximus erat ac lobortis mollis. Aliquam risus nunc, hendrerit in venenatis nec, dignissim at dolor.Nullam fermentum sed mauris in lobortis. Aliquam hendrerit nulla quis nisi vehicula, sed mattis metus malesuada. Maecenas laoreet dignissim dui a scelerisque. Nullam sodales augue ex, ut tincidunt velit facilisis ut. Mauris malesuada turpis sed lacus mattis vulputate. Nam ac augue nec lacus dictum lobortis in vel nisl. Nunc sed ipsum rutrum, dapibus nisi vitae, feugiat tortor.",
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
        ));
  }
}
