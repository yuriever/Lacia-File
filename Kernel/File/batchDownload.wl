(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Lacia`File`batchDownload`"];


Needs["Lacia`File`"];


(* ::Section:: *)
(*Public*)


batchDownload::usage =
    "batch download from url template.";


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Main*)


batchDownload[urlTemplate_String,fileNameTemplate_String,range_List,pause_:0.5] :=
    Module[ {element,counter=0},
        Monitor[
            Do[
                Pause[pause];
                counter=counter+1;
                URLDownload[
                    StringTemplate[urlTemplate][element],
                    FileNameJoin@{$HomeDirectory,"Downloads",StringTemplate[fileNameTemplate][element]}
                ],
                {element,range}
            ],
            ProgressIndicator[counter,{0,Length@range}]
        ]
    ];


(* ::Subsection:: *)
(*Helper*)



(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
