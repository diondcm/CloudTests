program CRMwithCloud;

uses
  Vcl.Forms,
  uDataMod in 'uDataMod.pas' {DM: TDataModule},
  uMainForm in 'uMainForm.pas' {MainForm},
  uLeads in 'uLeads.pas' {LeadsForm},
  uDraftProposal in 'uDraftProposal.pas' {DraftProposalForm},
  uProposal in 'uProposal.pas' {ProposalForm},
  Vcl.Themes,
  Vcl.Styles,
  Data.Notifications in 'Data.Notifications.pas' {dmdNotifications: TDataModule},
  Classes.Atualizacoes in 'Classes.Atualizacoes.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  Data.TestCloudFunctions in 'Data.TestCloudFunctions.pas' {dmdTestCloudFunctions: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDraftProposalForm, DraftProposalForm);
  Application.CreateForm(TProposalForm, ProposalForm);
  Application.CreateForm(TLeadsForm, LeadsForm);
  Application.CreateForm(TdmdNotifications, dmdNotifications);
  Application.CreateForm(TdmdTestCloudFunctions, dmdTestCloudFunctions);
  Application.Run;
end.
