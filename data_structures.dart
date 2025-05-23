// Data Structures Challenges in Dart (Simplified)

// --- STACKS ---

// Challenge 1: Reverse a List
void reverseList(List list) {
  for (int i = list.length - 1; i >= 0; i--) {
    print(list[i]);
  }
}

// Challenge 2: Balance the Parentheses
bool isBalanced(String text) {
  List stack = [];
  for (var c in text.split('')) {
    if (c == '(') {
      stack.add(c);
    } else if (c == ')') {
      if (stack.isEmpty) return false;
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

// --- LINKED LIST ---

class Node {
  int value;
  Node? next;
  Node(this.value);
}

class MyList {
  Node? head;

  void add(int v) {
    if (head == null) {
      head = Node(v);
    } else {
      Node curr = head!;
      while (curr.next != null) {
        curr = curr.next!;
      }
      curr.next = Node(v);
    }
  }

  void printAll() {
    Node? curr = head;
    while (curr != null) {
      print(curr.value);
      curr = curr.next;
    }
  }

  void printReverse(Node? node) {
    if (node == null) return;
    printReverse(node.next);
    print(node.value);
  }

  Node? getMiddle() {
    Node? slow = head;
    Node? fast = head;
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }
    return slow;
  }

  void reverse() {
    Node? prev = null;
    Node? curr = head;
    while (curr != null) {
      Node? next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }
    head = prev;
  }

  void removeAll(int val) {
    while (head != null && head!.value == val) {
      head = head!.next;
    }
    Node? curr = head;
    while (curr != null && curr.next != null) {
      if (curr.next!.value == val) {
        curr.next = curr.next!.next;
      } else {
        curr = curr.next;
      }
    }
  }
}

void main() {
  reverseList([10, 20, 30]);
  print(isBalanced("(())()"));

  MyList list = MyList();
  list.add(1);
  list.add(2);
  list.add(3);
  list.add(4);
  list.add(2);

  print("List:");
  list.printAll();

  print("Reversed:");
  list.reverse();
  list.printAll();

  print("Middle: \${list.getMiddle()?.value}");

  print("Print in reverse:");
  list.printReverse(list.head);

  print("Remove all 2s:");
  list.removeAll(2);
  list.printAll();
}
