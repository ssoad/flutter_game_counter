import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/views/components/reuseable_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/manage_data.dart';
import '../../models/match.dart';

class NewMatch extends StatefulWidget {
  const NewMatch({Key? key}) : super(key: key);

  @override
  State<NewMatch> createState() => _NewMatchState();
}

class _NewMatchState extends State<NewMatch> {
  Team a = Team();
  Team b = Team();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.08),
        child: const CustomAppBar(title: "New Match"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Center(
                        child: Text("Team-A Details"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          a.name = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Team Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          a.player1 = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Player 1 Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          a.player2 = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Player 2 Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Center(
                        child: Text("Team-B Details"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          b.name = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Team Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          b.player1 = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Player 1 Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          b.player2 = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Player 2 Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.blue,
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  // await pref.clear();
                  int? curr_id = pref.getInt("curr_id") ?? 0;
                  Match match = Match(
                      date: DateTime.now(), teamA: a, teamB: a, id: curr_id);
                  DataController controller = DataController();
                  String data = await controller.getdata();
                  print(data);
                  List<Match> ls = matchFromJson(data);
                  ls.add(match);
                  await controller.putdata(matchToJson(ls));
                  var d = await controller.getdata();
                  print(d);
                },
                child: const Text('Create Match'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
