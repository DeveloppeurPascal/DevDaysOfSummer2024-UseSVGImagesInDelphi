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
/// File last update : 2024-08-12T12:01:42.000+02:00
/// Signature : 0e6698b0f0948b375a92c96a851219ff9b62aca9
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
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    btnWithoutMargins: TButton;
    btnWithMargins: TButton;
    FlowLayout1: TFlowLayout;
    Image1: TImage;
    procedure btnWithoutMarginsClick(Sender: TObject);
    procedure btnWithMarginsClick(Sender: TObject);
  private
  protected
    procedure ShowSVGWithoutMargins;
    procedure ShowSVGWithMargins;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  USVGPuzzleAssets2,
  Olf.Skia.SVGToBitmap;

procedure TfrmMain.btnWithMarginsClick(Sender: TObject);
begin
  ShowSVGWithMargins;
end;

procedure TfrmMain.btnWithoutMarginsClick(Sender: TObject);
begin
  ShowSVGWithoutMargins;
end;

procedure TfrmMain.ShowSVGWithMargins;
var
  i: integer;
  bmp: TBitmap;
  img: TImage;
  MarginTop, MarginBottom, MarginLeft, MarginRight: single;
begin
  while FlowLayout1.ChildrenCount > 0 do
    FlowLayout1.Children[0].free;

  for i := 0 to TSVGPuzzleAssets2.Count - 1 do
  begin
    MarginTop := 0;
    MarginRight := 0;
    MarginBottom := 0;
    MarginLeft := 0;
    case TSVGPuzzleAssets2Index(i) of
      TSVGPuzzleAssets2Index.PipeDb:
        begin
          MarginTop := 100 * ((117.55 - 87.9) / 117.55);
          MarginLeft := 100 * ((117.55 - 88.05) / 117.55);
        end;
      TSVGPuzzleAssets2Index.PipeGb:
        begin
          MarginTop := 100 * ((117.55 - 88.05) / 117.55);
          MarginRight := 100 * ((117.55 - 87.9) / 117.55);
        end;
      TSVGPuzzleAssets2Index.PipeGd:
        begin
          MarginTop := 100 * ((117.55 - 58.6) / 117.55) / 2;
          MarginBottom := 100 * ((117.55 - 58.6) / 117.55) / 2;
        end;
      TSVGPuzzleAssets2Index.PipeGdb:
        MarginTop := 100 * ((117.55 - 88.05) / 117.55);
      TSVGPuzzleAssets2Index.PipeHb:
        begin
          MarginRight := 100 * ((117.55 - 58.6) / 117.55) / 2;
          MarginLeft := 100 * ((117.55 - 58.6) / 117.55) / 2;
        end;
      TSVGPuzzleAssets2Index.PipeHd:
        begin
          MarginBottom := 100 * ((117.55 - 87.9) / 117.55);
          MarginLeft := 100 * ((117.55 - 88.05) / 117.55);
        end;
      TSVGPuzzleAssets2Index.PipeHdb:
        MarginLeft := 100 * ((117.55 - 88.05) / 117.55);
      TSVGPuzzleAssets2Index.PipeHg:
        begin
          MarginRight := 100 * ((117.55 - 87.9) / 117.55);
          MarginBottom := 100 * ((117.55 - 88.05) / 117.55);
        end;
      TSVGPuzzleAssets2Index.PipeHgb:
        MarginRight := 100 * ((117.55 - 87.9) / 117.55);
      TSVGPuzzleAssets2Index.PipeHgd:
        MarginBottom := 100 * ((117.55 - 87.9) / 117.55);
    end;

    img := TImage.Create(self);
    img.Parent := FlowLayout1;
    img.Width := 64;
    img.Height := img.Width;
    bmp := SVGToBitmap(round(img.Width), round(img.Height),
      TSVGPuzzleAssets2.SVG(i), Image1.Bitmap.BitmapScale, MarginTop,
      MarginRight, MarginBottom, MarginLeft);
    try
      img.Bitmap.Assign(bmp);
    finally
      bmp.free;
    end;
  end;
end;

procedure TfrmMain.ShowSVGWithoutMargins;
var
  i: integer;
  bmp: TBitmap;
  img: TImage;
begin
  while FlowLayout1.ChildrenCount > 0 do
    FlowLayout1.Children[0].free;

  for i := 0 to TSVGPuzzleAssets2.Count - 1 do
  begin
    img := TImage.Create(self);
    img.Parent := FlowLayout1;
    img.Width := 64;
    img.Height := img.Width;
    bmp := SVGToBitmap(round(img.Width), round(img.Height),
      TSVGPuzzleAssets2.SVG(i), Image1.Bitmap.BitmapScale);
    try
      img.Bitmap.Assign(bmp);
    finally
      bmp.free;
    end;
  end;
end;

end.
