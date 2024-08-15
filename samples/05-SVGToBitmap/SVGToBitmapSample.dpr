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
/// File last update : 2024-08-12T11:31:28.000+02:00
/// Signature : 3ab9d389080704a623c40b78c7bb9b7cedd6c8d0
/// ***************************************************************************
/// </summary>

program SVGToBitmapSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  fMain in 'fMain.pas' {frmMain},
  USVGPuzzleAssets2 in '..\04-SVGFolder2DelphiUnit\USVGPuzzleAssets2.pas',
  Olf.Skia.SVGToBitmap in '..\..\lib-externes\librairies\src\Olf.Skia.SVGToBitmap.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
