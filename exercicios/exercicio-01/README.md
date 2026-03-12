# Lista de Exercícios - Variáveis na Linguagem Dart

1. Explique o que é uma variável na linguagem Dart e qual é sua função em um
programa.

-> Variáveis são identificadores capazes de guardar valores. Em Dart, toda
variável guarda referências, e tipos como "int" ou "double" são classes. Uma
variável do tipo double guarda uma referência para um objeto de tipo double.

2. Em Dart, o que significa dizer que uma variável armazena uma referência a um
objeto?

-> Dizer que variáveis guardam referências significa dizer que elas guardam, em
vez dos valores em si, um valor que indica a localização do objeto referenciado
na memória do computador.

3. Qual é a diferença entre declarar uma variável usando 'var' e declarar
explicitamente o tipo da variável (por exemplo, 'String name')?

-> Declarar explicitamente o tipo da variável faz com que se torne impossível
guardar um valor de outro tipo nela (como atribuir `'Olá mundo'` à variável
`int ola`). Quando se declara uma variável usando 'var', duas coisas podem
acontecer: se a variável é definida e declarada (ex.: `var oi = 2`), o tipo é
"adivinhado" pela linguagem a partir do valor definido; se a variável é apenas
declarada, seu tipo pode ser modificado ao longo do programa. Exemplo:

```dart
var a, b = 2;

a = 2;

a = 'ola'; // valido
b = 'ola'; invalido
```

4. Explique como funciona a inferência de tipos quando uma variável é declarada
com 'var'.

-> O tipo da variável pode ser fixado por todo o seu tempo de existência ou
não, a depender da forma como é declarada a variável, como explicado acima. O
tipo é inferido a partir do tipo do literal ou da variável que se utiliza para
definir a variável.

5. Em quais situações pode ser útil declarar uma variável usando o tipo
'Object' ou 'dynamic'?

-> Quando a variável pode guardar objetos de vários tipos, é útil usar Object
ou dynamic.

6. Explique o conceito de null safety na linguagem Dart e qual problema ele
busca evitar.

-> Null safety é uma série de medidas que a linguagem Dart toma para evitar
operações indevidas em valores nulos (valores que, simplificadamente, não
representam nada). Acessar um método de uma variável do tipo nulo pode causar
acessos de áreas restritas da memória, gerando crashes difíceis de depurar.

7. Qual a diferença entre um tipo nullable (String?) e um tipo non-nullable
(String)?

-> Tipos non-nullable geram erros se assumirem valor nulo. É possível guardar
o valor nulo em uma variável de tipo nullable.

8. O que acontece se uma variável non-nullable for utilizada antes de ser
inicializada?

-> Um erro.

9. Descreva o comportamento padrão de variáveis nullable não inicializadas em
Dart.

-> As variáveis começam com valor `null`. Se o programa não tem certeza se a
variável já tem um valor não nulo, nenhum método pode ser usado, exceto aqueles
definidos para o tipo Null:

```dart
void requireStringNotObject(String? definitelyString) {
  print(definitelyString.length);
}

void main() {
  String? maybeString = 'it is';
  requireStringNotObject(maybeString);
}
```

10. Explique por que a linguagem exige que variáveis non-nullable sejam
inicializadas antes de seu uso.

-> Tentar acessar métodos que não existem ou realizar operações que não são
válidas em valores possivelmente nulos geraria _crashes_ e falhas de memória.

11. Explique o propósito do modificador 'late' em Dart.

-> Quando uma variável é usada de forma tipada e a linguagem não consegue
inferir se já há um valor atribuído, é emitido um erro:

```dart
int t; // o dart não consegue inferir se variáveis globais têm valor não nulo

void main() {
	t = 20;
	print(t); // erro
}

```

Quando se quer usar uma variável dessa categoria e inicializar-se seu valor
depois, pode-se usar o `late`:

```dart
late int t;

void main() {
	t = 20;
	print(t); // erro
}
```

Além disso, o modificador late é capaz de fazer com que uma variável só seja
inicializada antes de ser usada. Exemplo:

```dart
void main() {
	// rodar essa funcao no comeco do programa pode reduzir performance
	late int t = funcaoPesada();
	int valor;
	
	// (...)

	if (t == valor) {
		// (...)
	}
}
```

12. Em quais situações o uso de 'late' pode ser necessário em variáveis de
classe ou top-level?

-> Quando a variável não é inicializada com um valor não nulo na declaração, e é
modificada ao longo do programa.

13. Qual é a diferença entre uma variável 'late' inicializada na declaração e
uma 'late' inicializada posteriormente?

-> Quando a variável já é inicializada com `late`, ocorre o lazy loading: o
valor da variável só é computado quando é usada.

14. O que acontece em tempo de execução se uma variável 'late' for utilizada
antes de receber um valor?

-> Um erro.

15. Explique a diferença conceitual entre variáveis declaradas com 'final' e
'const'.

-> Variáveis com tipo "const" são imutáveis e conhecidas em tempo de compilação.
Variáveis com tipo "final" não devem necessariamente ter valores conhecidos em
tempo de compilação.

16. Por que uma variável 'const' deve ser inicializada com um valor conhecido
em tempo de compilação?

17. Uma variável 'final' pode ter seu valor alterado após a inicialização?
Justifique.

18. Explique a diferença entre imutabilidade da referência e imutabilidade do
objeto ao usar 'final'.

19. O que são wildcard variables (\_) em Dart e em quais contextos elas podem
ser utilizadas?

20. Discuta boas práticas recomendadas para declaração de variáveis locais em
Dart, especialmente o uso de 'var' e 'final'.
