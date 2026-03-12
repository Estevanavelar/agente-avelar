# Documentação da Estrutura de Banco de Dados: Diagnósticos Avelar

Este documento descreve a estrutura do banco de dados projetada para armazenar a base de conhecimento do agente **Avelar** (Especialista em Reparo de Smartphones). Esta estrutura foi desenhada para ser implementada em PostgreSQL, utilizando o Supabase como backend, ideal para o sistema AxCellOS.

## 1. Arquitetura Geral

A arquitetura foi desenhada com uma abordagem de **Tabelas por Marca**. Embora uma abordagem de tabela única com uma coluna `marca` seja possível, a divisão por tabelas específicas (ex: `apple_diagnosticos`, `samsung_diagnosticos`) oferece as seguintes vantagens:
- Melhor organização visual dos dados.
- Facilidade em exportar/importar dados de uma marca específica.
- Performance otimizada caso a base de uma marca específica cresça desproporcionalmente.

## 2. Estrutura das Tabelas

Cada marca possui sua própria tabela, mas todas compartilham a exata mesma estrutura de colunas para manter a padronização e facilitar as consultas (queries) da Inteligência Artificial.

### Tabelas Criadas:
- `apple_diagnosticos`
- `samsung_diagnosticos`
- `motorola_diagnosticos`
- `xiaomi_diagnosticos`
- `realme_diagnosticos`

### Dicionário de Dados (Colunas):

| Nome da Coluna | Tipo de Dado | Restrição | Descrição |
| :--- | :--- | :--- | :--- |
| `id` | UUID | PRIMARY KEY | Identificador único gerado automaticamente (gen_random_uuid). |
| `modelo` | VARCHAR(255) | NOT NULL | O modelo específico do aparelho (ex: "iPhone 11 Pro Max", "Todos os Modelos"). |
| `defeito` | TEXT | NOT NULL | O sintoma ou problema relatado pelo cliente (ex: "Aparelho não liga"). |
| `diagnostico` | TEXT | NOT NULL | A conclusão técnica sobre o que está causando o problema. |
| `possiveis_causas` | TEXT | NOT NULL | Lista de componentes ou falhas que geram o diagnóstico. |
| `solucao` | TEXT | NOT NULL | A ação necessária para resolver o problema de forma definitiva. |
| `como_resolver` | TEXT | NOT NULL | O passo a passo detalhado, testes a realizar e instruções práticas para o técnico. |
| `criado_em` | TIMESTAMP | DEFAULT NOW() | Data e hora em que o diagnóstico foi registrado. |
| `atualizado_em` | TIMESTAMP | DEFAULT NOW() | Data e hora da última modificação do registro. |

## 3. Como a IA deve interagir com este Banco de Dados

Quando este banco de dados for integrado ao agente Avelar no AxCellOS, o fluxo de operação deve ser:

1. **Coleta de Dados:** O agente pergunta ao técnico a Marca, Modelo e o Defeito relatado.
2. **Busca (Query):** O sistema realiza um `SELECT` na tabela correspondente à marca, buscando por similaridade na coluna `modelo` e `defeito`.
   - Exemplo SQL: `SELECT * FROM apple_diagnosticos WHERE modelo ILIKE '%11 Pro Max%' AND defeito ILIKE '%carrega%';`
3. **Apresentação:** O agente formata os dados retornados (Diagnóstico, Causas, Solução e Como Resolver) em uma resposta amigável em Markdown.
4. **Aprendizado (Insert):** Quando o usuário ensinar um novo diagnóstico, o sistema fará um `INSERT` na tabela correspondente à marca informada.

## 4. Arquivos Relacionados
- `agente.md`: O prompt de sistema do agente, contendo a persona, regras e a estrutura de como ele deve responder.
- `diagnosticos_db.sql`: O script de criação das tabelas e inserção dos dados iniciais (seed data) pronto para ser executado no PostgreSQL/Supabase.
