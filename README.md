# Projeto de Matrícula

Este repositório contém o trabalho em grupo realizado para a disciplina "Laboratório de Desenvolvimento de Software", do 4º período do curso de Engenharia de Software da PUC - Minas.

## Integrantes

* Juliana Parreiras
* Pedro Henrique Marques
* Lúcio Alves
* Luidi Cadete Silva 

## Professor

* João Paulo Carneiro Aramuni

## Bem-vindo ao projeto de desenvolvimento do Sistema de Matrículas.

Como objetivo do nosso projeto, tem-se a criação de uma solução informatizada para a gestão eficiente das matrículas acadêmicas.

## Objetivo do Projeto

Desenvolver um sistema robusto que permita a gestão automatizada das matrículas, facilitando o registro de disciplinas e cursos, o processo de matrícula e o controle de inscrições, e integrando com o sistema de cobrança.

## Descrição do Sistema

O Sistema de Matrículas permitirá:

Cadastro e Manutenção de disciplinas, cursos e professores.
Matrícula e Cancelamento de disciplinas por parte dos alunos, com controle de vagas e regras de ativação.
Acesso para Professores visualizarem suas turmas.

## Linguagem

O projeto será desenvolvido em Java e seguirá um processo de desenvolvimento estruturado, com entregas graduais e uma apresentação final comparando o protótipo com os requisitos iniciais.

## Orientações para Abrir o Projeto

### Pré-requisitos

Certifique-se de ter os seguintes programas instalados:

- **Wamp 64** (para MySQL e console do MySQL)
- **Ngrok** (para geração de link de forwarding)
- **Flutter** e **Git Bash**
- **Visual Studio Code**
- **IntelliJ IDEA** (para rodar o backend)

### Passo a Passo

1. **Iniciar o Wamp 64**:
   - Abra o Wamp 64 para acessar o MySQL e o console do MySQL.

2. **Configurar o Ngrok**:
   - Execute o Ngrok para gerar um link de forwarding para o backend.

3. **Configurar o Frontend**:
   - Navegue até as pastas `lib` e `domain`, e configure a `base URL` com o link gerado pelo Ngrok.
   - No terminal, acesse o diretório do projeto com o comando:
     ```bash
     cd projeto_matricula_application
     ```
   - Execute o frontend com o comando:
     ```bash
     flutter run
     ```

4. **Configurar o Backend**:
   - Navegue até as pastas `back` e `resources`, e edite o arquivo `app.properties` para deixar o campo de senha vazio.
   - Abra o projeto de backend no IntelliJ IDEA e execute o projeto a partir do IDE.

5. **Executar o Frontend novamente**:
   - No terminal do frontend, execute:
     ```bash
     flutter run
     ```
   - **Nota**: É necessário ter o Flutter e o Git Bash instalados.
   - Abra o projeto no Visual Studio Code selecionando a opção "Abrir pelo Visual Studio".

6. **Login e Acesso ao Banco de Dados**:
   - Após o projeto estar em execução, realize o login com o usuário e senha.
   - Para adicionar elementos ao banco de dados, acesse o link:
     ```
     http://localhost:8080
     ```
   - Utilize o Swagger para adicionar, editar ou excluir dados como novos professores, usuários, alunos, etc.
   - Após adicionar um novo usuário, professor, aluno ou secretária, você poderá acessar o login com o novo usuário criado. O sistema exibirá opções apropriadas para cada categoria (secretária, professor ou aluno).

### Observações

1. Se o usuário estiver utilizando um iPhone, o projeto não funcionará em um computador com Windows; é necessário utilizar um Mac para acessar o projeto a partir do iPhone.
2. O backend deve estar em execução para que o Swagger funcione corretamente.


