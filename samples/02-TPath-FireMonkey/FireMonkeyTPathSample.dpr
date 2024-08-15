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
/// File last update : 2024-08-12T11:01:42.000+02:00
/// Signature : 141c16e81126ba1d43eafcd1efc7fb3098aaac17
/// ***************************************************************************
/// </summary>

program FireMonkeyTPathSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uBootstrapIcons in '..\..\lib-externes\Delphi-Bootstrap-Icons\uBootstrapIcons.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
