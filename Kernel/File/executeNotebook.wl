(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Lacia`File`executeNotebook`"];


Needs["Lacia`File`"];


(* ::Section:: *)
(*Public*)


executeNotebook::usage =
    "NotebookOpen + FrontEndExecute.";


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Main*)


executeNotebook//Options =
    Options@NotebookOpen;

executeNotebook[nbPath_,opts:OptionsPattern[]] :=
    Module[ {nb},
        nb =
            NotebookOpen[
                nbPath,
                FilterRules[{opts,Options@executeNotebook},Options@NotebookOpen]
            ];
        FrontEndExecute@FrontEndToken[nb,"SelectAll"];
        FrontEndExecute@FrontEndToken[nb,"Evaluate"];
    ];


(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
