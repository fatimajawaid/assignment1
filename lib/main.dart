import 'package:assignment1/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:assignment1/widgets/event_tiles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              AppBar(
                title: Text('Custom AppBar Shape'),
                shape: CustomAppBarShape(),
                backgroundColor: Colors.orange,
              ),
              Container(
                height: 90,
              ),
              ClipOval(
                child: Image.asset('assets/images/froggo.jpg',
                width: 110, height: 110,
                fit: BoxFit.cover,
                ),
              ),
              Text("John Doe",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffD62828),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: 
                Text("John Doe exists. John Doe builds. John Doe innovates. What's next? Only time will tell...",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff929292),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ProfileTabs(
                  tabTitles: ["Posts", "Comments", "Stats"],
                  tabContents: [
                    ListView(
                      children: [
                        _postCard("Tech Conference", "30 November 2024, 9:00 AM", "13th Street, Park Avenue"),
                        _postCard("Leadership Seminar", "28 Jan 2025, 2:00 PM", "13th Street, Park Avenue"),
                        _postCard("Entrepreneurship Summit", "15 March 2025, 10:00 AM", "13th Street, Park Avenue"),
                      ],
                    ),
                    ListView(
                      children: [
                        _commentCard("Flutter Flash", "Looks like an amazing event!", "30 November 2024, 11:00 PM"),
                        _commentCard("Bob's Annual BBQ", "Wish I could've been there :(", "2 August 2024, 10:31 PM"),
                        _commentCard("Networking Lounge", "Will the event be starting on time?", "25 June 2023, 12:00 AM"),
                      ],
                    ),
                    _statsCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postCard(String title, String date, String location) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shadowColor: Color(0xff000000),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Image.asset("assets/images/event.png", width: 90, height: 90,),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$date\n$location\nJohn Doe"),
      ),
    );
  }

  Widget _commentCard(String title, String comment, String date) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        tileColor: Colors.white,
        leading: Image.asset("assets/images/comments_arrow.png", width: 24, height: 24, color: Colors.grey),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('"$comment"\n$date')
      ),
    );
  }

  Widget _statsCard() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("19", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red)),
          Text("Posts", style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text("32", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red)),
          Text("Comments", style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
