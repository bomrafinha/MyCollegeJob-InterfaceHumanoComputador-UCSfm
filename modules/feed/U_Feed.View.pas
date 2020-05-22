unit U_Feed.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_Generic.View, System.ImageList, FMX.ImgList, FMX.Layouts, FMX.Objects,
  FMX.Effects;

type
  TFeedView = class(TGenericView)
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    Layout1: TLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Text1: TText;
    Text2: TText;
    Text4: TText;
    Text3: TText;
    Rectangle2: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Image5: TImage;
    Layout10: TLayout;
    Text5: TText;
    Layout11: TLayout;
    Text6: TText;
    Layout12: TLayout;
    Layout13: TLayout;
    Text7: TText;
    Text8: TText;
    Layout14: TLayout;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Rectangle3: TRectangle;
    Layout15: TLayout;
    Layout16: TLayout;
    Image9: TImage;
    Layout17: TLayout;
    Text9: TText;
    Layout18: TLayout;
    Text10: TText;
    Layout19: TLayout;
    Layout20: TLayout;
    Text11: TText;
    Text12: TText;
    Layout21: TLayout;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Rectangle4: TRectangle;
    Layout22: TLayout;
    Layout23: TLayout;
    Image13: TImage;
    Layout24: TLayout;
    Text13: TText;
    Layout25: TLayout;
    Text14: TText;
    Layout26: TLayout;
    Layout27: TLayout;
    Text15: TText;
    Text16: TText;
    Layout28: TLayout;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Rectangle5: TRectangle;
    Layout29: TLayout;
    Layout30: TLayout;
    Image17: TImage;
    Layout31: TLayout;
    Text17: TText;
    Layout32: TLayout;
    Text18: TText;
    Layout33: TLayout;
    Layout34: TLayout;
    Text19: TText;
    Text20: TText;
    Layout35: TLayout;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    procedure VertScrollBoxContentViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFeedView.VertScrollBoxContentViewportPositionChange(Sender: TObject;
  const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
begin
  inherited;
  Self.ShadowEffect1.UpdateParentEffects;

end;

end.
