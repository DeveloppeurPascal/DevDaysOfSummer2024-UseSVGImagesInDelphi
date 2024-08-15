/// <summary>
/// ***************************************************************************
///
/// Use SVG images in Delphi - Dev Days of Summer 2024
///
/// Copyright 2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Samples projects for the "Use SVG images in Delphi" talk at <Dev Days of
/// Summer> 2024 online conference.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://serialstreameur.fr/use-svg-images-in-delphi.html
///
/// Project site :
/// https://github.com/DeveloppeurPascal/DevDaysOfSummer2024-UseSVGImagesInDelphi
///
/// ***************************************************************************
/// File last update : 2024-08-12T11:30:18.000+02:00
/// Signature : 6a4ffff38651c23a4ac4c0fca9b1690d94c522d8
/// ***************************************************************************
/// </summary>

unit USVGPictogrammersCom;

// ****************************************
// * SVG from folder :
// * ..\..\assets\Pictogrammers_com
// ****************************************
//
// This file contains a list of contants and 
// an enumeration to access to SVG source codes 
// from the generated array of strings.
//
// ****************************************
// File generator : SVG Folder to Delphi Unit v1.0
// Website : https://svgfolder2delphiunit.olfsoftware.fr/
// Generation date : 2024-08-12T11:23:42.963Z
//
// Don't do any change on this file.
// They will be erased by next generation !
// ****************************************

interface

const
  CSVGAxeBattle = 0;
  CSVGBomb = 1;
  CSVGCards = 2;
  CSVGCardsClub = 3;
  CSVGCardsDiamond = 4;
  CSVGCardsHeart = 5;
  CSVGCardsSpade = 6;

type
{$SCOPEDENUMS ON}
  TSVGPictogrammersComIndex = (
    AxeBattle = CSVGAxeBattle,
    Bomb = CSVGBomb,
    Cards = CSVGCards,
    CardsClub = CSVGCardsClub,
    CardsDiamond = CSVGCardsDiamond,
    CardsHeart = CSVGCardsHeart,
    CardsSpade = CSVGCardsSpade);

  TSVGPictogrammersCom = class
  private
  class var
    FTag: integer;
    FTagBool: Boolean;
    FTagFloat: Single;
    FTagObject: TObject;
    FTagString: string;
    class procedure SetTag(const Value: integer); static;
    class procedure SetTagBool(const Value: Boolean); static;
    class procedure SetTagFloat(const Value: Single); static;
    class procedure SetTagObject(const Value: TObject); static;
    class procedure SetTagString(const Value: string); static;
  public const
    AxeBattle = CSVGAxeBattle;
    Bomb = CSVGBomb;
    Cards = CSVGCards;
    CardsClub = CSVGCardsClub;
    CardsDiamond = CSVGCardsDiamond;
    CardsHeart = CSVGCardsHeart;
    CardsSpade = CSVGCardsSpade;
    class property Tag: integer read FTag write SetTag;
    class property TagBool: Boolean read FTagBool write SetTagBool;
    class property TagFloat: Single read FTagFloat write SetTagFloat;
    class property TagObject: TObject read FTagObject write SetTagObject;
    class property TagString: string read FTagString write SetTagString;
    class function SVG(const Index: Integer): string; overload;
    class function SVG(const Index: TSVGPictogrammersComIndex) : string; overload;
    class function Count : Integer;
    class constructor Create;
  end;

var
  SVGPictogrammersCom : array of String;

implementation

uses
  System.SysUtils;

{ TSVGPictogrammersCom }

class constructor TSVGPictogrammersCom.Create;
begin
  inherited;
  FTag := 0;
  FTagBool := false;
  FTagFloat := 0;
  FTagObject := nil;
  FTagString := '';
end;

class procedure TSVGPictogrammersCom.SetTag(const Value: integer);
begin
  FTag := Value;
end;

class procedure TSVGPictogrammersCom.SetTagBool(const Value: Boolean);
begin
  FTagBool := Value;
end;

class procedure TSVGPictogrammersCom.SetTagFloat(const Value: Single);
begin
  FTagFloat := Value;
end;

class procedure TSVGPictogrammersCom.SetTagObject(const Value: TObject);
begin
  FTagObject := Value;
end;

