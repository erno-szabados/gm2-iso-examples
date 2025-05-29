IMPLEMENTATION MODULE BitSetExample;

(* GNU ISO Modula-2 Example for bitwise operations.*)

FROM SYSTEM IMPORT SHIFT, ROTATE;
FROM StrIO IMPORT WriteString, WriteLn;
FROM WholeStr IMPORT CardToStr, IntToStr;
FROM NumberIO IMPORT WriteBin;

PROCEDURE PrintHexBytes(buf: ARRAY OF CHAR; count: CARDINAL);
VAR
  i: CARDINAL;
  str: ARRAY [0..7] OF CHAR;
BEGIN
  IF count = 0 THEN RETURN END;
  IF count > LENGTH(buf) THEN count := LENGTH(buf); END;
  FOR i := 0 TO count-1 DO
    IF i > 0 THEN WriteString(" "); END;
    WriteString("0x");
    IF ORD(buf[i]) < 16 THEN WriteString("0"); END;
    IntToStr(ORD(buf[i]), str); WriteString(str);
  END;
END PrintHexBytes;


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
  andResult, orResult, notResult, xorResult: BITSET;
  shiftLeftResult, shiftRightResult, rotateLeftResult, rotateRightResult : BITSET;
  output: ARRAY [0..15] OF CHAR;
  intbuf: ARRAY [0..7] OF CHAR;
BEGIN
  (* Initialize set1: Bits 0, 2, 4 are set (binary 00010101b) *)
  set1 := {0, 2, 4};

  (* Initialize set2: Bits 2, 3, 4 are set (binary 00011100b) *)
  set2 := {2, 3, 4};

  (* Perform bitwise AND using the set intersection operator '*' *)
  (* Result: Bits 2, 4 are set (binary 00010100b) *)
  andResult := set1 * set2; (* Result: Bits 0, 2, 3, 4 are set (binary 00011101b) *)
  orResult := set1 + set2; 
  notResult := - set1;
  xorResult := set1 / set2;
  shiftLeftResult := SHIFT(set1,1);
  shiftRightResult := SHIFT(set1,-1);
  rotateLeftResult := ROTATE(set1,1);
  rotateRightResult := ROTATE(set1,-1);
  
  (* Print the results *)
  WriteString("A       ["); WriteBin(VAL(CARDINAL, set1),32); WriteString("]"); WriteLn;
  WriteString("B       ["); WriteBin(VAL(CARDINAL, set2),32); WriteString("]"); WriteLn;
  WriteString("A AND B ["); WriteBin(VAL(CARDINAL, andResult),32); WriteString("]"); WriteLn;
  WriteString("A OR  B ["); WriteBin(VAL(CARDINAL, orResult),32); WriteString("]"); WriteLn;
  WriteString("NOT A   ["); WriteBin(VAL(CARDINAL, notResult),32); WriteString("]"); WriteLn;
  WriteString("A XOR B ["); WriteBin(VAL(CARDINAL, xorResult),32); WriteString("]"); WriteLn;
  WriteString("SHL A   ["); WriteBin(VAL(CARDINAL, shiftLeftResult),32); WriteString("]"); WriteLn;
  WriteString("SHR A   ["); WriteBin(VAL(CARDINAL, shiftRightResult),32); WriteString("]"); WriteLn;
  WriteString("ROL A   ["); WriteBin(VAL(CARDINAL, rotateLeftResult),32); WriteString("]"); WriteLn;
  WriteString("ROR A   ["); WriteBin(VAL(CARDINAL, rotateRightResult),32); WriteString("]"); WriteLn;


  WriteLn;
END TestBitSet;

BEGIN
  TestBitSet();
END BitSetExample.

