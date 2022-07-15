part of 'page.dart';

class MainPage extends StatefulWidget {
  final GoogleSignInAccount? google;
  final Map? facebook;

  const MainPage({Key? key, @required this.google, @required this.facebook})
      : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavbar(
        selectedIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
          pageController.jumpToPage(selectedPage);
        },
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: 'FAFAFC'.toColor(),
          )),
          SafeArea(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            children: [
              Center(
                  child: HomePage(
                facebook: widget.facebook,
                user: widget.google,
              )),
              Center(child: Inbox()),
              const Center(child: Chat()),
            ],
          )),
        ],
      ),
    );
  }
}
