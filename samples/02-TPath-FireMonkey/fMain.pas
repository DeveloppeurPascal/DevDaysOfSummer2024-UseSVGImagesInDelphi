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
/// File last update : 2024-08-12T11:12:18.000+02:00
/// Signature : 2d6a05f085f5cab5b06f65fcbb95e3a997a4e3ef
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
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Objects;

type
  TfrmMain = class(TForm)
    Path1: TPath;
    GridPanelLayout1: TGridPanelLayout;
    btnFirst: TButton;
    btnPrevious: TButton;
    btnNext: TButton;
    btnLast: TButton;
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPathIndex: integer;
    procedure SetPathIndex(const Value: integer);
    function GetPathCount: integer;
  protected
    property PathIndex: integer read FPathIndex write SetPathIndex;
    property PathCount: integer read GetPathCount;
    procedure First;
    procedure Last;
    procedure Previous;
    procedure Next;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  uBootstrapIcons;

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
  result := length(BootstrapIconsArray);
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
    Path1.Data.Data := GetBootstrapIconPathData
      (BootstrapIconsArray[FPathIndex].name);
  end;
end;

end.
