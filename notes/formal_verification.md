
# Formal Verification

**Definition**: a process for mathematcally verifying program correctness with respect to specification.
here by `specification` we mean formal specification not comments and docs.

### Eequality of expressions

*Example 1:*
```
41 + 1 = 40 + 2 = 42
```

*Example 2:*
```
f = (fun x -> x) ; f' = (fun y -> y)
f = f'
```
here we read `for all v . f v = f' v`

### Proving Properties of programs

**Setup**:
```ocaml
(* composition operator *)
let (<<) f g x = f @@ g x
```

**Theorem**:
```ocaml
(f << (g << h)) x = ((f << g) << h) x
```

**Proof**:
```
  (f << (g << h)) x
= f ((g << h) x)
= f (g (h x))
and
  ((f << g) << h) x
= (f << g) (h x)
= f (g (h x))
```
*QED*

### Induction

**Setup**:
```ocaml
let rec sum' n =
  if n = 0 then 0
  else n + sum' (n - 1)
```

**Theorem**:
```
sum' n = n * (n + 1) / 2
```

**Proof**:
*base case*:
```
n = 0

  sum' 0
= 0

  0 * (0 + 1) / 2
= 0 / 2
= 0
```
*inductive case*:
```
n = k + 1

IH: sum' k = k * (k + 1) / 2
Show: k + 1 = (k + 1) * ((k + 1) + 1) / 2 = (k + 1) * (k + 2) / 2

  sum' (k + 1)
= (k + 1) + sum' k
= k + 1 + k * (k + 1) / 2
= (k + 1) * (k + 2) / 2
```
*QED*

#### Structural Induction

**Setup**:
```ocaml
type nat =
  | Z
  | S of nat

let rec plus l r =
  match l with
  | Z -> r
  | S k -> S (plus k)
```

**Theorem**:
```
plus (S k) Z = S k
```

**Proof**:
*base case*:
```
  plus Z Z
= Z

```
*inductive case*:
```
  plus (S k) Z
= S (plus k Z)
= S k
```
*QED*
