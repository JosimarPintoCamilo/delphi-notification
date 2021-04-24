unit Exemplo.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls,

  Delphi.Notificacoes.NotificacaoFactory,
  Delphi.Notificacoes.Impl.NotificacaoFactory;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);

  private

    FNotificador: INotificacaoFactory;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FNotificador := TNotificacaoFactory.Create;
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
  FNotificador.Dark('Teessssssssste');
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  FNotificador.Informacao('Uma informação');
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
  FNotificador.Sucesso('Cadastrado com sucesso!');
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
  FNotificador.Warning('Tome cuidado');
end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
  FNotificador.Erro('Deu Erro');
end;

end.
