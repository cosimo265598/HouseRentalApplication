import 'package:flutter/material.dart';


class TopBar extends StatefulWidget {
  final String imageUser;
  TopBar({Key? key, required this.imageUser}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/menu_icon.png",
            width: 18,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38.0),
                  topRight: Radius.circular(38.0),
                  bottomLeft: Radius.circular(38.0),
                  bottomRight: Radius.circular(38.0),
                )),
            child: CircleAvatar(backgroundImage: NetworkImage(this.widget.imageUser)),
          ),
        )
      ],
    );
  }

}