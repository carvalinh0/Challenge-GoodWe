# Fazendo pull do repositório
- Crie uma pasta vazia
- `git pull [link do repositório]`
- Mude de branch usando `git checkout [nome da branch]` ou `git switch [nome da branch]` <-- muito importante!

# Rodando o projeto
- Instale as dependencias usando `flutter pub get`
- Rode o projeto usando `flutter run`

# Onde fica localizado o arquivo principal?
- O arquivo principal do projeto está localizado em `lib/main.dart`

# Meu terminal está dando erro na hora de rodar o projeto, o que eu faço?
- Tente primeiro iniciar um novo emulador android/ios ou conectar um dispositivo físico
- Se não funcionar tente rodar o comando `flutter clean` e depois `flutter pub get` e rode o projeto novamente
- Se ainda assim não funcionar, tente rodar o comando `flutter doctor` e veja se está tudo certo com a instalação do flutter

