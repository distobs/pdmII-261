import 'dart:convert';
import 'dart:io';

class Stack {
  List<int>? stk;
  int sp = -1;

  void push(int value) {
    if (this.stk == null) {
      this.stk = [value];
    } else {
      this.stk?.add(value);
    }
    
    ++this.sp;
  }

  int? pop() {
    if (this.stk == null) {
      return null;
    } else {
      return this.stk?[this.sp--];
    }
  }
  
  bool empty() {
    return sp < 0;
  }
}

int? readInt() {
  String? tmp = stdin.readLineSync(encoding: utf8);
  
  if (tmp != null) {
    try {
      return int.parse(tmp);
    } catch(FormatException) {
      return null; 
    }
  } else {
    return null; 
  }
} 

void main() {
  Stack stk = Stack();
  int? option;
  print("0. Sair;\n1. Adicionar;\n2. Remover;\n3. Ver topo;\n4. Ver stack.");

  do {
    stdout.write("> ");

    option = readInt();
    
    if (option == null) {
      print("?");
      break;
    }

    switch (option) {
      case 1:
        int? tmp;
        print("Digite um inteiro:");
        tmp = readInt();
        if (tmp != null) {
          stk.push(tmp);
        } else {
          print("?");
        }
        break;
      case 2:
        int? pop = stk.pop();

        if (pop != null) {
          print("Removido: $pop");
        } else {
          print("Pilha vazia.");
        }
        break;
      case 3:
        if (!stk.empty()) {
          print(stk.stk![stk.sp]);
        } else {
          print("Pilha vazia.");
        }
        break;
      case 4:
        if (!stk.empty()) {
          for (int el = 0; el <= stk.sp; ++el) {
            stdout.write("${stk.stk![el]}, ");
          }

          stdout.write("\n");
        } else {
          print("Pilha vazia.");
        }
        break;
    }
  } while (option != 0);
}
