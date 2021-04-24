# Delphi Notification - Notificacoes em Delphi

### Resolvi criar esse projeto, pois percebi que os sistemas desktops não emitem aqueles balõezinhos como na web. No sistema da empresa onde trabalho atualmente não tem exibição dessas mensagens. Podemos utilizar essas notificações em várias situações, um exemplo é em resposta a alguma ação executada: Cadastrado com sucesso, Sem conexão,..., e tudo mais. Se quiser contribuir com esse projeto fique a vontade hehe.

![delphi-notification](https://github.com/JosimarPintoCamilo/delphi-notification/blob/master/resources/exemplo.gif)

#### Requisitos:
- Não tem dependências, só o Delphi é suficiente para rodar o projeto, seja livre :)

#### Como utilizar:

Instancie uma fábrica de notificações:
```
FNotificacaoFactory: INotificacaoFactory;
FNotificacaoFactory := TNotificacaoFactory.Create;
```

Crie a notificação que quiser :)

```
FNotificacaoFactory.Dark('Mensagem Dark');
``` 

``` 
FNotificacaoFactory.Informacao('Contribua com esse projeto!');
``` 

``` 
FNotificacaoFactory.Sucesso('Parabéns!');
``` 

``` 
FNotificacaoFactory.Warning('Tome cuidado.');
``` 

``` 
FNotificacaoFactory.Erro('Deu Erro!');
``` 

#### Se preferir personalise o seu balão utilizando a classe TNotificacao encadeando os métodos

```
FNotificacao: INotificacao;
FNotificacao := TNotificacao.Create(nil);
FNotificacao.Mensagem(Mensagem).Icone(CODIGO_ICONE).Cor(CODIGO_COR).Exibir;
```

### Sobre os ícones

O ícone da notificação pode ser um de sua preferência. O código do ícone você vai pegar no site [Font Awesome](https://fontawesome.com/). Vai precisar adicionar um $ como esse exemplo ICONE_ERRO = $F00D;<br/>

### Sobre a cor

As cores das notificações podem ser personalizadas. Vale lembrar que o Delphi utiliza o padrão de cores BGR e não RGB como estamos acostumados. Logo, lembre-se de fazer essa conversão e colocar o $ como: COR_PRETO = $00121212.
