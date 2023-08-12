import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/date_util.dart';
import 'package:note_app/core/models/note.dart';
import 'package:note_app/ui/views/home_page/home_page_provider.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.other,
  });

  final Map<String, dynamic> other;

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomePageProvider>();

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
        color: Color(other["noteColor"] ?? 4294964376),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                other["title"],
                style: GoogleFonts.sourceSerif4(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              PopupMenuButton(
                  onSelected: (value) {
                    if (value == 1) {
                      homeProvider.db.favouriteNode(
                        Note(
                            id: other['id'],
                            title: other['title'],
                            content: other['content'],
                            createdDate: DateTime.now(),
                            lastEditedDate: DateTime.now(),
                            noteColor: Color(other['noteColor']),
                            isFavourite: 1,
                            isDeleted: other['isDeleted'],
                            isPinned: other['isPinned']),
                      );
                      homeProvider.navigateToHome();
                    }
                    if (value == 2) {
                      homeProvider.db.favouriteNode(
                        Note(
                            id: other['id'],
                            title: other['title'],
                            content: other['content'],
                            createdDate: DateTime.now(),
                            lastEditedDate: DateTime.now(),
                            noteColor: Color(other['noteColor']),
                            isFavourite: other['isFavourite'],
                            isDeleted: 1,
                            isPinned: other['isPinned']),
                      );
                      homeProvider.navigateToHome();
                    }
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 18,
                  ),
                  itemBuilder: (context) => [
                        _buildPopupMenuItem(
                            title: 'Favourite',
                            iconData: Icons.favorite,
                            value: 1),
                        _buildPopupMenuItem(
                            title: 'delete', iconData: Icons.delete, value: 2),
                      ])
            ],
          ),
          Text(
            other["content"].length > 100
                ? '${other["content"].substring(0, 100)}...'
                : other["content"],
            style: GoogleFonts.sourceSerif4(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${getTime(other["createdDate"])} |${getDate(other["createdDate"])}",
              style: GoogleFonts.sourceSerif4(
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(
    {required String title, required int value, required IconData iconData}) {
  return PopupMenuItem(
    value: value,
    child: Row(
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),
        Text(title),
      ],
    ),
  );
}
