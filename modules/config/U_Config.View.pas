unit U_Config.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_Generic.View, System.ImageList, FMX.ImgList, FMX.Layouts, FMX.Objects,
  FMX.Effects;

type
  TConfigView = class(TGenericView)
    Layout1: TLayout;
    Layout2: TLayout;
    Image1: TImage;
    Text1: TText;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
