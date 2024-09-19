(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Lacia`File`batchCopy`"];


Needs["Lacia`File`"];


(* ::Section:: *)
(*Public*)


batchCopy::usage =
    "batch copy from file list.";


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Main*)


batchCopy[fileList_List] :=
    fileList//Scan[
        CopyFile[
            #,
            FileNameJoin@{$HomeDirectory,"Downloads",FileNameTake@#}
        ]&
    ];


(* ::Subsection:: *)
(*Helper*)



(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
