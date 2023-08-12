import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/ui/views/add_notes/add_new_notes_provider.dart';
import 'package:note_app/ui/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class AddNotesView extends StatefulWidget {
  const AddNotesView({super.key});

  @override
  State<AddNotesView> createState() => _AddNotesViewState();
}

class _AddNotesViewState extends State<AddNotesView> {
  String dropdownValue = "save";
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController contentTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final addNotes = context.read<AddNotesProvider>();
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Add New Notes",
          actions: [
            IconButton(
              onPressed: () {
                addNotes.addNotes(
                    title: titleTextController.text,
                    content: contentTextController.text,
                    pinNote: false);
              },
              icon: Icon(
                Icons.save,
                size: 18.r,
                color: const Color(0XFF1D1E24),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Column(
            children: [
              SizedBox(
                height: 64.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                width: 387.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  color: Color(0xfff9f9f9),
                ),
                child: TextFormField(
                  controller: titleTextController,
                  cursorColor: const Color(0XFF1D1E24),
                  style: GoogleFonts.sourceSerif4(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0XFF1D1E24)),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter note title",
                    hintStyle: GoogleFonts.sourceSerif4(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0XFF1D1E24)),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                width: 387.w,
                height: 283.h,
                decoration: const BoxDecoration(
                  color: Color(0xfff9f9f9),
                ),
                child: TextFormField(
                  controller: contentTextController,
                  maxLines: 8,
                  cursorColor: const Color(0XFF1D1E24),
                  style: GoogleFonts.sourceSerif4(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0XFF1D1E24)),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "...",
                    hintStyle: GoogleFonts.sourceSerif4(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: const Color(0XFF1D1E24)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: DropdownButton(
                  underline: const SizedBox(),
                  // Initial Value
                  value: dropdownValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: [
                    DropdownMenuItem(
                      value: "save",
                      child: GestureDetector(
                        onTap: () {
                          addNotes.addNotes(
                              title: contentTextController.text,
                              content: contentTextController.text,
                              pinNote: false);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              size: 18.r,
                            ),
                            SizedBox(
                              width: 13.55.h,
                            ),
                            Text(
                              "Save",
                              style: TextStyle(
                                  fontFamily: "Metropolis", fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "pin",
                      child: GestureDetector(
                        onTap: () {
                          addNotes.addNotes(
                              title: contentTextController.text,
                              content: contentTextController.text,
                              pinNote: true);
                        },
                        child:Row(
                          children: [
                            Icon(Icons.push_pin, size: 18.r,),
                            const SizedBox(
                              width: 13.55,
                            ),
                            Text("pin",  style: TextStyle(
                                  fontFamily: "Metropolis", fontSize: 14.sp),),
                          ],
                        ),
                      ),
                    )
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
