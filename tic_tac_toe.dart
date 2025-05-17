// Simple Tic-Tac-Toe Game in Dart
import 'dart:io';

void main() {
  runGame();
}

void runGame() {
  List<String> board = List.filled(9, ' ');
  String turn = 'X';
  bool playing = true;

  while (playing) {
    showBoard(board);
    int pos = getMove(board, turn);
    board[pos - 1] = turn;

    if (checkWin(board, turn)) {
      showBoard(board);
      print('Player $turn wins!');
      playing = false;
    } else if (checkDraw(board)) {
      showBoard(board);
      print('Draw!');
      playing = false;
    } else {
      turn = (turn == 'X') ? 'O' : 'X';
    }
  }
}

void showBoard(List<String> b) {
  for (int i = 0; i < 9; i += 3) {
    print(' ${b[i]} | ${b[i + 1]} | ${b[i + 2]} ');
    if (i < 6) print('---+---+---');
  }
  print('');
}

int getMove(List<String> b, String turn) {
  while (true) {
    stdout.write('Player $turn, choose (1-9): ');
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');
    if (choice != null && choice >= 1 && choice <= 9 && b[choice - 1] == ' ') {
      return choice;
    } else {
      print('Invalid move. Try again.');
    }
  }
}

bool checkWin(List<String> b, String t) {
  List<List<int>> wins = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ];
  for (var w in wins) {
    if (b[w[0]] == t && b[w[1]] == t && b[w[2]] == t) return true;
  }
  return false;
}

bool checkDraw(List<String> b) {
  return b.every((c) => c != ' ');
}
