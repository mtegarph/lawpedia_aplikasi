part of 'widget.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  //fungsi untuk menerima parameter satu buah integer
  final Function(int index) onTap;

  const CustomBottomNavbar({this.selectedIndex = 0, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 46,
              height: 46,
              margin: EdgeInsets.only(left: 70.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/home' +
                          ((selectedIndex == 0) ? '.png' : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 46,
              height: 46,
              // margin: EdgeInsets.only(left:40.0,right: 20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/inbox' +
                          ((selectedIndex == 1) ? '.png' : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 46,
              height: 46,
              //margin: EdgeInsets.only(left:20.0,right: 40.0),
               margin: EdgeInsets.only(right: 70.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/chat' +
                          ((selectedIndex == 2) ? '.png' : '_normal.png')),
                      fit: BoxFit.contain)),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     if (onTap != null) {
          //       onTap(3);
          //     }
          //   },
          //   child: Container(
          //     width: 36,
          //     height: 36,
          //     margin: EdgeInsets.only(right: 45.0),
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/ic_profile' +
          //                 ((selectedIndex == 3) ? '.png' : '_normal.png')),
          //             fit: BoxFit.contain)),
          //   ),
          // ),
        ],
      ),
    );
  }
}
