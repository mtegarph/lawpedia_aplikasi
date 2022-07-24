part of 'page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? logindata;
  bool? newuser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  // checkVersion() async {
  //   final checkVersion = CheckVersion(context: context);
  //   final appStatus = await checkVersion.getVersionStatus();
  //   if (appStatus.canUpdate) {
  //     checkVersion.showUpdateDialog("com.duniamurah.duniamurah", "id0123456789",
  //         message: "Terdapat perbaruan dalam aplikasi",
  //         updateText: "Update Sekarang",
  //         titleText: "Update Terbaru",
  //         dismissText: "Nanti Saja");
  //   }
  //   print("canUpdate ${appStatus.canUpdate}");
  //   print("localVersion ${appStatus.localVersion}");
  //   print("appStoreLink ${appStatus.appStoreUrl}");
  //   print("storeVersion ${appStatus.storeVersion}");
  // }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);
    var duration = const Duration(seconds: 2);
    print(newuser);
    newuser == true
        ? Timer(duration, () {
            Navigator.pushReplacement(
                context, new MaterialPageRoute(builder: (context) => Login()));
          })
        : Timer(duration, () {
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => MainPage()));
          });
  }
  //   if (newuser == false) {
  //     Timer(duration, (){
  //        Navigator.pushReplacement(
  //         context, new MaterialPageRoute(builder: (context) => HomeMain()));
  //     });
  //   }
  //   else{
  //     Timer(duration, (){
  //       Navigator.pushReplacement(
  //         context, new MaterialPageRoute(builder: (context) => LoginPages()));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Text(
        "LawPedia",
        style: TextStyle(
            color: 'DA2323'.toColor(),
            fontSize: 50,
            fontFamily: 'Tms',
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