class procedure TSVGPictogrammersCom.SetTagString(const Value: string);
begin
  FTagString := Value;
end;

class function TSVGPictogrammersCom.SVG(const Index: Integer): string;
begin
  if (index < Count) then
    result := SVGPictogrammersCom[index]
  else
    raise Exception.Create('SVG not found. Index out of range.');
end;

class function TSVGPictogrammersCom.SVG(const Index : TSVGPictogrammersComIndex): string;
begin
  result := SVG(ord(index));
end;

class function TSVGPictogrammersCom.Count: Integer;
begin
  result := length(SVGPictogrammersCom);
end;

initialization

SetLength(SVGPictogrammersCom, 7);

{$TEXTBLOCK NATIVE XML}
SVGPictogrammersCom[CSVGAxeBattle] := '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.47 12.43C19.35 14.55 15.82 13.84 15.82 13.84V9.6L3.41 22L2 20.59L14.4 8.18H10.16C10.16 8.18 9.45 4.65 11.57 2.53C13.69 .406 17.23 1.11 17.23 1.11V5.36L17.94 4.65L19.35 6.06L18.64 6.77H22.89C22.89 6.77 23.59 10.31 21.47 12.43Z" /></svg>
''';
SVGPictogrammersCom[CSVGBomb] := '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M11.25,6A3.25,3.25 0 0,1 14.5,2.75A3.25,3.25 0 0,1 17.75,6C17.75,6.42 18.08,6.75 18.5,6.75C18.92,6.75 19.25,6.42 19.25,6V5.25H20.75V6A2.25,2.25 0 0,1 18.5,8.25A2.25,2.25 0 0,1 16.25,6A1.75,1.75 0 0,0 14.5,4.25A1.75,1.75 0 0,0 12.75,6H14V7.29C16.89,8.15 19,10.83 19,14A7,7 0 0,1 12,21A7,7 0 0,1 5,14C5,10.83 7.11,8.15 10,7.29V6H11.25M22,6H24V7H22V6M19,4V2H20V4H19M20.91,4.38L22.33,2.96L23.04,3.67L21.62,5.09L20.91,4.38Z" /></svg>
''';
SVGPictogrammersCom[CSVGCards] := '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.47,4.35L20.13,3.79V12.82L22.56,6.96C22.97,5.94 22.5,4.77 21.47,4.35M1.97,8.05L6.93,20C7.24,20.77 7.97,21.24 8.74,21.26C9,21.26 9.27,21.21 9.53,21.1L16.9,18.05C17.65,17.74 18.11,17 18.13,16.26C18.14,16 18.09,15.71 18,15.45L13,3.5C12.71,2.73 11.97,2.26 11.19,2.25C10.93,2.25 10.67,2.31 10.42,2.4L3.06,5.45C2.04,5.87 1.55,7.04 1.97,8.05M18.12,4.25A2,2 0 0,0 16.12,2.25H14.67L18.12,10.59" /></svg>
''';
SVGPictogrammersCom[CSVGCardsClub] := '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,2C14.3,2 16.3,4 16.3,6.2C16.21,8.77 14.34,9.83 14.04,10C15.04,9.5 16.5,9.5 16.5,9.5C19,9.5 21,11.3 21,13.8C21,16.3 19,18 16.5,18C16.5,18 15,18 13,17C13,17 12.7,19 15,22H9C11.3,19 11,17 11,17C9,18 7.5,18 7.5,18C5,18 3,16.3 3,13.8C3,11.3 5,9.5 7.5,9.5C7.5,9.5 8.96,9.5 9.96,10C9.66,9.83 7.79,8.77 7.7,6.2C7.7,4 9.7,2 12,2Z" /></svg>
''';
SVGPictogrammersCom[CSVGCardsDiamond] := '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M19,12L12,22L5,12L12,2" /></svg>
''';
SVGPictogrammersCom[CSVGCardsHeart] := '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z" /></svg>
''';
SVGPictogrammersCom[CSVGCardsSpade] := '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,2C9,7 4,9 4,14C4,16 6,18 8,18C9,18 10,18 11,17C11,17 11.32,19 9,22H15C13,19 13,17 13,17C14,18 15,18 16,18C18,18 20,16 20,14C20,9 15,7 12,2Z" /></svg>
''';

end.
