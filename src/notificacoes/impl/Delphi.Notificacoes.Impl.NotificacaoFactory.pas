unit Delphi.Notificacoes.Impl.NotificacaoFactory;

interface

uses
  Vcl.Graphics,

  System.Generics.Collections,
  Delphi.Notificacoes.Notificacao,
  Delphi.Notificacoes.Impl.Notificacao,
  Delphi.Notificacoes.NotificacaoFactory;

type
  TNotificacaoFactory = class(TInterfacedObject, INotificacaoFactory)
  private
    FNotificacoes: TList<INotificacao>;

    procedure AdicionarNotificacaoNaLista(const Notificacao: INotificacao);
    procedure RemoverNotificacaoDaLista(const Notificacao: INotificacao);
    procedure NotificarLista;
    procedure Criar(const Mensagem: string; const Icone: Integer; const Cor: TColor);

  public
    constructor Create;
    destructor Destroy; override;

    procedure Informacao(const Mensagem: string);
    procedure Warning(const Mensagem: string);
    procedure Erro(const Mensagem: string);
    procedure Sucesso(const Mensagem: string);
    procedure Dark(const Mensagem: string);

  end;

const
  ICONE_NENHUM = $0;
  ICONE_ERRO = $F00D;
  ICONE_INFORMACAO = $F05A;
  ICONE_SUCESSO = $F058;
  ICONE_WARNING = $F06A;

  COR_PRETO = $00121212;
  COR_VERMELHO = $003C4CE7;
  COR_AZUL = $00DB9834;
  COR_VERDE = $000CBC07;
  COR_LARANJA = $000FC4F1;

implementation

constructor TNotificacaoFactory.Create;
begin
  FNotificacoes := TList<INotificacao>.Create;
end;

destructor TNotificacaoFactory.Destroy;
begin
  FNotificacoes.Free;
  inherited;
end;

procedure TNotificacaoFactory.Dark(const Mensagem: string);
begin
  Criar(Mensagem, ICONE_NENHUM, COR_PRETO);
end;

procedure TNotificacaoFactory.Erro(const Mensagem: string);
begin
  Criar(Mensagem, ICONE_ERRO, COR_VERMELHO);
end;

procedure TNotificacaoFactory.Informacao(const Mensagem: string);
begin
  Criar(Mensagem, ICONE_INFORMACAO, COR_AZUL);
end;

procedure TNotificacaoFactory.Sucesso(const Mensagem: string);
begin
  Criar(Mensagem, ICONE_SUCESSO, COR_VERDE);
end;

procedure TNotificacaoFactory.Warning(const Mensagem: string);
begin
  Criar(Mensagem, ICONE_WARNING, COR_LARANJA);
end;

procedure TNotificacaoFactory.Criar(const Mensagem: string; const Icone: Integer; const Cor: TColor);
var
  Notificacao: INotificacao;
begin
  Notificacao := TNotificacao.Create(nil);
  AdicionarNotificacaoNaLista(Notificacao);
  Notificacao.OnRemoverDaLista := RemoverNotificacaoDaLista;
  Notificacao.Mensagem(Mensagem).Icone(Icone).Cor(Cor).Exibir;
  NotificarLista;
end;

procedure TNotificacaoFactory.AdicionarNotificacaoNaLista(const Notificacao: INotificacao);
begin
  FNotificacoes.Add(Notificacao);
end;

procedure TNotificacaoFactory.RemoverNotificacaoDaLista(const Notificacao: INotificacao);
begin
  FNotificacoes.Delete(FNotificacoes.IndexOf(Notificacao));
end;

procedure TNotificacaoFactory.NotificarLista;
var
  Notificacao: INotificacao;
begin
  for Notificacao in FNotificacoes do
  begin
    Notificacao.AtualizarPosicao;
  end;
end;

end.
