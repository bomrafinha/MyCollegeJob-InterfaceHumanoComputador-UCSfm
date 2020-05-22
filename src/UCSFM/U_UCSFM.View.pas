unit U_UCSFM.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, System.ImageList, FMX.ImgList, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Gestures, System.UIConsts, FMX.Effects, System.Actions,
  FMX.ActnList, U_Generic.View, U_Config.View, U_Feed.View, U_Playlist.View,
  U_Radio.View, U_Social.View;

type
  TFormMaster = class(TForm)
    LayoutMaser: TLayout;
    LayoutTopBar: TLayout;
    RectangleTitle: TRectangle;
    LayoutClient: TLayout;
    LayoutButtonBar: TLayout;
    RectangleButton01: TRectangle;
    RectangleButton02: TRectangle;
    RectangleButton03: TRectangle;
    RectangleButton04: TRectangle;
    RectangleButton05: TRectangle;
    LayoutTitle: TLayout;
    LayoutStatus: TLayout;
    RectangleStatus: TRectangle;
    Button03: TButton;
    ImageList1: TImageList;
    Button01: TButton;
    Button05: TButton;
    Button02: TButton;
    Button04: TButton;
    GestureManager1: TGestureManager;
    LayoutTitleLogo: TLayout;
    LayoutTitleText: TLayout;
    ImageLogoTitle: TImage;
    LineTop: TLine;
    LineBotton: TLine;
    ActionList1: TActionList;
    actUp: TAction;
    actDown: TAction;
    ImageLogoContent: TImage;
    RectangleContent: TRectangle;
    ImageTextTitle: TImage;
    LayoutContent: TLayout;
    ShadowEffect1: TShadowEffect;
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure Button01Click(Sender: TObject);
    procedure Button02Click(Sender: TObject);
    procedure Button03Click(Sender: TObject);
    procedure Button04Click(Sender: TObject);
    procedure Button05Click(Sender: TObject);
    procedure actUpExecute(Sender: TObject);
    procedure actDownExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImageLogoTitleClick(Sender: TObject);
    procedure ImageTextTitleClick(Sender: TObject);
  private
    const fTimeBar : Integer = 250;
    var
      fBar : Single;
      fButton : Single;
      fActiveForm : TGenericView;

    procedure screenPaint();
    procedure changeButtonColor(aButtonIndex : Integer);
    procedure changeForm(aButtonIndex : Integer);
    procedure formOpen(aForm : TComponentClass);
    procedure formFree();
    function isLandscape() : boolean;
    
  public
    { Public declarations }
  end;

var
  FormMaster: TFormMaster;

implementation

{$R *.fmx}

procedure TFormMaster.actUpExecute(Sender: TObject);
begin
  LayoutTopBar.AnimateFloat(
    'Margins.Top',
    -fBar,
    0.20,
    TAnimationType.InOut,
    TInterpolationType.Circular
  );

end;

procedure TFormMaster.actDownExecute(Sender: TObject);
begin
  LayoutTopBar.AnimateFloat(
    'Margins.Top',
    0,
    0.20,
    TAnimationType.InOut,
    TInterpolationType.Circular
  );

end;

procedure TFormMaster.Button01Click(Sender: TObject);
begin
  Self.changeButtonColor(0);
  Self.changeForm(0);

end;

procedure TFormMaster.Button05Click(Sender: TObject);
begin
  Self.changeButtonColor(4);
  Self.changeForm(4);

end;

procedure TFormMaster.Button03Click(Sender: TObject);
begin
  Self.changeButtonColor(2);
  Self.changeForm(2);

end;

procedure TFormMaster.Button02Click(Sender: TObject);
begin
  Self.changeButtonColor(1);
  Self.changeForm(1);

end;

procedure TFormMaster.Button04Click(Sender: TObject);
begin
  Self.changeButtonColor(3);
  Self.changeForm(3);

end;

procedure TFormMaster.changeButtonColor(aButtonIndex : Integer);
var
  corBtn01 : Cardinal;
  corBtn02 : Cardinal;
  corBtn03 : Cardinal;
  corBtn04 : Cardinal;
  corBtn05 : Cardinal;

