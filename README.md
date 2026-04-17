# Programming Languages

Coursework from my Programming Languages course during study abroad in Madrid. The course covered the theory and implementation of programming languages — functional programming in Haskell, logic programming in Prolog, and building an actual compiler from scratch in Java.

Three pretty different paradigms. All of it clicked in ways I didn't expect.

---

## Haskell — Functional Programming

No loops, no mutation. Everything is a function and recursion is how you get things done.

The files cover a progression of concepts:

- **Arithmetic with type polymorphism** — basic operations (`incInt`, `addInt`, `incFloat`) plus type-polymorphic functions using `Num a => a -> a` so the same function works on both `Int` and `Float`
- **List recursion** — pattern matching on `head:tail` to traverse lists; `charToUpper`/`charToLower` without touching any standard library
- **List aggregations** — `digitsOfList`, `minOfList`, `maxOfList`, `sumEvenNumbers`, `sumOddNumbers`, `numToSquare`, and a version of `numToSquare` rewritten with `map`
- **String manipulation** — `reverseString` two ways (stdlib shortcut vs. manual recursion), `stringToLower`/`stringToUpper` via `map`, `isVowel` with two implementations, `countVowels`, `countVowelsAndConsonants`
- **Base conversion** — `digitsToInt` converts a string of digits in any base (2, 4, 8, 10, or 16) to decimal using an accumulator pattern; also `decimalToInt` and `binaryToInt`
- **Tuple operations** — `first`/`second` extractors, `hasVowel` on 5-tuples, `countAllVowels`, `hasAllVowels`
- **Recursive math** — `listPowersOfTwo`, `quotient`/`remainder` via subtraction, `multiply` via addition, `power` via multiplication — all without using built-in operators, just recursion

Note: Haskell files don't have `.hs` extensions because they were originally submitted that way. They're valid Haskell — load them in GHCi directly.

---

## Prolog — Logic Programming

Prolog is a different way of thinking. You define facts and rules, then query the knowledge base and let the engine figure out the answers.

- **`basics.pl`** — foundational facts (`female`, `male`, `eats`, `drinks`) and rules for what Jane, John, Alice, and James each like
- **`pizza lovers.pl`** — extends basics with a mutual-liking rule: `loves(X,Y) :- likes(X,Y), likes(Y,X)` — includes the actual query outputs in comments so you can see what the engine returns
- **`fact.pl`** — a four-generation family tree with rules for `parent`, `grandfather`, `grandmother`, `son`, `daughter`, `sister`, `brother`, `sibling`, `aunt`, `uncle`, `ancestor` (recursive), `descendant`, `haschild`. Uses cut (`!`) in `progenitor` to stop backtracking. Commented queries show how to use it.

---

## Java — Compiler for a Custom Language

This was the most involved part of the course. We designed a mini-language with its own grammar and built a working compiler for it.

**The language** is defined in `lexicon.txt` — operators (`+`, `-`, `*`, `/`, `%`), keywords, and delimiters all specified as token/lexeme pairs.

**Assignment 1 (`src/translator/`)** — `PostfixTranslator.java` takes an infix arithmetic expression and converts it to postfix notation using a stack. Implements a right-recursive syntax-directed definition (SDD) grammar. Handles `+`, `-`, `*`, `/`, `%` and parentheses.

**Assignment 2 (`src/stackmachine/compiler/`)** — A compiler that translates programs written in the mini-language into stack machine instructions (`push`, `load`, `store`, `print`, `halt`). Built in three incremental stages:

- `sp1/` — variable declarations and basic arithmetic assignments
- `sp2/` — extends sp1
- `sp3/` — extends sp2

**Sample programs** (written in the mini-language, compiled by the stack machine):

| File | What it does |
|------|-------------|
| `program factorial 10.txt` | Computes 10! using a while loop |
| `program fibonacci 20.txt` | Computes fibonacci(20) with dynamic programming |
| `program binary search.txt` | Binary search on an array of even integers |
| `program Newton sqrt.txt` | Newton's method for square roots |
| `sm test assignment.txt` | Compiled stack machine output — push/store/load instructions |
| `sm test array.txt` | Compiled stack machine output — array operations |

---

## Course Context

This was part of my CS curriculum during study abroad in Madrid. The course focused on language design, parsing theory, and compilation — not just learning syntax of different languages, but understanding *why* they work the way they do. Haskell made recursion and type systems click. Prolog reframed what "programming" even means. Building the compiler end-to-end was the hardest and most rewarding part.
