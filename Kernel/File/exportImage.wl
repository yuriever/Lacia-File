(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Lacia`File`exportImage`"];


Needs["Lacia`File`"];


(* ::Section:: *)
(*Public*)


exportImage::usage =
    "export images: SVG with adjustable size.";


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Main*)


exportImage//Options =
    Options@ExportString;

exportImage[imagePath_,opts:OptionsPattern[]][image_] :=
    Module[ {format},
        format =
            First@FileNameToFormatList@imagePath;
        Switch[format,
            "SVG",
                exportSVG["SVG",imagePath,image,opts],
            _,
                Export[imagePath,image,format,opts]
        ]
    ];


(* ::Subsection:: *)
(*Helper*)


exportSVG["SVG",imagePath_,image_,opts:OptionsPattern[]] :=
    Module[ {imageString},
        imageString =
            ExportString[image,"SVG",opts]//removeSizeInfoInSVGString;
        If[ !FileExistsQ@imagePath,
            CreateFile@imagePath
        ];
        (*OpenWrite will overwrite the existing data.*)
        OpenWrite@imagePath;
        WriteString[imagePath,imageString];
        Close@imagePath;
        imagePath
    ];


removeSizeInfoInSVGString[string_] :=
    string//StringSplit[#,"\n",3]&//
        MapAt[removeSizeInfoInString,2]//
            StringRiffle[#,"\n"]&;


removeSizeInfoInString[string_] :=
    StringReplace[
        string,
        "width="~~Shortest[__]~~" viewBox":>"viewBox"
    ];


(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
