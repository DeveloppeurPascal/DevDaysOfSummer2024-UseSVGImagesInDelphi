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
/// File last update : 2024-08-12T11:46:58.000+02:00
/// Signature : d90cd1bc5d72e7b87d4735d56e95f24182db74ef
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
  FMX.ImgList,
  System.ImageList,
  FMX.SVGIconImageList;

type
  TfrmMain = class(TForm)
    SVGIconImageList1: TSVGIconImageList;
    Glyph1: TGlyph;
    GridPanelLayout1: TGridPanelLayout;
    btnFirst: TButton;
    btnPrevious: TButton;
    btnNext: TButton;
    btnLast: TButton;
    StyleBook1: TStyleBook;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
  private
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
  Glyph1.ImageIndex := 0;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  First;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  SVGIconImageList1.Width := round(Glyph1.Width);
  SVGIconImageList1.Height := round(Glyph1.Height);
end;

procedure TfrmMain.Last;
begin
  Glyph1.ImageIndex := SVGIconImageList1.Count - 1;
end;

procedure TfrmMain.Next;
begin
  if Glyph1.ImageIndex < SVGIconImageList1.Count - 1 then
    Glyph1.ImageIndex := Glyph1.ImageIndex + 1;
end;

procedure TfrmMain.Previous;
begin
  if Glyph1.ImageIndex > 0 then
    Glyph1.ImageIndex := Glyph1.ImageIndex - 1;
end;

end.
