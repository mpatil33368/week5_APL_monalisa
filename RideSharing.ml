(* ride_sharing_statistics.ml *)

let mean lst =
  let sum = List.fold_left ( +. ) 0.0 (List.map float_of_int lst) in
  sum /. float_of_int (List.length lst)

let median lst =
  let sorted = List.sort compare lst in
  let n = List.length sorted in
  if n mod 2 = 0 then
    let mid1 = List.nth sorted (n/2 - 1) in
    let mid2 = List.nth sorted (n/2) in
    (float_of_int (mid1 + mid2)) /. 2.0
  else
    float_of_int (List.nth sorted (n/2))

let mode lst =
  let count_map = List.fold_left (fun acc x ->
      if List.mem_assoc x acc then
        (x, (List.assoc x acc) + 1) :: (List.remove_assoc x acc)
      else
        (x, 1) :: acc
    ) [] lst in
  let max_count = List.fold_left (fun acc (_, count) -> max acc count) 0 count_map in
  List.filter (fun (_, count) -> count = max_count) count_map
  |> List.map fst

(* Test the functions *)
let () =
  let lst = [2; 3; 2; 5; 3; 4; 2; 5; 5] in
  Printf.printf "Mean: %.2f\n" (mean lst);
  Printf.printf "Median: %.2f\n" (median lst);
  Printf.printf "Mode(s): ";
  List.iter (fun x -> Printf.printf "%d " x) (mode lst);
  print_endline ""
