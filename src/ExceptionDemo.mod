MODULE ExceptionDemo;

(* This module demonstrates the use of exceptions in Modula-2. *)
(* An exception is raised and handled. *)
(* Build: gm2 ./SeqFileDemo -fiso -o seqFileDemo *)


IMPORT EXCEPTIONS;
IMPORT StrIO;

VAR 
    source: EXCEPTIONS.ExceptionSource;

PROCEDURE IsExceptionDemoException(): BOOLEAN;
BEGIN
    RETURN EXCEPTIONS.IsCurrentSource(source);
END IsExceptionDemoException;

PROCEDURE TriggerException();
BEGIN
    EXCEPTIONS.RAISE(source, 0,"Raised a demo exception.");
END TriggerException;

PROCEDURE HandleException();
VAR 
    s : ARRAY [0..255] OF CHAR;
BEGIN
    TriggerException;
EXCEPT
    IF IsExceptionDemoException() THEN
        StrIO.WriteString("Caught an exception from ExceptionDemo:[");
        EXCEPTIONS.GetMessage(s);
        StrIO.WriteString(s);
        StrIO.WriteString("]");
        StrIO.WriteLn;
        (* The exception is handled if there's a RETURN.*)
        RETURN;
    ELSE
        StrIO.WriteString("Caught an unexpected exception: ");
        StrIO.WriteLn;
        RETURN;
    END;
END HandleException;

BEGIN
    EXCEPTIONS.AllocateSource(source);
    HandleException;
END ExceptionDemo.
