import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteit/core/utils/extensions/extensions.dart';
import '../../../../core/utils/constants/utility/variables.dart';
import '../../../domain/entities/note_entity.dart';
import '../../manager/blocs/gridview_bloc/gridviewbloc_bloc.dart';
import '../add_note_screen_widgets/note_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DynamicGrid extends StatelessWidget {
  const DynamicGrid({super.key});
  @override
  Widget build(BuildContext context) {
    // context.read<GridViewBloc>().add(LoadNotes());
    return BlocProvider(
      create: (context) => GridViewBloc()..add(LoadNotes()),
      child: Scaffold(
        body: BlocBuilder<GridViewBloc, GridviewState>(
          builder: (context, state) {
            if (state is NotesLoaded) {
              return StreamBuilder<QuerySnapshot>(
                stream: state.streamFirebase,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        'add an awesome note!',
                        style: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle
                            ?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    );
                  }

                  List<GlobalKey> _listOfNotesGlobalKeys = [];
                  Map<int, double> noteCardKeys = {};

                  //todo: Add to first column or second depending on fitting in the shape position
                  List<NoteCard> allNotesList = snapshot.data!.docs.map((e) {
                    // QueryDocumentSnapshot documentSnapshot =
                    // snapshot.data!.docs[];

                    DateTime dateTime = DateTime.parse(e['dateTime']);
                    var title = e['title'];
                    var body = e['body'];
                    var color = e['color'];
                    var id = e['id'];
                    var titleEndRangeOfSubstring = title.toString().length > 5
                        ? 5
                        : title.toString().length;
                    var bodyEndRangeOfSubstring = body.toString().length > 30
                        ? 30
                        : body.toString().length;

                    return NoteCard(
                      note: Note(
                        // title: title.toString().substring(0,titleEndRangeOfSubstring),
                        // body: body.toString().substring(0,bodyEndRangeOfSubstring),
                        title: title.toString(),

                        body: body.toString(),
                        // title: title.toString(),
                        // body: body.toString(),
                        color: Color(color),
                        id: id,
                        dateTime: dateTime.toLocal() ?? DateTime.now(),
                      ),
                      // globalKey: GlobalKey(),
                    );
                  }).toList();



                  /// 78 title 144 body
                  List<NoteCard> rightWrap = [];
                  List<NoteCard> leftWrap = [];

                  for (int i = 0; i < allNotesList.length; i++) {
                    NoteCard noteCard = allNotesList[i];

                    if (i == 0) {

                      leftWrap.add(noteCard);

                    } else if (i == 1) {

                      rightWrap.add(noteCard);

                    }

                    ///starting from i=2
                    ///we want to compare the previous two notes sizes
                    ///to add the note underneath one of them
                    else {

                      /// those two notes are the two notes in the row above the new note
                      var sizeOfLeftWrap = totalSizeOfWrap(leftWrap);

                      var sizeOfRightWrap = totalSizeOfWrap(rightWrap);


                      ///left note bigger than the right note,
                      /// add next note to right wrap
                      ///----> the note will be added to the right wrap
                      if (sizeOfRightWrap<sizeOfLeftWrap) {

                        rightWrap.add(noteCard);

                      }


                      ///----> the note will be added to left wrap
                      else {

                        leftWrap.add(noteCard);

                      }
                    }
                  }
                  // print(noteCardKeys);
                  // print(allNotesList);


                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        // MasonryGridView.count(
                        //   crossAxisCount: 2,
                        //   mainAxisSpacing: 16,
                        //   crossAxisSpacing: 16,
                        ///Single child with Wrap works very well
                        DynamicListWithWraps(
                      firstWrap: leftWrap,
                      secondWrap: rightWrap,
                    ),

                    // GridView.builder(
                    //   itemCount: snapshot.data!.docs.length,
                    //   shrinkWrap: true,
                    //
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     childAspectRatio: 3/4 ,
                    //     // mainAxisExtent: MediaQuery.of(context).size.height/4,
                    //     crossAxisCount: 2,
                    //     crossAxisSpacing: 16,
                    //     mainAxisSpacing: 16,
                    //   ),
                    //   itemBuilder: (BuildContext context, int index) {
                    //     QueryDocumentSnapshot documentSnapshot =
                    //     snapshot.data!.docs[index];
                    //     DateTime dateTime = DateTime.parse(
                    //         documentSnapshot['dateTime']);
                    //     var title=documentSnapshot['title'];
                    //     var body=documentSnapshot['body'];
                    //     var color=documentSnapshot['color'];
                    //     var id=documentSnapshot['id'];
                    //     var titleEndRangeOfSubstring=title.toString().length>5?5:title.toString().length;
                    //     var bodyEndRangeOfSubstring=body.toString().length>30?30:body.toString().length;
                    //
                    //     return NoteCard(
                    //       note: Note(
                    //         title: title.toString().substring(0,titleEndRangeOfSubstring),
                    //         body: body.toString().substring(0,bodyEndRangeOfSubstring),
                    //         // title: title.toString(),
                    //         // body: body.toString(),
                    //         color: Color(color),
                    //         id:id ,
                    //         dateTime: dateTime.toLocal() ?? DateTime.now(),
                    //       ),
                    //     );
                    //   },
                    //
                    //   ),
                  );
                },
              );
            } else if (state is NotesLoading) {
              return const CircularProgressIndicator();
            } else if (state is ErrorLoadingNotes) {
              return const Center(
                child: Text('Error state  in the bloc'),
              );
            } else {
              return const Center(
                child: Text('something is wrong in the bloc'),
              );
            }
          },
        ),
      ),
    );
  }

  sizeOfNote(NoteCard noteCard,) {

    // print("size of note method called ");
    // noteCard.note.title.characters.length;

    var bodyLength=noteCard.note.body.length.toDouble();
    var titleLength=noteCard.note.title.length.toDouble();
    var paddingSize=2;
    double sizeOfSingleNoteCard = 0;


    if(bodyLength>=126 && titleLength>=66){

      // print("Iam a big Note and exceeds the limit..");

      return sizeOfSingleNoteCard = (126/18).ceilToDouble()+(66/13).ceilToDouble()+paddingSize;

    }
    if(bodyLength>=126 && titleLength<66){
      sizeOfSingleNoteCard= (126/18).ceilToDouble() + (titleLength/13).ceilToDouble()+paddingSize;
      return sizeOfSingleNoteCard;
    }
    if(titleLength>=66&&bodyLength<126){
      sizeOfSingleNoteCard=(66/13).ceilToDouble()+(bodyLength/18).ceilToDouble()+paddingSize;
      return sizeOfSingleNoteCard;
    }

    if(bodyLength<126&&bodyLength>0 && titleLength<66&&titleLength>0){

      // print("I am a medium note and my body is :$bodyLength & my title lenght is $titleLength");

    sizeOfSingleNoteCard = (bodyLength/18).ceilToDouble()+(titleLength/13).ceilToDouble()+paddingSize;
    return sizeOfSingleNoteCard;

    }

    if(bodyLength<1 &&titleLength<1){
      print("the body and title are indeed empty");
      bodyLength=1;
      titleLength=1;
      sizeOfSingleNoteCard= bodyLength+titleLength+paddingSize;
      return sizeOfSingleNoteCard;
    }
    if(bodyLength<1&&titleLength>0){
      print("the body or title are indeed empty");

      bodyLength=1;
      sizeOfSingleNoteCard = (titleLength/13).ceilToDouble()+bodyLength+paddingSize;
      return sizeOfSingleNoteCard;
    }
    if(titleLength<1&&bodyLength>0){
      print("the body or title are indeed empty");

      titleLength=1;
      sizeOfSingleNoteCard = (bodyLength/18).ceilToDouble()+titleLength+paddingSize;

      return sizeOfSingleNoteCard;
    }

    else{
      sizeOfSingleNoteCard = (bodyLength/18).ceilToDouble()+(titleLength/13).ceilToDouble()+paddingSize;
      return sizeOfSingleNoteCard;

    }

  }

  totalSizeOfWrap(List<NoteCard> wrap) {

    print("\n totalSizeOfWrap called");
    double totalSize = 0;

    for (var element in wrap) {

      totalSize += sizeOfNote(element)?? 0;
    }

    print("total size of this wrap \t  ${wrap}:$totalSize");

    return totalSize;
  }
}

