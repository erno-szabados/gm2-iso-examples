IMPLEMENTATION MODULE BitSetExample;

(* GNU ISO Modula-2 Example for bitwise operations.*)

FROM StrIO IMPORT WriteString, WriteLn;
FROM WholeStr IMPORT CardToStr;

PROCEDURE TestBitSet();
(*
0,2,4
2,3,4
0b00010101 = 0x15 = 21
0b00011100 = 0x1C = 28
0b00010100 = 0x14 = 20   ; &
0b00011101 = 0x0D =  29   ; | 
*)
VAR
  set1: BITSET;
  set2: BITSET;
  andResult, orResult: BITSET;
  output: ARRAY [0..15] OF CHAR;
BEGIN
  (* Initialize set1: Bits 0, 2, 4 are set (binary 00010101b) *)
  set1 := {0, 2, 4};

  (* Initialize set2: Bits 2, 3, 4 are set (binary 00011100b) *)
  set2 := {2, 3, 4};

  (* Perform bitwise AND using the set intersection operator '*' *)
  (* Result: Bits 2, 4 are set (binary 00010100b) *)
  andResult := set1 * set2; (* Result: Bits 0, 2, 3, 4 are set (binary 00011101b) *)
  orResult := set1 + set2; 

  (* Print the results *)
  CardToStr(CARDINAL(orResult), output);
  WriteString(output);
  WriteLn;
END TestBitSet;

BEGIN
  TestBitSet();
END BitSetExample.

