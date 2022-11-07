unit Data.Notifications;

interface

uses
  System.SysUtils, System.Classes, System.Notification;

type
  TdmdNotifications = class(TDataModule)
    NotificationCenterMain: TNotificationCenter;
  private
    { Private declarations }
  public
    procedure Send(title, body: string);
    procedure CancelAll;
  end;

var
  dmdNotifications: TdmdNotifications;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdNotifications }

procedure TdmdNotifications.CancelAll;
begin
  NotificationCenterMain.CancelAll;
end;

procedure TdmdNotifications.Send(title, body: string);
var
  MyNotification: TNotification;
begin
  MyNotification := NotificationCenterMain.CreateNotification;
  try
    MyNotification.Name := 'Win11Notify';
    MyNotification.Title := title;
    MyNotification.AlertBody := body;

    NotificationCenterMain.PresentNotification(MyNotification);
  finally
    MyNotification.Free;
  end;
end;

end.
