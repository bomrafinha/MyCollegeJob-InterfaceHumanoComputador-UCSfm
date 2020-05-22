unit U_Radio.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  U_Generic.View, System.ImageList, FMX.ImgList, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation, System.Actions, FMX.ActnList, FMX.Gestures;

type
  TRetangulo = class(TRectangle)
  private
    var
      fPosicao : Integer;

  public
    property Posicao : Integer read fPosicao write fPosicao;

  end;

  TRadioView = class(TGenericView)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Timer1: TTimer;
    ImageList1: TImageList;
    Glyph1: TGlyph;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Text2: TText;
    Text1: TText;
    Text3: TText;
    Image1: TImage;
    Rectangle1: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
  private
    const
      fLargura : Integer = 5;

    var
      fCor : Cardinal;
      fCorBorda : Cardinal;
      fRaio : Integer;
      fQtdRet : Integer;
      fNomes : TStringList;

    procedure criaRetangulo(posicao, posX, altura : integer); Overload;
    procedure criaRetangulo(nome : String; altura : integer); Overload;
    procedure preencheTela();
    procedure mudaTamanhoRetangulo();

  public
    { Public declarations }
  end;

var
  RadioView: TRadioView;

implementation

{$R *.fmx}

{ TRadioView }

procedure TRadioView.criaRetangulo(posicao, posX, altura: integer);
var
  retangulo : TRetangulo;

begin
  retangulo := TRetangulo.Create(Layout4);
  retangulo.Fill.Color := fCor;
  retangulo.Stroke.Color := fCorBorda;
  retangulo.Height := altura;
  retangulo.Position.X := posX;
  retangulo.Position.Y := Layout4.Height - altura;
  retangulo.Width := fLargura;
  retangulo.XRadius := fRaio;
  retangulo.YRadius := fRaio;
  retangulo.Name := 'Ret' + posX.ToString;
  retangulo.Posicao := posicao;
  Layout4.AddObject(retangulo);

end;

procedure TRadioView.criaRetangulo(nome: String; altura: integer);
var
  ret : TRetangulo;

begin
  ret := TRetangulo(Layout4.FindComponent(nome));
  ret.Fill.Color := fCor;
  ret.Height := altura;
  ret.Position.Y := Layout4.Height - altura;

end;

procedure TRadioView.FormCreate(Sender: TObject);
var
  I: Integer;
  ScreenSize: TSize;

begin
  inherited;
  ScreenSize := Screen.Size;
  Layout4.Size.width := Screen.Size.width - 50;
  Rectangle1.Size.width := Rectangle1.Size.height;
  fNomes := TStringList.Create();
  fNomes.Clear;

  fCor := TAlphaColors.Aqua;
  fCorBorda := TAlphaColors.Black;
  fQtdRet := trunc(Layout4.size.width / fLargura);
  fRaio := 0;

  for I := 0 to Layout4.ControlsCount - 1 do
  begin
    fNomes.Add(Layout4.Controls[I].Name);
  end;

  preencheTela();

end;

procedure TRadioView.mudaTamanhoRetangulo;
var
  tempRet : TRetangulo;
  I: Integer;
  tamanho : Integer;
  tamanhoMaximo : Integer;

begin
  Randomize;
  tamanhoMaximo := trunc(Layout4.Size.height);

  for I := 0 to Layout4.ControlsCount - 1 do
  begin
    repeat
      tamanho := Random(tamanhoMaximo) + 10
    until ((tamanho mod 5) = 0);

    tempRet := TRetangulo(Layout4.FindComponent(Layout4.Controls[I].Name));

    tempRet.Height := tamanho;
    tempRet.Position.Y := Layout4.Height - tamanho;
    tempRet.Posicao := I - 1;
    tempRet.repaint;
  end;
  Layout4.repaint;

end;

procedure TRadioView.preencheTela;
var
  posX : Integer;
  tamanho : Integer;
  tamanhoMaximo : Integer;
  i : Integer;

begin
  Randomize;
  tamanhoMaximo := trunc(Layout4.Size.height);

  if fNomes.Count <= 0 then
  begin
    posX := 0;
    for i := 1 to fQtdRet do
    begin
      repeat
        tamanho := Random(tamanhoMaximo) + 10
      until ((tamanho mod 5) = 0);

      criaRetangulo(i - 1, posX, tamanho);
      inc(posX, fLargura);
    end;
  end else begin
    for i := 0 to fNomes.Count - 1 do
    begin
      repeat
        tamanho := Random(tamanhoMaximo) + 10
      until ((tamanho mod 5) = 0);

      criaRetangulo(fNomes.Strings[i], tamanho);
    end;

  end;

end;

procedure TRadioView.Rectangle1Click(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := not Timer1.Enabled;
  if Timer1.Enabled then
  begin
    Glyph1.ImageIndex := 1;
  end else begin
    Glyph1.ImageIndex := 0;
  end;

end;

procedure TRadioView.Timer1Timer(Sender: TObject);
var
  intervalo : Integer;

begin
  inherited;
  Randomize;
  intervalo := Random(50) + 5;
  Timer1.Interval := intervalo;
  Self.mudaTamanhoRetangulo();

end;

end.
