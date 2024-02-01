let number = 1280

let rec frec x =
  let inner = 128 in
  if x < 2 then 2 else inner + frec (x - 1)

let rec fact x = if x <= 2 then 2 else x * fact (x - 1)
