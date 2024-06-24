import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String p1;
  final String p2;
  GameScreen({super.key, required this.p1, required this.p2});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> _board;
  late String _currentPlayer;
  late bool _gameOver;
  late String _winner;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentPlayer = "X";
      _gameOver = false;
      _winner = "";
    });
  }

  void _makeMove(int row, int col) {
    if (_board[row][col] != "" || _gameOver) {
      return;
    }

    setState(() {
      _board[row][col] = _currentPlayer;
      if (_checkWinner(row, col)) {
        _gameOver = true;
        _winner = _currentPlayer;
      } else if (_board.every((row) => row.every((cell) => cell.isNotEmpty))) {
        _gameOver = true;
        _winner = "Draw";
      }
      _currentPlayer = _currentPlayer == "X" ? "O" : "X";
    });

    if (_gameOver) {
      _showWinnerDialog();
    }
  }

  bool _checkWinner(int row, int col) {
    return (_board[row].every((cell) => cell == _currentPlayer) ||
        _board.every((row) => row[col] == _currentPlayer) ||
        (_board[0][0] == _currentPlayer &&
            _board[1][1] == _currentPlayer &&
            _board[2][2] == _currentPlayer) ||
        (_board[0][2] == _currentPlayer &&
            _board[1][1] == _currentPlayer &&
            _board[2][0] == _currentPlayer));
  }

  void _showWinnerDialog() {
    String title = _winner == "X"
        ? widget.p1 + " Won!"
        : _winner == "O"
            ? widget.p2 + " Won!"
            : "Draw";
    DialogType dialogType =
        _winner == "Draw" ? DialogType.info : DialogType.success;

    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      btnOkText: "Play again",
      title: title,
      desc: "Congratulations",
      btnOkOnPress: () => _resetGame(),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003049),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Turn: " + _currentPlayer,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffedede9),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(5),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => _makeMove(row, col),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xff090C02),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          _board[row][col],
                          style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: _board[row][col] == "X"
                                ? Color(0xffa7c957)
                                : Color(0xffc1121f),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
