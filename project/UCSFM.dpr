program UCSFM;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_UCSFM.View in '..\src\UCSFM\U_UCSFM.View.pas' {FormMaster};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'UCS FM';
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TFormMaster, FormMaster);
  Application.Run;
end.
