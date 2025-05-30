MODULE SeqFileDemo;

IMPORT StrIO;
IMPORT TextIO;
IMPORT IOChan;
IMPORT StdChans;
IMPORT ChanConsts;
IMPORT SeqFile;
IMPORT WholeStr;

(* This module demonstrates basic channel operations in Modula-2. *)
(* The program opens a file channel, appends a string to it, and then closes the channel. *)
(* Build: gm2 ./SeqFileDemo -fiso -o seqFileDemo *)

PROCEDURE WriteToSeqFile();
(* This procedure appends a string to a file using the SeqFile module. *)
VAR
    cid : IOChan.ChanId;
    res : ChanConsts.OpenResults;
    buf: ARRAY [0..3] OF CHAR;    
BEGIN
    cid := StdChans.OutChan();
    SeqFile.OpenAppend(cid, 'test.txt', ChanConsts.text, res);
    IF res = ChanConsts.opened THEN
        TextIO.WriteString(cid, "Writing data to the channel.");
        TextIO.WriteLn(cid);
        TextIO.WriteString(cid, "Contents of a seq file are appended to the file.");
        TextIO.WriteLn(cid);
        SeqFile.Close(cid);
    ELSE
        StrIO.WriteString("Failed to open channel: ");
        WholeStr.CardToStr(ORD(res), buf);
        StrIO.WriteString(buf);
        StrIO.WriteLn();
    END;
END WriteToSeqFile;

BEGIN
    WriteToSeqFile();
END SeqFileDemo.