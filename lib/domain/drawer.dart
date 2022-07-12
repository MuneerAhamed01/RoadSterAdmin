import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/domain/colors.dart';
import 'package:roadster_admin/domain/sizedboxes.dart';

import '../application/navigationstate/navigation_cubit.dart';
import '../presentation/dashboard/admin_text.dart';
import 'list_of_draweritems.dart';

class CustomizedDrawer extends StatelessWidget {
  const CustomizedDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: drawerColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminText(),
            sizedboxHeight30,
            const Divider(
              color: Colors.white,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  onTap: () => context
                      .read<NavigationCubit>()
                      .onPressedDrawer(index),
                  title: Text(
                    drawerList[index],
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              itemCount: drawerList.length,
            )
          ],
        ),
      ),
    );
  }
}
