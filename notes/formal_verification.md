
# Formal Verification

Definition: a process for mathematcally verifying program correctness with respect to specification.
here by `specification` we mean formal specification not comments and docs.

### Eequality of expressions
Example1:
	41 + 1 = 40 + 2 = 42

Example2:
	f = (fun x -> x) ; f' = (fun y -> y)
	f = f'
	here we read `for all v . f v = f' v`
