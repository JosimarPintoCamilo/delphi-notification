unit Delphi.Notificacoes.Notificacao;

interface

uses
  Vcl.Graphics;

type
  INotificacao = interface;
  TRemoverDaLista = procedure(const Notificacao: INotificacao) of object;

  INotificacao = interface
    ['{8F54D2EF-83B8-4B85-92C8-A691FAC77ED1}']

    function Mensagem(const Mensagen: string): INotificacao;
    function Icone(const CodigoIcone: Integer): INotificacao;
    function Cor(const Cor: TColor): INotificacao;

    procedure SetOnRemoverDaLista(const Value: TRemoverDaLista);
    procedure AtualizarPosicao;
    procedure Exibir;

    property OnRemoverDaLista: TRemoverDaLista write SetOnRemoverDaLista;
  end;

implementation

end.
