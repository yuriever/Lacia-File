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
    Module[ {i},
        Monitor[
            Do[
                Pause[pause];
                URLDownload[
                    StringTemplate[urlTemplate][i],
                    FileNameJoin@{$HomeDirectory,"Downloads",StringTemplate[fileNameTemplate][i]}
                ],
                {i,range}
            ],
            ProgressIndicator[i,{0,Length@range}]
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
