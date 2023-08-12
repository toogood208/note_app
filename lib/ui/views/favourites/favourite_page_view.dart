import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/ui/views/favourites/favourites_provider.dart';
import 'package:provider/provider.dart';

class FavouritePageView extends StatefulWidget {
  const FavouritePageView({super.key});

  @override
  State<FavouritePageView> createState() => _FavouriteViewPageSt();
}

class _FavouriteViewPageSt extends State<FavouritePageView> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteViewProvider>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    final favouritePageProvider = context.watch<FavouriteViewProvider>();
    return Scaffold(
      
      appBar: AppBar(
       
        title: const Text(
          "Favourites Notes",
          style: TextStyle(
            fontFamily: "Metropolis",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0XFF1D1E24),
          ),
        ),
        centerTitle: true,
       
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              favouritePageProvider.favouriteNotes.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: favouritePageProvider.favouriteNotes.length,
                      itemBuilder: (context, index) {
                        final pinned = favouritePageProvider.favouriteNotes[index];

                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: 9,
                          ),
                          padding: const EdgeInsets.only(
                            left: 21,
                            top: 17,
                            right: 8,
                          ),
                          height: 137,
                          width: 377,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(pinned["noteColor"]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pinned["title"],
                                style: GoogleFonts.sourceSerif4(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                pinned["content"].length > 100
                                    ? '${pinned["content"].substring(0, 100)}...'
                                    : pinned["content"],
                                style: GoogleFonts.sourceSerif4(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${DateTime.fromMicrosecondsSinceEpoch(pinned["createdDate"])}",
                                  style: GoogleFonts.sourceSerif4(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : const Center(
                      child: Text("no favourites notes"),
                    ),
            ],
          ),
        ),
      ),
     
    );
  }
}
