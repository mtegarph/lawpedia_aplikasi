part of 'page.dart';

class Setting extends StatefulWidget {
  final GoogleSignInAccount? user;
  final Map? facebook;
  const Setting({Key? key, @required this.user, @required this.facebook})
      : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              //margin: EdgeInsets.only(bottom: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 100,
              color: Colors.white,
              child: Row(
                children: [
                  //inisialisasi back button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(right: 26),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Left.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26.4,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        widget.user?.photoUrl.toString() ??
                            widget.facebook?["picture"]["data"]["url"])),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      widget.user?.displayName.toString() ??
                          widget.facebook?["name"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    width: 140,
                    height: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Free',
                        style: TextStyle(
                            color: 'FFFFFF'.toColor(),
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: '4AFC7C'.toColor(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(UserEdit(
                    user: widget.user,
                    facebook: widget.facebook,
                  ));
                },
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(left: 150),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/edit.png'))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),

          InkWell(
            splashFactory: InkSplash.splashFactory,
            onTap: () {
              Get.to(Notifikasi());
            },
            child: Container(
              // margin: EdgeInsets.only(top: 20),
              //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black38))),
              height: 60,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Text(
                            'Notifikasi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Image(
                              image: AssetImage('assets/image/chevron.png')),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //     // margin: EdgeInsets.only(top: 20),
          //     // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.only(top: 10),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 20.0),
          //                 child: Text(
          //                   'FAQ',
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 20,
          //                       fontFamily: 'Raleway',
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(right: 20),
          //                 child: Image(
          //                     image: AssetImage('assets/image/chevron.png')),
          //               )
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: 15,
          //         ),
          //         Divider(
          //           thickness: 0.2,
          //           color: Colors.black,
          //           indent: 0.0,
          //           endIndent: 0.0,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(top: 5),
              height: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Text(
                            'Versi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Text(
                            'V.1.0.0',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () async {
              widget.facebook!.isEmpty
                  ? await GoogleSignInApi.logout()
                  : await FacebookAuth.i.logOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black38))),
              height: 60,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                color: 'FF0000'.toColor(),
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child:
                              Image(image: AssetImage('assets/image/sign.png')),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
