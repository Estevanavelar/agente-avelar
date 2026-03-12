# Agente Avelar - Especialista em Reparo de Smartphones

Bem-vindo ao repositório do **Agente Avelar**, um sistema especializado em diagnóstico e orientação técnica para reparo de smartphones. Este projeto fornece uma base de conhecimento estruturada que pode ser integrada em qualquer plataforma de IA ou sistema de assistência técnica.

## 📋 O que é o Agente Avelar?

O Agente Avelar é um especialista em assistência técnica de smartphones que:
- Realiza diagnósticos precisos de problemas em aparelhos
- Fornece soluções passo a passo para técnicos
- Aprende novos diagnósticos continuamente
- Suporta as principais marcas: Apple, Samsung, Motorola, Xiaomi e Realme

## 📁 Arquivos do Projeto

### 1. **agente.md**
O prompt de sistema do agente. Este arquivo contém:
- Identidade e persona do Avelar
- Regras de comportamento e tom de voz
- Sistema de aprendizado contínuo
- Base de conhecimento estruturada por marca e modelo

**Como usar:** Cole o conteúdo deste arquivo em qualquer IA (ChatGPT, Claude, Gemini, etc.) para transformá-la em um especialista em reparos de smartphones.

### 2. **diagnosticos_db.sql**
Script SQL para PostgreSQL/Supabase contendo:
- 5 tabelas (uma para cada marca)
- Estrutura de colunas padronizada
- Dados iniciais (seed data) com diagnósticos já registrados

**Como usar:** Execute este script no seu banco de dados PostgreSQL ou Supabase para criar a estrutura de dados.

### 3. **diagnosticos_estrutura.md**
Documentação técnica completa:
- Arquitetura do banco de dados
- Dicionário de dados (descrição de todas as colunas)
- Fluxo de operação da IA com o banco
- Instruções de integração

## 🚀 Como Começar

### Opção 1: Usar o Agente Diretamente
1. Abra o arquivo `agente.md`
2. Copie todo o conteúdo
3. Cole em sua IA favorita (ChatGPT, Claude, etc.)
4. Comece a fazer perguntas sobre reparos de smartphones!

### Opção 2: Integrar com Banco de Dados
1. Tenha um banco PostgreSQL ou Supabase pronto
2. Execute o arquivo `diagnosticos_db.sql`
3. Consulte `diagnosticos_estrutura.md` para entender a estrutura
4. Integre o banco de dados com sua aplicação

## 💾 Estrutura do Banco de Dados

O banco de dados é organizado em tabelas por marca:
- `apple_diagnosticos`
- `samsung_diagnosticos`
- `motorola_diagnosticos`
- `xiaomi_diagnosticos`
- `realme_diagnosticos`

Cada tabela contém as colunas:
- `modelo`: Modelo do aparelho
- `defeito`: Sintoma relatado
- `diagnostico`: Conclusão técnica
- `possiveis_causas`: Componentes ou falhas envolvidas
- `solucao`: Ação para resolver
- `como_resolver`: Passo a passo detalhado
- `criado_em`: Data de criação
- `atualizado_em`: Data de última atualização

## 📚 Exemplos de Diagnósticos Inclusos

- **iPhone 11 Pro Max:** Sinal de carregamento desaparece após ligar
- **iPhone (Genérico):** Aparelho não liga e não carrega
- **Android (Genérico):** Touch screen não responde
- **Android (Genérico):** Bateria descarrega muito rápido

## 🎓 Como Ensinar Novos Diagnósticos

Use o comando especial no agente:
```
[APRENDER DIAGNÓSTICO] Marca: Apple | Modelo: iPhone 13 | Defeito: Câmera não funciona | Diagnóstico: Falha no módulo de câmera | Possíveis Causas: Conector solto ou CI danificado | Solução: Substituição do módulo | Como Resolver: Passo 1... Passo 2...
```

## 🔧 Tecnologias

- **Banco de Dados:** PostgreSQL / Supabase
- **Formato de Documentação:** Markdown
- **Compatibilidade:** Qualquer IA (ChatGPT, Claude, Gemini, etc.)
- **Stack Recomendada:** Node.js, Next.js, React (para integração web)

## 📝 Licença

Este projeto é de código aberto e pode ser usado livremente.

## 👨‍💻 Autor

Desenvolvido por **Estevan Avelar** para a **Avelar Company** - Especialista em Reparos de Smartphones.

---

**Última atualização:** Março de 2026
