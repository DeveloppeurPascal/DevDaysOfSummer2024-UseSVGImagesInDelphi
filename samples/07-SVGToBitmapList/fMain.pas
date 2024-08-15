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
/// File last update : 2024-08-12T12:21:36.000+02:00
/// Signature : 4476b5399f103ff51a958767a2ce5cadee72f679
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
    FlowLayout1: TFlowLayout;
    Image1: TImage;
    GridPanelLayout1: TGridPanelLayout;
    btnAddPuzzleAssets2: TButton;
    btnAddInputPrompts: TButton;
    btnAddPictogrammersCom: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddInputPromptsClick(Sender: TObject);
    procedure btnAddPuzzleAssets2Click(Sender: TObject);
    procedure btnAddPictogrammersComClick(Sender: TObject);
  private
  protected
    procedure AddPuzzleAssets2Images;
    procedure AddInputPromptsImages;
    procedure AddPictogrammersComImages;
    procedure RegisterSVG;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  Olf.Skia.SVGToBitmap,
  USVGInputPrompts,
  USVGPictogrammersCom,
  USVGPuzzleAssets2;

procedure TfrmMain.AddInputPromptsImages;
var
  i: integer;
  img: TImage;
begin
  for i := 0 to TSVGInputPrompts.Count - 1 do
  begin
    img := TImage.Create(self);
    img.Parent := FlowLayout1;
    img.Width := 64;
    img.Height := img.Width;
    img.Bitmap.Assign(TOlfSVGBitmapList.Bitmap(TSVGInputPrompts.tag + i,
      round(img.Width), round(img.Height), Image1.Bitmap.BitmapScale));
  end;
end;

procedure TfrmMain.btnAddPictogrammersComClick(Sender: TObject);
begin
  AddPictogrammersComImages;
end;

procedure TfrmMain.AddPictogrammersComImages;
var
  i: integer;
  img: TImage;
begin
  for i := 0 to TSVGPictogrammersCom.Count - 1 do
  begin
    img := TImage.Create(self);
    img.Parent := FlowLayout1;
    img.Width := 64;
    img.Height := img.Width;
    img.Bitmap.Assign(TOlfSVGBitmapList.Bitmap(TSVGPictogrammersCom.tag + i,
      round(img.Width), round(img.Height), Image1.Bitmap.BitmapScale));
  end;
end;

procedure TfrmMain.AddPuzzleAssets2Images;
var
  i: integer;
  img: TImage;
  MarginTop, MarginBottom, MarginLeft, MarginRight: single;
begin
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
    img.Bitmap.Assign(TOlfSVGBitmapList.Bitmap(TSVGPuzzleAssets2.tag + i,
      round(img.Width), round(img.Height), MarginTop, MarginRight, MarginBottom,
      MarginLeft, Image1.Bitmap.BitmapScale));
  end;
end;

procedure TfrmMain.btnAddInputPromptsClick(Sender: TObject);
begin
  AddInputPromptsImages;
end;

procedure TfrmMain.btnAddPuzzleAssets2Click(Sender: TObject);
begin
  AddPuzzleAssets2Images;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  RegisterSVG;
end;

procedure TfrmMain.RegisterSVG;
begin
  TSVGPuzzleAssets2.tag := TOlfSVGBitmapList.AddItem(SVGPuzzleAssets2);
  TSVGPictogrammersCom.tag := TOlfSVGBitmapList.AddItem(SVGPictogrammersCom);
  TSVGInputPrompts.tag := TOlfSVGBitmapList.AddItem(SVGInputPrompts);
end;

end.
