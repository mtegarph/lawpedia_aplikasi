part of 'page.dart';

class UserEdit extends StatefulWidget {
  final GoogleSignInAccount? user;
  final Map? facebook;
  const UserEdit({Key? key, @required this.user, @required this.facebook})
      : super(key: key);

  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  var _image;
  var imagePicker;
  DateTime date = DateTime(2022, 12, 24);
  TextEditingController? nama;
  TextEditingController? email;
  TextEditingController? noHp;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
    nama = TextEditingController(
        text: widget.user?.displayName ?? widget.facebook?['name']);

    email = TextEditingController(
        text: widget.user?.email ?? widget.facebook?['email']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
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
                          margin: EdgeInsets.only(right: 40),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/Left.png'))),
                        ),
                      ),
                      SizedBox(width: 140),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Profil",
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
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: _image != null
                      ? CircleAvatar(
                          radius: 120,
                          backgroundImage: FileImage(_image),
                        )
                      : CircleAvatar(
                          radius: 120,
                          backgroundImage: NetworkImage(
                              widget.user?.photoUrl.toString() ??
                                  widget.facebook?["picture"]["data"]["url"])),
                ),
                onTap: () async {
                  return showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return SafeArea(
                            child: Container(
                          child: Wrap(
                            children: [
                              ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Photo Library'),
                                  onTap: () async {
                                    XFile? image = await imagePicker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 50,
                                        preferredCameraDevice:
                                            CameraDevice.front);
                                    setState(() {
                                      image == null
                                          ? print("data kosong")
                                          : _image = File(image.path);
                                    });
                                    Navigator.of(context).pop();
                                    // PickedFile? pickedFile = await ImagePicker()
                                    //     .getImage(source: ImageSource.gallery);
                                    // if (pickedFile != null) {
                                    //   imagePath = File(pickedFile.path);
                                    //   print(imagePath!.path);
                                    //   setState(() {});
                                    // }
                                    // Navigator.of(context).pop();
                                  }),
                              ListTile(
                                leading: Icon(Icons.photo_camera),
                                title: Text('Camera'),
                                onTap: () async {
                                  XFile? image = await imagePicker.pickImage(
                                      source: ImageSource.camera,
                                      imageQuality: 50,
                                      preferredCameraDevice:
                                          CameraDevice.front);
                                  setState(() {
                                    image == null
                                        ? print("data kosong")
                                        : _image = File(image.path);
                                  });
                                  Navigator.of(context).pop();
                                  // PickedFile? pickedFile = await ImagePicker()
                                  //     .getImage(source: ImageSource.camera);
                                  // if (pickedFile != null) {
                                  //   imagePath = File(pickedFile.path);
                                  //   print(imagePath!.path);
                                  //   setState(() {});
                                  // }
                                  // Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ));
                      });
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    widget.user?.displayName.toString() ??
                        widget.facebook?['name'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 10, right: 20),
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
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Nama",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.4,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 18),
                        maxLength: 70,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(fontSize: 18),
                          hintText: "Nama",
                        ),
                        controller: nama,
                        onEditingComplete: () {
                          print(nama);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 30.0, top: 10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.4,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        enabled: false,
                        style: TextStyle(fontSize: 18),
                        maxLength: 70,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(fontSize: 18),
                          hintText: "Nama",
                        ),
                        controller: email,
                        onEditingComplete: () {
                          print(email);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          "No.Hp",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.4,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 18),
                        maxLength: 70,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(fontSize: 18),
                          hintText: "Nomor Handphone",
                        ),
                        controller: noHp,
                        keyboardType: TextInputType.number,
                        onEditingComplete: () {
                          print(noHp);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Tanggal Lahir",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.4,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 15, left: 3),
                            child: Text(
                              "${date.year}/${date.month}/${date.day}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(1900, 5, 5),
                                  lastDate: DateTime(2100, 5, 5));

                              if (newDate == null) {
                                return;
                              } else {
                                setState(() {
                                  date = newDate;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 2, top: 15),
                              child: FaIcon(CupertinoIcons.calendar),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.8,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: "FF3232".toColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPrimary: Colors.black,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width / 2, 75),
                          maximumSize:
                              Size(MediaQuery.of(context).size.width / 2, 75),
                          alignment: Alignment.centerLeft),
                      onPressed: () {
                        alertDialog('Data diri berhasil disimpan', "Berhasil",
                            'assets/image/checklist.png', "Ok", () {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Simpan",
                          style: TextStyle(
                              fontSize: 27,
                              color: 'F2F2F2'.toColor(),
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
