IMPLEMENTATION MODULE StreamFileDemo;

IMPORT StrIO;
IMPORT TextIO;
IMPORT IOChan;
IMPORT StdChans;
IMPORT ChanConsts;
IMPORT StreamFile;
IMPORT WholeStr;

(* This module demonstrates basic channel operations in Modula-2. *)
(* The program opens a file channel, writes a string to it, and then closes the channel. *)

PROCEDURE WriteToStreamFile();
(* This procedure writes a string to a file using the StreamFile module. *)
VAR
    cid : IOChan.ChanId;
    res : ChanConsts.OpenResults;
    buf: ARRAY [0..3] OF CHAR;    
BEGIN
    cid := StdChans.OutChan();
    StreamFile.Open(cid, 'test.txt', ChanConsts.write + ChanConsts.text, res);
    IF res = ChanConsts.opened THEN
        TextIO.WriteString(cid, "Writing data to the channel.");
        TextIO.WriteLn(cid);
        TextIO.WriteString(cid, "Contents of a stream file are overwritten each time the file is opened.");
        TextIO.WriteLn(cid);
        StreamFile.Close(cid);
    ELSE
        StrIO.WriteString("Failed to open channel: ");
        WholeStr.CardToStr(ORD(res), buf);
        StrIO.WriteString(buf);
        StrIO.WriteLn();
    END;
END WriteToStreamFile;

BEGIN
    WriteToStreamFile();
END StreamFileDemo.