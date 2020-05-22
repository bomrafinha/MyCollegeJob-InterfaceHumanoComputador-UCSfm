unit U_Generic.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, System.ImageList, FMX.ImgList;

type
  TGenericView = class(TForm)
    RectangleContent: TRectangle;
    VertScrollBoxContent: TVertScrollBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure screenPaint(); Virtual; Abstract;

  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TGenericView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

end;

end.