class DynamicListWithWraps extends StatelessWidget {

  const DynamicListWithWraps({
    super.key,
    required this.firstWrap,
    required this.secondWrap,
  });


  final List<NoteCard> firstWrap;
  final List<NoteCard> secondWrap;


  @override
  Widget build(BuildContext context) {

    print("build called");

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            direction: Axis.vertical,

            children:firstWrap.toList(),
          ),
          const Flexible(
              child: SizedBox(
            width: 25,
          )),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            direction: Axis.vertical,

            children:secondWrap.toList(),
          ),
        ],
      ),
    );
  }

  totalSizeOfWrap(List<double?> wrap) {
    double totalSize = 0;

    for (var element in wrap) {
      totalSize += element ?? 0;
    }
    return totalSize;
  }

  Map<String, List<NoteCard>> returnLeftAndRightWraps( List<NoteCard> mixedWrap,) {



    List<NoteCard> leftList = [];
    List<NoteCard> rightList = [];

    String leftWrapKey = "LeftWrapKey";
    String rightWrapKey = "RightWrapKey";
    if(mixedWrap.length==mixedSizesOfWrap.length){
      for (int i = 0; i < mixedSizesOfWrap.length; i++) {

        NoteCard noteCard = mixedWrap[i];
        if (i == 0) {
          sizesOfLeftWrap.add(mixedSizesOfWrap[i]);
          leftList.add(noteCard);
          print("first  condition");

          // widget.firstWrap.add(noteCard);
        } else if (i == 1) {
          sizesOfRightWrap.add(mixedSizesOfWrap[i]);
          rightList.add(noteCard);
          print("second condition");
          //   widget.secondWrap.add(noteCard);
        }

        ///starting from i=2
        ///we want to compare the previous two notes sizes
        ///to add the note underneath one of them
        else {
          ///left note bigger than the right note,
          /// add next note to right wrap
          ///----> the note will be added to the right wrap
          if (totalSizeOfWrap(sizesOfLeftWrap) >
              totalSizeOfWrap(sizesOfRightWrap)) {
            rightList.add(noteCard);
            sizesOfRightWrap.add(mixedSizesOfWrap[i]);
            // widget.secondWrap.add(noteCard);
          }

          ///----> the note will be added to left wrap
          else {
            leftList.add(noteCard);
            sizesOfLeftWrap.add(mixedSizesOfWrap[i]);
            // widget.firstWrap.add(noteCard);
          }
        }

      }

      print(
          "I am the total size of left wrap :${totalSizeOfWrap(sizesOfLeftWrap)} ");
      print(
          "I am the total size of right wrap :${totalSizeOfWrap(sizesOfRightWrap)} ");
      print(leftList);
      print(rightList);
      sizesOfLeftWrap.clear();
      sizesOfRightWrap.clear();
    }
    return {leftWrapKey:leftList,rightWrapKey:rightList};
  }
}