begin
  corBtn01 := claBlack;
  corBtn02 := claBlack;
  corBtn03 := claBlack;
  corBtn04 := claBlack;
  corBtn05 := claBlack;

  case aButtonIndex of
    0: corBtn01 := claLightgray;
    1: corBtn02 := claLightgray;
    2: corBtn03 := claLightgray;
    3: corBtn04 := claLightgray;
    4: corBtn05 := claLightgray;
  end;

  Self.RectangleButton01.Fill.Color := corBtn01;
  Self.RectangleButton02.Fill.Color := corBtn02;
  Self.RectangleButton03.Fill.Color := corBtn03;
  Self.RectangleButton04.Fill.Color := corBtn04;
  Self.RectangleButton05.Fill.Color := corBtn05;
  Self.Button01.TintColor := corBtn01;
  Self.Button02.TintColor := corBtn02;
  Self.Button03.TintColor := corBtn03;
  Self.Button04.TintColor := corBtn04;
  Self.Button05.TintColor := corBtn05;

end;

procedure TFormMaster.changeForm(aButtonIndex: Integer);
begin
  ImageLogoContent.Visible := False;
  ImageLogoContent.Enabled := False;
  case aButtonIndex of
    0: formOpen(TPlaylistView);
    1: formOpen(TSocialView);
    2: formOpen(TRadioView);
    3: formOpen(TFeedView);
    4: formOpen(TConfigView);
  end;
end;

procedure TFormMaster.FormCreate(Sender: TObject);
begin
  fActiveForm := nil;

end;

procedure TFormMaster.formFree;
begin
  try
    fActiveForm.Close;
    fActiveForm.Free;
    Application.CreateForm(TGenericView, fActiveForm);
    fActiveForm.RectangleContent.Parent := Self.LayoutContent;
    ImageLogoContent.Enabled := True;
    ImageLogoContent.Visible := True;
    self.changeButtonColor(-1);
    LayoutContent.Repaint;

  except
    self.formFree();
  end;

end;

procedure TFormMaster.formOpen(aForm: TComponentClass);
begin
  try
    if (fActiveForm = nil) or (Assigned(fActiveForm) and
       (fActiveForm.ClassName <> aForm.ClassName)) then
    begin
      fActiveForm.Free;
      LayoutContent.Repaint;
      Application.CreateForm(aForm, fActiveForm);
      fActiveForm.RectangleContent.Parent := Self.LayoutContent;
    end else begin
      self.formFree();
    end;

  except
    self.formFree();
  end;

end;

procedure TFormMaster.FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  screenPaint();

end;

procedure TFormMaster.ImageLogoTitleClick(Sender: TObject);
begin
  self.formFree();

end;

procedure TFormMaster.ImageTextTitleClick(Sender: TObject);
begin
  self.formFree();

end;

function TFormMaster.isLandscape: boolean;
begin
  Result := False;
  if Screen.Size.Width > Height then
  begin
    Result := True;
  end;
end;

procedure TFormMaster.screenPaint;
var           
  ScreenSize: TSize;

begin
  // Pré configuração
  ScreenSize := Screen.Size;
  Self.fButton := ScreenSize.Width / 5;
  if Self.isLandscape then
  begin
    Self.fBar := ScreenSize.Height * 0.10;
  end else begin
    Self.fBar := ScreenSize.Height * 0.06;
  end;

  // Alturas
  Self.LayoutTopBar.Size.Height := Self.fBar;
  Self.LayoutButtonBar.Size.Height := Self.fBar;

  // Larguras
  Self.RectangleButton01.Size.Width := Self.fButton;
  Self.RectangleButton02.Size.Width := Self.fButton;
  Self.RectangleButton03.Size.Width := Self.fButton;
  Self.RectangleButton04.Size.Width := Self.fButton;
  Self.RectangleButton05.Size.Width := Self.fButton;
  Self.Button01.Size.Width := Self.Button01.Size.Height;
  Self.Button02.Size.Width := Self.Button02.Size.Height;
  Self.Button03.Size.Width := Self.Button03.Size.Height;
  Self.Button04.Size.Width := Self.Button04.Size.Height;
  Self.Button05.Size.Width := Self.Button05.Size.Height;
  Self.LayoutTitle.Size.Width := ScreenSize.Width * 0.6;
  Self.LayoutTitleLogo.Size.Width := Self.LayoutTitleLogo.Size.Height;


end;

end.
