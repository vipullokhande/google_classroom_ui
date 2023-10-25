import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/dar_mode_controller.dart';

enum Item { enroll }

// ignore: must_be_immutable
class SingleClassroomWidget extends StatelessWidget {
  String title;
  String tutor;
  String background;
  // MaterialColor color;
  VoidCallback onPressed;
  SingleClassroomWidget({
    super.key,
    required this.title,
    required this.tutor,
    required this.background,
    // required this.color,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final foregroundColor = isDark ? Colors.white : Colors.black;
    final backgroundColor = isDark ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 160,
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.only(
          top: 5,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: color,
          image: DecorationImage(
            image: NetworkImage(
              background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                PopupMenuButton(
                  splashRadius: 10,
                  color: backgroundColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(color: foregroundColor, width: 1),
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: Item.enroll,
                        child: Text(
                          'Enroll',
                          style: TextStyle(
                            color: foregroundColor,
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Text(
                tutor,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.020,
            ),
          ],
        ),
      ),
    );
  }
}
