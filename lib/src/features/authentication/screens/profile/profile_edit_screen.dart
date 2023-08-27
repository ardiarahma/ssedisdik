import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ssedisdik/src/common_widgets/custom_appbar_widget.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: primaryColor,
      overflowRules: const OverflowRules.only(top: false, bottom: true),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // -- App Bar
              Stack(
                children: [
                  CustomAppbar(
                    onBackPressed: () {
                      // Add any additional functionality you want here
                      Navigator.pop(context);
                    },
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Ubah Data Diri",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              // -- End of AppBar

              Container(
                padding: const EdgeInsets.only(
                    left: tHomePadding, right: tHomePadding),
                child: Column(
                  children: [
                    const SizedBox(
                      height: tHomePadding,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(tNamaLengkap,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14))),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      style: txtTheme.displaySmall?.copyWith(fontSize: 14),
                      maxLines:
                          1, // Set maxLines ke null agar tidak terbatas ke bawah
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Namanya Siapa",
                        fillColor: const Color.fromARGB(237, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tHomePadding,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(tNomorIndukKependudukan,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14))),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      style: txtTheme.displaySmall?.copyWith(fontSize: 14),
                      maxLines:
                          1, // Set maxLines ke null agar tidak terbatas ke bawah
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "xxxxxxxxxxxxxxxxxxx",
                        fillColor: const Color.fromARGB(237, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tHomePadding,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(tNomorHandphone,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14))),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      style: txtTheme.displaySmall?.copyWith(fontSize: 14),
                      maxLines:
                          1, // Set maxLines ke null agar tidak terbatas ke bawah
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "082*********",
                        fillColor: const Color.fromARGB(237, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tHomePadding,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(tEmail,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14))),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      style: txtTheme.displaySmall?.copyWith(fontSize: 14),
                      maxLines:
                          1, // Set maxLines ke null agar tidak terbatas ke bawah
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "namanyasiapa@gmail.com",
                        fillColor: const Color.fromARGB(237, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tHomePadding,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(tUnitKerja,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14))),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      style: txtTheme.displaySmall?.copyWith(fontSize: 14),
                      maxLines:
                          1, // Set maxLines ke null agar tidak terbatas ke bawah
                      decoration: InputDecoration(
                        filled: true,
                        hintText:
                            "Suku Dinas Pendidikan Wilayah I Kota Adm. Jakarta Pusat",
                        fillColor: const Color.fromARGB(237, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tHomePadding,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(tJabatan,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14))),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      style: txtTheme.displaySmall?.copyWith(fontSize: 14),
                      maxLines:
                          1, // Set maxLines ke null agar tidak terbatas ke bawah
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Staf",
                        fillColor: const Color.fromARGB(237, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tHomePadding,
                    ),
                    SizedBox(
                      width: size.width,
                      height: 45,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder( 
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {},
                        icon: const Icon(Icons.save),
                        label: Text(
                          "Simpan Perubahan",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
