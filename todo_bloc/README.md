# Todo App com Flutter BLoC

## Descrição do Repositório

Este é um aplicativo **To-Do List** desenvolvido em **Flutter** utilizando **Clean Architecture** com **BLoC** para gerenciamento de estado. O app permite adicionar, editar, excluir e marcar tarefas como concluídas. As tarefas são persistidas localmente utilizando o **Shared Preferences** e o estado do app é gerenciado por **BLoC**. A injeção de dependências é realizada utilizando o pacote **Flutter GetIt**.

Este projeto serve como exemplo de como organizar um app Flutter utilizando padrões modernos como **Clean Architecture** e **BLoC**, com o foco em escalabilidade e manutenção.

---

## Funcionalidades

- Adicionar tarefas com título e descrição.
- Editar tarefas existentes.
- Marcar tarefas como concluídas.
- Excluir tarefas.
- Armazenamento local utilizando **SharedPreferences**.
- Gerenciamento de estado com **BLoC**.
- Injeção de dependência com **Flutter GetIt**.

---

## Estrutura do Projeto

A estrutura do código foi organizada de acordo com os princípios da **Clean Architecture**. As pastas principais incluem:

- **lib/src/core**: Contém as classes e utilitários comuns para toda a aplicação, como constantes e helpers.
- **lib/src/features/todo**: Contém a implementação da funcionalidade principal (To-Do List).
  - **data**: Modelos de dados, repositórios e fontes de dados (local).
  - **domain**: Entidades de domínio, casos de uso e interfaces de repositórios.
  - **presentation**: Apresentação dos dados, incluindo o **BLoC**, eventos, estados e widgets.
- **lib/src/core/utils/constants.dart**: Contém as constantes usadas na aplicação, como a chave para o armazenamento local.

---

## Dependências

Este projeto utiliza as seguintes dependências:

- `flutter_getit`: Para injeção de dependências.
- `shared_preferences`: Para persistência local de dados.

---

## Instruções de Uso

### Pré-requisitos

Antes de começar, você precisará de:

- **Flutter** instalado em seu ambiente. Se ainda não tiver o Flutter instalado, siga as instruções no [site oficial do Flutter](https://flutter.dev/docs/get-started/install).
- **Editor de código**, como o [VS Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio).

### Como rodar o app

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/todo-app-flutter.git
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:

   ```bash
   flutter run
   ```

---

## Contribuição

Se você deseja contribuir para este projeto, siga os seguintes passos:

1. Faça um fork deste repositório.
2. Crie uma branch para a sua funcionalidade ou correção de bug:
   ```bash
   git checkout -b minha-nova-funcionalidade
   ```
3. Faça as modificações desejadas e envie para o repositório:
   ```bash
   git commit -am 'Adiciona minha nova funcionalidade'
   git push origin minha-nova-funcionalidade
   ```
4. Crie um **pull request** explicando o que foi modificado.
