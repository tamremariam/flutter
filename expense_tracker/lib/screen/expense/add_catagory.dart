import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCatagoryFragment extends StatelessWidget {
  const AddCatagoryFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isexpanded = true;
    return Dialog(
      // backgroundColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add Catagory",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            ),
            Column(
              children: [
                TextFormField(
                  onTap: () {
                    // MyFragment();
                  },
                  decoration: InputDecoration(
                    hintText: "Catagory Name",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.pen,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide.none, // Set borderSide to none here
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onTap: () {
                    // setState(() {
                    isexpanded = false;
                    // });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Select Icon",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.icons,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    suffixIcon: Icon(
                      Icons.expand_more,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide.none, // Set borderSide to none here
                    ),
                  ),
                ),
                isexpanded
                    ? Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onTap: () {},
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Select color",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.paintRoller,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    suffixIcon: Icon(
                      Icons.expand_more,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide.none, // Set borderSide to none here
                    ),
                  ),
                ),
              ],
            )
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildReceiptRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
