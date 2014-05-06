# Erlang Tutorial

Welcome!

* Omar Kjartan Yasin (@omarkj)
* Tilman Holschuh (@ypaqt2vte6jo8)

---

# Getting Started

0. Have Erlang installed.

1. Clone or download the repository from https://github.com/EFLVan/tutorials

---

# Introduction to Erlang

## History of Erlang

* Built at Ericsson by Joe Armstrong, Mike Williams, Robert Virding, Bjarne Dacker
* Built for telecom systems such as switches and base stations - things with long
  uptime requirements

---

# Use the Erlang Shell

```shell
$ erl
```

```erlang
1> helloworld.
2> 1+1.
3> A = 3, B = 0, C = 7, D = 7, E = 10.
4> F = [A, B, C, D, E].
5> A = B.
6> [X + 69 || X <- F].
7> {i_am_a_tuple, 3.14159, "snap"}.
```
