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
/// File last update : 2024-08-12T11:35:16.000+02:00
/// Signature : 3f955601477998bef5cfaf1446436eee9757b043
/// ***************************************************************************
/// </summary>

unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    GridPanelLayout1: TGridPanelLayout;
    btnFirst: TButton;
    btnPrevious: TButton;
    btnNext: TButton;
    btnLast: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
  private
    FPathIndex: integer;
    function GetPathCount: integer;
    procedure SetPathIndex(const Value: integer);
  public
    property PathIndex: integer read FPathIndex write SetPathIndex;
    property PathCount: integer read GetPathCount;
    procedure First;
    procedure Last;
    procedure Previous;
    procedure Next;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  Olf.Skia.SVGToBitmap,
  USVGPuzzleAssets2;

procedure TfrmMain.btnFirstClick(Sender: TObject);
begin
  First;
end;

procedure TfrmMain.btnLastClick(Sender: TObject);
begin
  Last;
end;

procedure TfrmMain.btnNextClick(Sender: TObject);
begin
  Next;
end;

procedure TfrmMain.btnPreviousClick(Sender: TObject);
begin
  Previous;
end;

procedure TfrmMain.First;
begin
  PathIndex := 0;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  First;
end;

function TfrmMain.GetPathCount: integer;
begin
  result := TSVGPuzzleAssets2.Count;
end;

procedure TfrmMain.Last;
begin
  PathIndex := PathCount - 1;
end;

procedure TfrmMain.Next;
begin
  if PathIndex < PathCount - 1 then
    PathIndex := PathIndex + 1;
end;

procedure TfrmMain.Previous;
begin
  if PathIndex > 0 then
    PathIndex := PathIndex - 1;
end;

procedure TfrmMain.SetPathIndex(const Value: integer);
var
  bmp: tbitmap;
begin
  if (Value >= 0) and (Value < PathCount) then
  begin
    FPathIndex := Value;
    bmp := SVGToBitmap(round(Image1.Width), round(Image1.Height),
      TSVGPuzzleAssets2.SVG(FPathIndex), Image1.Bitmap.BitmapScale);
    try
      Image1.Bitmap.Assign(bmp);
    finally
      bmp.Free;
    end;
  end;
end;

end.
