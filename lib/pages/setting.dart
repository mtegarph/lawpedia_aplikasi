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
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<UserCubit>().getUser();
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      margin: const EdgeInsets.only(right: 26),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Left.png'))),
                    ),
                  ),
                  const SizedBox(
                    width: 140,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
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
              BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                if (state is userSuccess) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: GestureDetector(
                      onTap: () => Get.to(Setting(
                        user: widget.user,
                        facebook: widget.facebook,
                      )),
                      child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(state
                                      .userDetail.data!.userProfile!.profilePict
                                      .toString() ==
                                  "-"
                              ? "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg"
                              : state.userDetail.data!.userProfile!.profilePict
                                  .toString())),
                    ),
                  );
                } else {
                  return const Center(
                    child: Loading(),
                  );
                }
              }),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                    if (state is userSuccess) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: 150,
                          height: 50,
                          child: Text(
                            '${state.userDetail.data!.userProfile!.firstName} ' +
                                '${state.userDetail.data!.userProfile!.lastName}'
                                    .toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Loading(),
                      );
                    }
                  }),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
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
                  margin: const EdgeInsets.only(left: 150),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/edit.png'))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),

          InkWell(
            splashFactory: InkSplash.splashFactory,
            onTap: () {
              Get.to(const Notifikasi());
            },
            child: Container(
              // margin: EdgeInsets.only(top: 20),
              //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              padding: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black38))),
              height: 60,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 35.0),
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
                          padding: EdgeInsets.only(right: 35.0),
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
              padding: const EdgeInsets.only(top: 5),
              height: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 35.0),
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
                          padding: EdgeInsets.only(right: 35.0),
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
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () async {
              SharedPreferences logindata =
                  await SharedPreferences.getInstance();
              logindata.setString('token', '');
              logindata.setBool('login', true);
              logindata.getBool('google') == false
                  ? await FacebookAuth.i.logOut()
                  : await GoogleSignInApi.logout();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black38))),
              height: 60,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
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
                        const Padding(
                          padding: EdgeInsets.only(right: 35.0),
                          child:
                              Image(image: AssetImage('assets/image/sign.png')),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
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
