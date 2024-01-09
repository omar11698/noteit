import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteit/Note_feature/domain/use_cases/delete_note_usecase.dart';
import 'package:noteit/Note_feature/presentation/pages/add_note_screen.dart';
import 'package:noteit/core/config/Dependency_injection/DI.dart';
import 'package:noteit/core/config/themes/theme_provider.dart';
import 'package:noteit/core/utils/constants/utility/variables.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/note_entity.dart';
import '../../manager/providers/color_showmodal_provider.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  const NoteCard({
    super.key,
    required this.note,
  });
  // GlobalKey<_NoteCardState> globalKey = GlobalKey();

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard>
    with SingleTickerProviderStateMixin {
  late double? containerHeight;
  late AnimationController wiggleAnimationController;
  late Animation<double> wiggleAnimation;
  late Animation<double> wiggleAnimation2;
  late Animation<double> wiggleAnimation3;
  late Animation<double> wiggleAnimation4;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   containerHeight =
    //       getTheContainerHeight(context: widget.globalKey.currentContext);
    //   mixedSizesOfWrap
    //       .add(getTheContainerHeight(context: widget.globalKey.currentContext));
    // });
    super.initState();
    wiggleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    wiggleAnimation = Tween<double>(begin: 0,end: pi/8).animate(
      CurvedAnimation(
        parent: wiggleAnimationController,
        curve: const Interval(0, 0.25,curve: Curves.easeIn),
      ),
    );
    wiggleAnimation2 = Tween<double>(begin: pi/8,end:-pi/8 ).animate(
      CurvedAnimation(
        parent: wiggleAnimationController,
        curve: const Interval(0.25, 0.5,curve: Curves.easeIn),
      ),
    );
    wiggleAnimation3 = Tween<double>(begin: -pi/8,end: pi/8).animate(
      CurvedAnimation(
        parent: wiggleAnimationController,
        curve: const Interval(0.5, 0.75,curve: Curves.easeIn),
      ),
    ); wiggleAnimation4 = Tween<double>(begin: pi/8,end: 0).animate(
      CurvedAnimation(
        parent: wiggleAnimationController,
        curve: const Interval(0.75, 1,curve: Curves.easeIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    startWiggleAnimation(){
      wiggleAnimationController.reset();
      wiggleAnimationController.forward();
    }

    return AnimatedBuilder(
      animation: wiggleAnimationController,
      builder: (context, child) {
        return GestureDetector(
          onLongPress: () {
            // showModalBottomSheet(
            //   context: context,
            //   builder: (context) {
            //     return SizedBox(
            //       height: h*0.15,
            //       child: Center(child: const Text('Top modal sheet')),
            //     );
            //   },
            //
            //   isScrollControlled: true,
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(
            //       top: Radius.circular(25),
            //     ),
            //   ),
            // );
            startWiggleAnimation();


            // Basic SnackBar
          },
          onTap: () {
            Provider.of<ShowColorBottomModalProvider>(context, listen: false)
                .colorSelected = widget.note.color;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddNoteScreen(
                note: widget.note,
                isEditing: true,
              );
            }));
          },
          child: Transform.rotate(
            angle: _animationValueForRotationAngle(),
            child: Builder(
                // key: widget.globalKey,
                builder: (ctx) {
              return Consumer<ThemeProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Container(
                    // key: globalKey,
                    constraints: BoxConstraints(
                        maxHeight: h * 0.45,
                        maxWidth: w * 0.45,
                        minWidth: w * 0.45,
                        minHeight: h * 0.0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.note.color,

                      /// changing the borders to make the note clear for the user depending on the color of the background
                      border: value.isThemeChanged
                          ? Border.all(
                              color: widget.note.color ==
                                      Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(0.1)
                                  ? Colors.white
                                  : widget.note.color,
                              width: 1)
                          : Border.all(
                              color: widget.note.color ==
                                      Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(0.1)
                                  ? Colors.blueGrey
                                  : widget.note.color,
                              width: 1),

                      boxShadow: [
                        BoxShadow(
                          color: widget.note.color.withOpacity(0.5),
                          spreadRadius: 1,
                          // blurRadius: 2,

                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                        // clipBehavior: Clip.none,
                        // fit: StackFit.expand,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.note.title,
                                  style: GoogleFonts.openSans(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  widget.note.body,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${widget.note.dateTime.day}-${widget.note.dateTime.month}-${widget.note.dateTime.year}",
                                style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              child: const CircleAvatar(
                                child: Icon(
                                  Icons.delete,
                                  size: 35,
                                ),
                              ),
                              onTap: () {
                                ///show a snack bar which contains two buttons yes and no for checking  if the user really needs to delete the note
                                final deleteNoteUseCase =
                                    DeleteNoteUseCase(repository: instance());
                                final snackBar = SnackBar(
                                  content: const Text(
                                      'Are you sure you want to delete this note?'),
                                  duration: const Duration(days: 1),
                                  action: SnackBarAction(
                                    label: 'YES',
                                    onPressed: () {
                                      // Delete note
                                      deleteNoteUseCase.execute(widget.note);
                                    },
                                    textColor: Colors.red,
                                  ),
                                  onVisible: () {
                                    // Snack bar visible
                                  },
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                            ),
                          ),
                        ]),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }

  double? getTheContainerHeight({BuildContext? context}) {
    // Ensure the widget is rendered before trying to get the height
    if (context != null) {
      final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
      containerHeight = renderBox!.size.height;
    }
    // print(containerHeight);
    return containerHeight;
  }

  @override
  void dispose() {
    super.dispose();
    // mixedSizesOfWrap.remove(
    //     getTheContainerHeight(context: widget.globalKey.currentContext));
  }

  @override
  void deactivate() {
    super.deactivate();
    // mixedSizesOfWrap.remove(
    //     getTheContainerHeight(context: widget.globalKey.currentContext));
  }

  _animationValueForRotationAngle() {

  if(wiggleAnimation.value<pi/8){
    return wiggleAnimation.value;
  }
  else{
    if(wiggleAnimation2.value==-pi/8){
      if(wiggleAnimation3.value==pi/8){
        return wiggleAnimation4.value;
      }
      else{
        return wiggleAnimation3.value;
      }
    }
    else{
      return wiggleAnimation2.value;
    }
  }




  }
}
