import 'package:flutter/material.dart';

void main() {
  // Create an app
  final app = MaterialApp(
    home: profileScreen,
  );

  // Run the app
  runApp(app);
}

// Create 'NewReview' screen
Widget get newReviewScreen {
  final appBar = AppBar(
    title: const Text('Add Review'),
  );
  final inputText = const TextField(
    decoration: InputDecoration(hintText: 'Write your review here'),
  );
  final body = Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Add a review for Royal Palace'),
        ),
        Padding(padding: EdgeInsets.all(8.0), child: ratingBar),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: inputText,
        ),
        Center(
          child:
              ElevatedButton(onPressed: onSubmitClick, child: Text('Submit')),
        )
      ],
    ),
  );
  return Scaffold(
    appBar: appBar,
    body: body,
  );
}

void onSubmitClick() {
  print('You click me!');
}

Widget get ratingBar {
  return Row(
    children: const [
      Icon(
        Icons.star_outline,
        size: 32,
      ),
      Icon(
        Icons.star_outline,
        size: 32,
      ),
      Icon(
        Icons.star_outline,
        size: 32,
      ),
      Icon(
        Icons.star_outline,
        size: 32,
      ),
      Icon(
        Icons.star_outline,
        size: 32,
      ),
    ],
  );
}

// Create 'Profile' screen
Widget get profileScreen {
  final body = Column(
    children: [
      Expanded(
          flex: 50,
          child: Container(
            color: Colors.blueAccent,
          )),
      Expanded(flex: 25, child: preferencesWidget),
      Expanded(flex: 25, child: favoritePlacesWidget)
    ],
  );
  return Scaffold(
    body: body,
  );
}

// Create 'Home' screen
Widget get homeScreen {
  final topImage = Image.asset('lib/image/img_royal_palace.jpg');
  final slideIndicators = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      indicator(isActive: true),
      indicator(),
      indicator(),
      indicator(),
      indicator(),
    ],
  );
  final nearMeTitle = Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    child: Row(
      children: [Text('Near Me'), Spacer(), Text('More')],
    ),
  );
  final body = ListView(
      children: [topImage, slideIndicators, nearMeTitle, nearMeListView]);
  return Scaffold(
    body: body,
  );
}

// mdpi: 1.0
// hdpi: 1.5
// xdpi: 2.0
// xxdpi: 3.0
// xxxdpi: 4.0

Widget indicator({bool isActive = false}) {
  return Container(
      margin: EdgeInsets.all(4),
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.green : Colors.white,
        border: Border.all(color: Colors.green),
      ));
}

Widget get nearMeListView {
  return SizedBox(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        placeItemWidget('lib/image/img_national_museum.jpg', 'National Museum'),
        placeItemWidget(
            'lib/image/img_independence_monument.jpg', 'Independent Monument'),
        placeItemWidget('lib/image/img_central_market.jpg', 'Central Market'),
        placeItemWidget('lib/image/img_royal_palace.jpg', 'Royal Palace'),
      ],
    ),
  );
}

Widget placeItemWidget(String imagePath, String name) {
  return Container(
    width: 120,
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        Expanded(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          name,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    ),
  );
}

Widget get preferencesWidget {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Preferences'),
      ),
      Wrap(
        children: [
          preferenceItemWidget('Natural'),
          preferenceItemWidget('Temple'),
          preferenceItemWidget('Mountain & Waterfall'),
          preferenceItemWidget('Sea & River'),
        ],
      )
    ],
  );
}

Widget preferenceItemWidget(String name) {
  return Padding(padding: EdgeInsets.all(4), child: Chip(label: Text(name)));
}

Widget get favoritePlacesWidget {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Favorites'),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              placeItemWidget(
                  'lib/image/img_national_museum.jpg', 'National Museum'),
              placeItemWidget('lib/image/img_independence_monument.jpg',
                  'Independent Monument'),
              placeItemWidget(
                  'lib/image/img_central_market.jpg', 'Central Market'),
              placeItemWidget('lib/image/img_royal_palace.jpg', 'Royal Palace'),
            ],
          ),
        )
      ],
    ),
  );
}
