import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/ui/views/search/search_provider.dart';
import 'package:note_app/ui/widgets/note_card.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return 
    //Text(query, style: TextStyle(color: Colors.amber),); 
    Searches(query: query,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  Searches(query: query,);
  }
}

class Searches extends StatefulWidget {
  const Searches({super.key, required this.query});

  final String query;

  @override
  State<Searches> createState() => _SearchesState();
}

class _SearchesState extends State<Searches> {
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.watch<SearchProvider>().getNotes(widget.query);
  }
  

  

  @override
  Widget build(BuildContext context) {
    final serachProvider = context.watch<SearchProvider>();
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: serachProvider.notes.length,
        itemBuilder: (context, index) {
          final pinned = serachProvider.notes[index];

          return NoteCard(
            other: pinned,
          );
        });
  }
}
