part of 'widget.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
