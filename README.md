# Aplicativo Vídeo Monitoramento

Foco na construção de um aplicativo voltado ao contexto de videomonitoramento e que faz uso de uma API.
## Packages

- [Mobx](https://pub.dev/packages/flutter_mobx): como gerência de estado.
- [flutter_modular](https://pub.dev/packages/flutter_modular): injeção de dependências e gerenciamento de rotas.
- [Http](https://pub.dev/packages/http): cliente HTTP para consumo da API.
- [Slidy](https://pub.dev/packages/slidy): utilizado para script, criação de módulos.
- [video_player](https://pub.dev/packages/video_player): utilizado para exibição de vídeos.

## Instalação do projeto

1. Clone o projeto.

2. Abra o projeto através de sua IDE de preferência.

3. Digite ou cole no terminal os códigos abaixo:

```bash
flutter pub get
```
```bash
slidy run mobx
```
4. Selecione a opção no terminal "mobx_watch_build_clean".

5. Após feito isso, já é possível debugar o projeto.

6. Caso não tenha o package "slidy" instalado, siga o passo a passo [aqui](https://pub.dev/packages/slidy).

## Testes

1. Abra a pasta test do projeto.

2. Abra os arquivos com o final _test.dart.

3. Clique em Run ou Debug acima de cada teste.

4. Se o teste passou, aparecerá o ícone "check".
## Arquitetura

- Camada de domínio (Domain): contém as entidades, interfaces dos repositórios, usecases e erros de caso de uso.
- Camada externa (External): contém as implementações de acessos externos.
- Camada de infraestrutura (Infra): contém as implementações dos repositórios, dando suporte a Domain.
- Camada de apresentação (Presenter): contém os widgets e páginas do aplicativo. 

## Melhorias futuras

Melhorar o layout do aplicativo, realizar testes utilizando mock, novas funcionalidades e corrigir possíveis bugs.


