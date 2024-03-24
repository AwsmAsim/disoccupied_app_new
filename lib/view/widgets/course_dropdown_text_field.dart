import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDropdownTextField extends StatefulWidget {
  CourseDropdownTextField({
    super.key,
    required this.courseController,
    this.height,
    this.hintText,
    required this.optionList,
    this.onChanged
  });

  final double? height;
  final String? hintText;
  final TextEditingController courseController;
  final List<String> optionList;
  ValueChanged<String>? onChanged;

  @override
  State<CourseDropdownTextField> createState() => CourseDropdownTextFieldState();
}

class CourseDropdownTextFieldState extends State<CourseDropdownTextField> {

  late TextEditingController courseName;


  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    // Perform your function when the TextField gains focus
    if (_isFocused) {
      showOverlay();
    } else {
      hideOverlay();
    }
  }

  OverlayEntry? entry;
  final layerLink = LayerLink();

  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
          width: 200,
          height: 299,
          child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 10),
              child: buildOverlay())
      ),
    );
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay() => NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (OverscrollIndicatorNotification? notification){
      notification!.disallowIndicator();
      return true;
    },
    child: Container(
        clipBehavior: Clip.hardEdge,
        height: widget.height ?? double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                  courseName.text = widget.optionList[index];
                  hideOverlay();
                  _focusNode.unfocus();
                },
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: DefaultTextStyle(
                      style: const TextStyle(),
                      child: Text(
                        widget.optionList[index],
                        style: GoogleFonts.robotoCondensed(
                            textStyle: const TextStyle(letterSpacing: 0.4),
                            fontSize: TextConstants.fontSizeH3,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Colors.grey
                        ),
                      ),
                    )
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
                thickness: 3,
              );
            },
            itemCount: widget.optionList.length)
    ),
  );

  @override
  void initState(){
    super.initState();
    courseName = TextEditingController();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose(){
    super.dispose();
    courseName.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextFormField(
        // keyboardType: TextInputType.none,
        // readOnly: true,

        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
            // prefixIcon: Icon(Icons.menu_book_rounded),
            // suffixIcon: Icon(Icons.arrow_drop_down_rounded),
            hintText: "Enter brand name",
            border: InputBorder.none
        ),
        controller: courseName,
        focusNode: _focusNode,
        onChanged: (value) {
          widget.courseController.text = value;
          if(widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}