import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/ui/views/delete/delete_provider.dart';
import 'package:provider/provider.dart';

class DeletePageView extends StatefulWidget {
  const DeletePageView({super.key});

  @override
  State<DeletePageView> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePageView> {
  @override
  void initState() {
    super.initState();
    context.read<DeleteViewProvider>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    final deleteProvider = context.watch<DeleteViewProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Deleted Notes",
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
              deleteProvider.deletedNotes.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: deleteProvider.deletedNotes.length,
                      itemBuilder: (context, index) {
                        final pinned = deleteProvider.deletedNotes[index];

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
