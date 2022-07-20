part of 'page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SharedPreferences? logindata;
  bool newuser = false;
  Map? _userFaceboook;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);
    // print(newuser);
    // if (newuser == false) {
    //   Navigator.pushReplacement(
    //       context, new MaterialPageRoute(builder: (context) => HomeMain()));
    // }
  }

  @override
  //final userCubit = LoginCubit();
  Map _userObj = {};
  String? status;
  //login menggunakan google
  Future signInGoogle() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gagal Login Dengan google")));
    } else {
      await context.read<LoginCubit>().login(user.email, 'google');
      LoginState state = context.read<LoginCubit>().state;
      if (state is gagalLoginState) {
        setState(() {
          status = state.message;
        });
        print(status);
        print(user.photoUrl.toString());
        alertDialog(
            "Akun anda belum terdaftar. anda akan otomatis didaftarkan jika menggunakan akun ini.",
            "Warning",
            "assets/image/warning.png",
            "Ok", () async {
          await context
              .read<LoginCubit>()
              .register(
                  user.email.toString(),
                  "google",
                  user.photoUrl.toString(),
                  user.displayName.toString(),
                  "-",
                  "31/05/2002")
              .then((value) {
            // print(value.message);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MainPage(
                      //google: user,
                      google: user,
                    )));
          });
        });
        print(status);
      } else if (state is berhasilLogin) {
        // final snackBar = SnackBar(
        //   content: const Text('Login Dengan Google'),
        //   action: SnackBarAction(
        //     label: 'ok',
        //     onPressed: () {
        //       //  Navigator.of(context).pop();
        //       // Some code to undo the change.
        //     },
        //   ),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // print(state.token);
        logindata!.setString('token', state.token.toString());
        logindata!.setBool('login', false);
        logindata!.setBool('google', true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainPage(
                  //google: user,
                  google: user,
                )));
      }
    }
  }

  //login dengan twitter
  Future loginV2() async {
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: "XeY4IbDelhKwmOfgsHiYkFVNF",

      /// Consumer API Secret keys
      apiSecretKey: "0BfglzvtVgwVBJdyAweSAdzYojkNUCoblzTxeo1Bov2ikIfXtq",

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'https://api.twitter.com/oauth/request_token',
    );
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        print('====== Login success ======');
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
        // error
        print('====== Login error ======');
        break;
    }
  }

  alertDialog(
      String desc, String title, String img, String yes, VoidCallback goTo) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            descriptions: desc,
            yes: yes,
            img: img,
            title: title,
            goTo: goTo,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? const Loading()
            : Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/image/bg_login.png')),
                  Image(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.8,
                      fit: BoxFit.fill,
                      image: const AssetImage('assets/image/bg_login2.png')),
                  Image(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 2.3,
                      fit: BoxFit.fill,
                      image: const AssetImage('assets/image/pano.png')),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/image/Wavy.png',
                      alignment: Alignment.bottomRight,
                      height: 400,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 30.0)
                      ]),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: SizedBox(
                          height: 600,
                          width: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "LAWPEDIA",
                                  style: TextStyle(
                                      color: 'DA2323'.toColor(),
                                      fontSize: 50,
                                      fontFamily: 'Tms',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    primary: "F0F0F0".toColor(),
                                    onPrimary: Colors.black,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width / 1.7,
                                        70)),
                                onPressed: () {
                                  signInGoogle();
                                  setState(() {
                                    loading = true;
                                  });
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                                label: Text(
                                  "Masuk Dengan Google",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: '878787'.toColor(),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    primary: "F0F0F0".toColor(),
                                    onPrimary: Colors.black,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width / 1.7,
                                        70)),
                                onPressed: () async {
                                  final LoginResult result =
                                      await FacebookAuth.i.login(permissions: [
                                    'public_profile',
                                    'email'
                                  ]); // by default we request the email and the public profile
                                  if (result.status == LoginStatus.success) {
                                    final requestData = await FacebookAuth.i
                                        .getUserData()
                                        .then((value) {
                                      setState(() {
                                        loading = true;
                                        _userFaceboook = value;
                                      });
                                      // Get.to(MainPage(
                                      //   facebook: _userFaceboook,
                                      // ));
                                    });
                                    final AccessToken accessToken =
                                        result.accessToken!;

                                    setState(() {
                                      _userObj = requestData;
                                    });
                                    await context.read<LoginCubit>().login(
                                        _userFaceboook?['email'], 'facebook');
                                    LoginState state =
                                        context.read<LoginCubit>().state;
                                    if (state is gagalLoginState) {
                                      setState(() {
                                        status = state.message;
                                      });
                                      print(status);
                                      // print(user.photoUrl.toString());
                                      alertDialog(
                                          "Akun anda belum terdaftar. anda akan otomatis didaftarkan jika menggunakan akun ini.",
                                          "Warning",
                                          "assets/image/warning.png",
                                          "Ok", () async {
                                        await context
                                            .read<LoginCubit>()
                                            .register(
                                                _userFaceboook?['email'],
                                                "facebook",
                                                _userFaceboook?["picture"]
                                                    ["data"]["url"],
                                                _userFaceboook?['name'],
                                                "-",
                                                "31/05/2002")
                                            .then((value) {
                                          LoginState state1 =
                                              context.read<LoginCubit>().state;
                                          if (state1 is berhasilLogin) {
                                            logindata!.setBool('google', false);
                                            logindata!.setBool('login', false);
                                            logindata!.setString('token',
                                                state1.token.toString());

                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainPage(
                                                              //google: user,
                                                              facebook:
                                                                  _userFaceboook,
                                                            )));
                                          }
                                          // print(value.message);
                                        });
                                      });
                                      print(status);
                                    } else if (state is berhasilLogin) {
                                      final snackBar = SnackBar(
                                        content:
                                            const Text('Login Dengan Facebook'),
                                        action: SnackBarAction(
                                          label: 'ok',
                                          onPressed: () {
                                            //  Navigator.of(context).pop();
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      // print(state.token);
                                      logindata!.setBool('login', false);
                                      logindata!.setBool('google', false);
                                      logindata!.setString(
                                          'token', state.token.toString());
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (context) => MainPage(
                                                    //google: user,
                                                    facebook: _userFaceboook,
                                                  )));
                                    }
                                    // you are logged

                                    // Get.to(HomePage(
                                    //   user: user,
                                    //   facebook_user: _userObj,
                                    // ));
                                  } else {
                                    print(result.status);
                                    print(result.message);
                                  }
                                  // FacebookAuth.instance.login(permissions: [
                                  //   "public_profile",
                                  //   "email"
                                  // ]).then((value) {
                                  //   FacebookAuth.instance
                                  //       .getUserData()
                                  //       .then((userData) {
                                  //     setState(() {
                                  //       _userObj = userData;
                                  //     });
                                  //   });
                                  //   print(_userObj);
                                  // });
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                ),
                                label: Text(
                                  "Masuk Dengan FaceBook",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: '878787'.toColor(),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // ElevatedButton.icon(
                              //   style: ElevatedButton.styleFrom(
                              //       padding: EdgeInsets.zero,
                              //       primary: "F0F0F0".toColor(),
                              //       onPrimary: Colors.black,
                              //       minimumSize: Size(
                              //           MediaQuery.of(context).size.width / 1.7,
                              //           70)),
                              //   onPressed: () async {
                              //     await loginV2();
                              //   },
                              //   icon: FaIcon(
                              //     FontAwesomeIcons.twitter,
                              //     color: Colors.blueAccent,
                              //   ),
                              //   label: Text(
                              //     "Masuk Dengan Twitter",
                              //     style: TextStyle(
                              //         fontSize: 20,
                              //         color: '878787'.toColor(),
                              //         fontFamily: 'Roboto',
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
