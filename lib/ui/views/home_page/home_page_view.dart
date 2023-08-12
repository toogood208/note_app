import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/ui/views/home_page/home_page_provider.dart';
import 'package:note_app/ui/views/search/search_delegate.dart';
import 'package:note_app/ui/widgets/custom_app_bar.dart';
import 'package:note_app/ui/widgets/custom_drawer.dart';
import 'package:note_app/ui/widgets/note_card.dart';
import 'package:note_app/ui/widgets/other_notes_widget.dart';
import 'package:note_app/ui/widgets/pinned_notes_widget.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageProvider>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    final homePageProvider = context.watch<HomePageProvider>();
    final homeProvider = context.read<HomePageProvider>();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        leading: Builder(builder: (context) {
          return Container(
            padding: EdgeInsets.only(left: 6.w),
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: const Icon(
                Icons.notes,
                color: Color(0XFF1D1E24),
              ),
            ),
          );
        }),
        title: "All Notes",
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              color: Color(0XFF1D1E24),
            ),
          ),
        ],
      ),
      body: homePageProvider.otherNotes.isEmpty &&
              homePageProvider.pinnedNotes.isEmpty
          ? const Center(
              child: Text("No notes to display"),
            )
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    if (homePageProvider.pinnedNotes.isNotEmpty)
                      PinnedNotesWidget(homeProvider: homeProvider),
                    SizedBox(
                      height: 18.h,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homePageProvider.pinnedNotes.length,
                        itemBuilder: (context, index) {
                          final pinned = homePageProvider.pinnedNotes[index];

                          return NoteCard(
                            other: pinned,
                          );
                        }),
                    if (homePageProvider.otherNotes.isNotEmpty)
                      const OtherNotesWidget(),
                    SizedBox(
                      height: 18.h,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homePageProvider.otherNotes.length,
                        itemBuilder: (context, index) {
                          final other = homePageProvider.otherNotes[index];

                          return NoteCard(
                            other: other,
                          );
                        }),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          context.read<HomePageProvider>().navigateToAddNew();
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
