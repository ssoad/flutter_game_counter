// To parse this JSON data, do
//
//     final match = matchFromJson(jsonString);

import 'dart:convert';

List<Match> matchFromJson(String str) =>
    List<Match>.from(json.decode(str).map((x) => Match.fromJson(x)));

String matchToJson(List<Match> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Match {
  Match({
    required this.id,
    required this.date,
    required this.teamA,
    required this.teamB,
  });
  int id;
  DateTime date;
  Team teamA;
  Team teamB;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        date: DateTime.parse(json["date"]),
        teamA: Team.fromJson(json["team_a"]),
        teamB: Team.fromJson(json["team_b"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "team_a": teamA.toJson(),
        "team_b": teamB.toJson(),
        "id": id,
      };
}

class Team {
  Team({
    this.name = "",
    this.player1 = "",
    this.player2 = "",
    this.player1Score = 0,
    this.player2Score = 0,
  });

  String name;
  String player1;
  String player2;
  int player1Score;
  int player2Score;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        player1: json["player_1"],
        player2: json["player_2"],
        player1Score: json["player_1_score"],
        player2Score: json["player_2_score"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "player_1": player1,
        "player_2": player2,
        "player_1_score": player1Score,
        "player_2_score": player2Score,
      };
}
