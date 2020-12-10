import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatelessWidget {
  final PageViewModel page;
  final bool displayBottomPadding;

  const IntroPage({Key key, @required this.page, this.displayBottomPadding = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: page.decoration.pageColor,
      decoration: page.decoration.boxDecoration,
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (page.image != null)
              Expanded(
                flex: page.decoration.imageFlex,
                child: Padding(
                  padding: page.decoration.imagePadding,
                  child: page.image,
                ),
              ),
            Expanded(
              flex: page.decoration.bodyFlex,
              child: Padding(
                padding: EdgeInsets.only(bottom: displayBottomPadding ? 70.0 : 0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: IntroContent(page: page),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
