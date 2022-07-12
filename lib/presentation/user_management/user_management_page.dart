import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/application/navigationstate/navigation_cubit.dart';
import 'package:roadster_admin/domain/drawer.dart';
import 'package:roadster_admin/domain/heading_text.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';
import 'package:roadster_admin/presentation/widgets/textfield.dart';
import '../../domain/colors.dart';

class UserManage extends StatelessWidget {
  const UserManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: colorPalette1,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: const HeadingText(title: "User Management"),
        ),
        drawer: const CustomizedDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      hintText: "Search By Name",
                      hintStyle: const TextStyle(fontSize: 14),
                      prefixIcon: const Icon(
                        Icons.person_search,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: outilneBorder(),
                      enabledBorder: outilneBorder(),
                      focusedBorder: outilneBorder()),
                ),
              ),
              sizedboxHeight20,
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                    shadowColor: Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        context.read<NavigationCubit>().onPressedTails();
                      },
                      title: Text("Muneer Ahamed",
                          style: GoogleFonts.roboto(fontSize: 14)),
                      trailing: const Icon(
                        Icons.lock_open_sharp,
                        color: Colors.green,
                      ),
                    )),
                itemCount: 3,
              ),
            ],
          ),
        ));
  }

  OutlineInputBorder outilneBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent));
  }
}
