import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/ui/views/home_page/home_page_provider.dart';
import 'package:note_app/ui/widgets/drawer_items.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          children: [
            SizedBox(
              height: 117.h,
            ),
            DrawerItems(
              onTap: () => context.read<HomePageProvider>().navigateToHome(),
              title: "All Note",
              icons: Icons.archive,
            ),
            SizedBox(
              height: 35.2.h,
            ),
            DrawerItems(
              onTap: () => context.read<HomePageProvider>().navigateToAddNew(),
              title: "Notebook",
              icons: Icons.book,
            ),
          
            SizedBox(
              height: 35.2.h,
            ),
             DrawerItems(
              onTap: () => context.read<HomePageProvider>().navigateToFavourites(),
              title: "Favourites",
              icons: Icons.favorite,
            ),
           
            SizedBox(
              height: 35.2.h,
            ),
             DrawerItems(
              onTap: () => context.read<HomePageProvider>().navigateToDelete(),
              title: "Deleted",
              icons: Icons.delete,
            ),
           SizedBox(
              height: 35.2.h,
            ),
             DrawerItems(
              onTap: (){},
              title: "Settings",
              icons: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}
