import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteit/Note_feature/presentation/pages/home_screen.dart';
import 'package:noteit/core/utils/extensions/extensions.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/constants/utility/colors.dart';
import '../../../core/utils/resources/clippers/message_shape_clipper.dart';
import '../../domain/entities/note_entity.dart';
import '../manager/blocs/gridview_bloc/gridviewbloc_bloc.dart';
import '../widgets/add_note_screen_widgets/add_note_screen_widgets.dart';
import '../manager/providers/providers.dart';

class AddNoteScreen extends StatefulWidget {
  final Note note;
  final bool isEditing;

  const AddNoteScreen({super.key, required this.note, required this.isEditing});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.note.title.toString();
    _bodyController.text = widget.note.body.toString();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _body = "";

  final DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final h = context.deviceHeight();
    final w = context.deviceWidth();

    return Consumer<ShowColorBottomModalProvider>(
      builder: (BuildContext context, value, Widget? child) {
        Color textColor =
            MyColors.primaryTextBasedOnBgColor(value.colorSelected);
        Color selectedNoteColor = value.colorSelected;

        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading:true,
            iconTheme: IconThemeData(color: textColor),
            backgroundColor: selectedNoteColor ?? widget.note.color,
            leading: Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  child: const Icon(Icons.save),
                  onTap: () {
                    /// when editing the note not adding new one we save on the previous note

                    if (widget.isEditing) {
                      print('we are updating note...');
                      context.read<GridViewBloc>().add(UpdateNote(
                          note: widget.note,
                          newNote: Note(
                              title: _titleController.text.isEmpty
                                  ? _title
                                  : _titleController.text,
                              body: _bodyController.text.isEmpty
                                  ? _body
                                  : _bodyController.text,
                              id: Random().nextInt(100),
                              dateTime: _dateTime,
                              color: selectedNoteColor)));
                      Future.delayed(const Duration(milliseconds: 300), () {
                        Navigator.push(context, _buildPageRoute());
                      });
                    } else {
                      context.read<GridViewBloc>().add(AddNote(
                          note: Note(
                              title: _titleController.text.isEmpty
                                  ? _title
                                  : _titleController.text,
                              body: _bodyController.text.isEmpty
                                  ? _body
                                  : _bodyController.text,
                              id: Random().nextInt(100),
                              dateTime: _dateTime,
                              color: selectedNoteColor)));
                      Navigator.push(context, _buildPageRoute());
                    }
                  },
                );
              },
            ),
          ),
          body: Container(
            height: h,
            width: w,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: selectedNoteColor ?? widget.note.color,
            ),
            child: Stack(
              children: [
                // Positioned(
                //   right: 0,
                //   top: 0,
                //   child: InkWell(
                //     child: const CircleAvatar(
                //       child: Icon(
                //         Icons.delete,
                //         size: 35,
                //       ),
                //     ),
                //     onTap: () {
                //       // final deleteNoteUseCase=DeleteNoteUseCase(repository: instance());
                //       // deleteNoteUseCase.execute(note);
                //     },
                //   ),
                // ),
                Consumer<FontButtonProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: _titleController,
                              validator: (value) {
                                _title = value.toString();
                              },
                              onChanged: (changedValue) {
                                _formKey.currentState!.save();
                              },
                              onSaved: (value) {
                                _title = value.toString();
                              },
                              decoration: InputDecoration(
                                hintText: widget.note.title.isEmpty
                                    ? 'Title'
                                    : widget.note.title,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: textColor),
                              ),
                              // style: GoogleFonts.abyssinicaSil(
                              //     fontSize: 24, fontWeight: FontWeight.bold,textStyle: TextStyle(color: textColor) ),
                              style: value.selectedFont
                                  .getFontTitlePropertise(textColor),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            flex: 6,
                            child: Container(
                              constraints: const BoxConstraints(
                                  maxWidth: double.infinity),
                              child: TextFormField(
                                controller: _bodyController,
                                expands: true,
                                keyboardType: TextInputType.multiline,
                                minLines: null, // <-- SEE HERE
                                maxLines: null, // <-- SEE HERE
                                onChanged: (changedValue) {
                                  _formKey.currentState!.save();
                                },
                                onSaved: (value) {
                                  _body = value.toString();
                                },

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: widget.note.body.isEmpty
                                      ? 'Content'
                                      : widget.note.body,
                                  hintStyle: TextStyle(color: textColor),
                                ),

                                // style: GoogleFonts.abyssinicaSil(
                                //   fontSize: 20,
                                //   color: textColor,
                                // ),
                                style: value.selectedFont
                                    .getFontBodyPropertise(textColor),
                              ),
                            ),
                          ),
                          Consumer<FontButtonProvider>(builder:
                              (BuildContext context, value, Widget? child) {
                            return SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    "${widget.note.dateTime.day}-${widget.note.dateTime.month}-${widget.note.dateTime.year}",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16, color: textColor),
                                  ),

                                  const Spacer(),

                                  ///Font Selection
                                  FontAvatar(
                                    selectedNoteColor: selectedNoteColor,
                                    textColor: textColor,
                                    isToolBoxVisible: value.isToolBoxVisible,
                                  ),

                                  /// Colors ModalSheet
                                  // const ColorsAvatar(),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const ColorsBottomModalSheet();
                                        },
                                      );
                                    },

                                    /// modal sheet icon
                                    ///
                                    child: const ColorfulCircleAvatar(
                                      listOfColors: [
                                        Colors.red,
                                        Colors.orange,
                                        Colors.yellow,
                                        Colors.green,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),

                ///font avatar
                Consumer<FontButtonProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return Positioned(
                    bottom: 40,
                    left: 140,
                    child: Builder(builder: (context) {
                      if (value.isToolBoxVisible) {
                        return SizedBox(
                          height: 100,
                          width: w * 0.4,
                          child: ClipPath(
                            clipper: MessageShapeClipper(),
                            child: Container(
                              width: w * 0.2,
                              height: h * 0.14,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: textColor.withOpacity(0.1)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index ==
                                          value.selectedFontIconIndex) {
                                        return FontFamilyIcon(
                                          textColor: textColor,
                                          h: h,
                                          index: index,
                                          isSelected: true,
                                        );
                                      }
                                      return FontFamilyIcon(
                                        textColor: textColor,
                                        h: h,
                                        index: index,
                                        isSelected: false,
                                      );
                                    },
                                  )),
                            ),
                          ),
                        );
                      }
                      return Container();
                    }),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _titleController.clear();
    _bodyController.clear();
    super.dispose();
  }

  PageRouteBuilder _buildPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        // Your new screen widget goes here
        return const MyHomeScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);
        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
      transitionDuration:
          const Duration(seconds: 1), // Set the animation duration
    );
  }
}

_changeFontFamilyOfNote(BuildContext context) {}

class ColorsAvatar extends StatelessWidget {
  const ColorsAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          context: context,
          builder: (BuildContext context) {
            return const ColorsBottomModalSheet();
          },
        );
      },

      /// modal sheet icon
      ///
      child: const ColorfulCircleAvatar(
        listOfColors: [
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
        ],
      ),
    );
  }
}
