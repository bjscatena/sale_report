# Sale Report - Relatório de Vendas em Elixir

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Coverage](https://img.shields.io/badge/coverage-100%25-brightgreen)
![Elixir](https://img.shields.io/badge/Elixir-1.16%2B-blueviolet)

## 📄 Descrição

Este projeto é uma ferramenta de linha de comando construída em Elixir para ler, processar e analisar dados de vendas a partir de um arquivo CSV. Ele gera um relatório resumido no terminal com o total vendido e o produto mais vendido.

O principal objetivo deste projeto foi servir como um estudo prático e profundo dos fundamentos da programação funcional e das melhores práticas de arquitetura no ecossistema Elixir.

## 🚀 Objetivos de Aprendizagem e Conceitos Demonstrados

Este projeto foi uma oportunidade para aplicar e solidificar os seguintes conceitos:

- **Programação Funcional e Imutabilidade:** O núcleo da aplicação é construído com funções puras que transformam dados, sem mutações ou efeitos colaterais.
- **Pipelines de Dados (`|>`):** O fluxo de transformação de dados, desde a leitura do arquivo até o cálculo das estatísticas, é modelado de forma clara e legível usando o operador pipe.
- **Pattern Matching:** Usado extensivamente para desestruturar dados, controlar o fluxo do programa (ex: `{:ok, ...}` vs `{:error, ...}`) e garantir a robustez da aplicação.
- **Módulos `Enum` e `Stream`:** Exploração aprofundada da manipulação de coleções para agregar e transformar os dados de venda.
- **Arquitetura Limpa (Core/IO):** O código é estruturado com uma separação clara entre a lógica de negócio pura (`Core`) e as interações com o mundo exterior (`IO`), tornando o domínio principal testável e agnóstico à infraestrutura.
- **Testes com ExUnit:** Demonstração da distinção entre testes unitários (rápidos e isolados) e testes de integração (dependentes do sistema de arquivos) usando tags (`@tag`) para controle de execução.

## 📂 Estrutura do Projeto

O projeto segue uma arquitetura baseada em responsabilidades para garantir o desacoplamento e a testabilidade:

-   `lib/sale_report/core/`: Contém a lógica de negócio pura, incluindo as `structs` (`Sale`), a criação de entidades (`SaleFactory`) e os cálculos estatísticos (`SaleStatistic`). Não possui dependências do mundo exterior.
-   `lib/sale_report/io/`: Responsável por todas as operações de Entrada/Saída, como ler arquivos (`CSVReader`) e imprimir resultados no console (`Printer`).
-   `lib/sale_report.ex`: O módulo orquestrador que conecta o `Core` e o `IO` através de uma pipeline de dados.

## 🛠️ Pré-requisitos

Para executar este projeto, você precisará ter o Elixir e o Erlang instalados.

- **Elixir:** `~> 1.16`
- **Erlang/OTP:** `~> 26.0`

## ⚙️ Como Executar

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/seu-usuario/sale_report.git](https://github.com/seu-usuario/sale_report.git)
    cd sale_report
    ```

2.  **Instale as dependências:**
    ```bash
    mix deps.get
    ```

3.  **Execute a aplicação:**
    Para processar o arquivo `sales.csv` padrão, rode o seguinte comando a partir da raiz do projeto. Ele executará a função `SaleReport.process/1`.
    ```bash
    mix run -e "SaleReport.process(\"sales.csv\")"
    ```

## ✅ Como Rodar os Testes

A suíte de testes está separada para feedback rápido durante o desenvolvimento.

- **Rodar todos os testes (Unitários + Integração):**
    ```bash
    mix test
    ```

- **Rodar apenas os testes unitários (rápidos):**
  Este comando exclui os testes que dependem do sistema de arquivos, ideal para TDD.
    ```bash
    mix test --exclude integration
    ```

- **Rodar apenas os testes de integração:**
    ```bash
    mix test --only integration
    ```

## 📊 Exemplo de Saída

Ao executar o programa, você verá um relatório formatado no terminal:

```
====================
Total sold: $447,5
Best seller:  binder
====================
```

## 📜 Licença

Este projeto é um software de código aberto licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).
