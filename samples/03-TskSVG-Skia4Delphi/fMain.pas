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
/// File last update : 2024-08-12T11:21:40.000+02:00
/// Signature : cf8a94d5b0edb7ed72e3fca07caf72904228adad
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
  System.Skia,
  FMX.Skia,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts;

type
  TfrmMain = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    btnFirst: TButton;
    btnPrevious: TButton;
    btnNext: TButton;
    btnLast: TButton;
    SkSvg1: TSkSvg;
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  uFeatherIcons;

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
  result := length(FeatherIconsArray);
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
begin
  if (Value >= 0) and (Value < PathCount) then
  begin
    FPathIndex := Value;
    SkSvg1.Svg.Source := FeatherIconsArray[FPathIndex].Svg;
  end;
end;

end.
