import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/widget/style.dart';

import 'colors.dart';

typedef DeleteTag<T> = void Function(T index);

typedef TagTitle<String> = Widget Function(String tag);

// ignore: must_be_immutable
class FlutterTagView extends StatefulWidget {
  FlutterTagView(
      {Key? key,
      required this.tags,
      this.minTagViewHeight = 0,
      this.maxTagViewHeight = 150,
      this.tagBackgroundColor = Colors.black12,
      this.selectedTagBackgroundColor = Colors.lightBlue,
      this.deletableTag = true,
      this.onDeleteTag,
      this.tagTitle})
      : assert(
            // ignore: unnecessary_null_comparison
            tags != null,
            'Tags can\'t be empty\n'
            'Provide the list of tags'),
        super(key: key);

  List<String> tags;

  Color tagBackgroundColor;

  Color selectedTagBackgroundColor;

  bool deletableTag;

  double maxTagViewHeight;

  double minTagViewHeight;

  DeleteTag<int>? onDeleteTag;

  TagTitle<String>? tagTitle;

  @override
  State<FlutterTagView> createState() => _FlutterTagViewState();
}

class _FlutterTagViewState extends State<FlutterTagView> {
  int selectedTagIndex = -1;

  @override
  Widget build(BuildContext context) {
    return getTagView();
  }

  Widget getTagView() {
    var screensize = MediaQuery.of(context).size;
    return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: widget.minTagViewHeight,
          maxHeight: widget.maxTagViewHeight,
        ),
        child: Container(
          width: screensize.width,
          margin: const EdgeInsets.only(top: 15),
          padding: widget.tags.isEmpty ? null : const EdgeInsets.all(2),
          decoration: BoxDecoration(
            //color: AppColor.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: buildTags(),
            ),
          ),
        ));
  }

  List<Widget> buildTags() {
    List<Widget> tags = <Widget>[];

    for (int i = 0; i < widget.tags.length; i++) {
      tags.add(createTag(i, widget.tags[i]));
    }

    return tags;
  }

  Widget createTag(int index, String tagTitle) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedTagIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.5),
        child: Chip(
          side: BorderSide.none,
          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: widget.tagBackgroundColor,
          label: widget.tagTitle == null
              ? Text(
                  tagTitle,
                  style: style.copyWith(
                    fontSize: 12,
                    color: AppColor.darkerGrey,
                  ),
                )
              : widget.tagTitle!(tagTitle),
          deleteIcon: Icon(
            CupertinoIcons.clear_circled,
            size: 18,
            color: AppColor.black.withOpacity(0.8),
          ),
          onDeleted: widget.deletableTag
              ? () {
                  if (widget.deletableTag) deleteTag(index);
                }
              : null,
        ),
      ),
    );
  }

  void deleteTag(int index) {
    if (widget.onDeleteTag != null) {
      widget.onDeleteTag!(index);
    } else {
      setState(() {
        widget.tags.removeAt(index);
      });
    }
  }
}    

//  setState(() { widget.tags.removeAt(index)})



