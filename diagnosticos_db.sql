-- Script SQL para o Banco de Dados do Agente Avelar (AxCellOS)
-- Compatível com PostgreSQL / Supabase

-- =====================================================================================
-- CRIAÇÃO DAS TABELAS (UMA POR MARCA)
-- =====================================================================================

-- Tabela para diagnósticos da marca Apple
CREATE TABLE IF NOT EXISTS apple_diagnosticos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    modelo VARCHAR(255) NOT NULL,
    defeito TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    possiveis_causas TEXT NOT NULL,
    solucao TEXT NOT NULL,
    como_resolver TEXT NOT NULL,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para diagnósticos da marca Samsung
CREATE TABLE IF NOT EXISTS samsung_diagnosticos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    modelo VARCHAR(255) NOT NULL,
    defeito TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    possiveis_causas TEXT NOT NULL,
    solucao TEXT NOT NULL,
    como_resolver TEXT NOT NULL,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para diagnósticos da marca Motorola
CREATE TABLE IF NOT EXISTS motorola_diagnosticos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    modelo VARCHAR(255) NOT NULL,
    defeito TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    possiveis_causas TEXT NOT NULL,
    solucao TEXT NOT NULL,
    como_resolver TEXT NOT NULL,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para diagnósticos da marca Xiaomi
CREATE TABLE IF NOT EXISTS xiaomi_diagnosticos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    modelo VARCHAR(255) NOT NULL,
    defeito TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    possiveis_causas TEXT NOT NULL,
    solucao TEXT NOT NULL,
    como_resolver TEXT NOT NULL,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para diagnósticos da marca Realme
CREATE TABLE IF NOT EXISTS realme_diagnosticos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    modelo VARCHAR(255) NOT NULL,
    defeito TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    possiveis_causas TEXT NOT NULL,
    solucao TEXT NOT NULL,
    como_resolver TEXT NOT NULL,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================================================
-- INSERÇÃO DE DADOS INICIAIS (BASE DE CONHECIMENTO)
-- =====================================================================================

-- Inserindo diagnósticos APPLE
INSERT INTO apple_diagnosticos (modelo, defeito, diagnostico, possiveis_causas, solucao, como_resolver)
VALUES 
(
    'iPhone 11 Pro Max',
    'Sinal de carregamento desaparece após ligar e bateria marca 1% ou 0% permanentemente.',
    'Falha na leitura do identificador da bateria (Battery ID) pelo conector de carga.',
    'Identificador de bateria quebrado nos polos FPC do conector de carga.',
    'Substituição do conector de carga (subplaca).',
    '1. Teste conectar a bateria diretamente na placa (sem passar pelo conector) para verificar se o iOS a reconhece corretamente.\n2. Inspecione os polos FPC do conector de carga com lupa/microscópio para identificar danos no identificador de bateria.\n3. Descarte falha na bateria testando com uma nova.\n4. Realize a troca completa do flex do conector de carga. O conector defeituoso não consegue ler o Battery ID, então a troca é a única solução. Após a substituição, o iOS reconhecerá a bateria e o carregamento funcionará.'
),
(
    'Todos os Modelos',
    'Aparelho não liga e não carrega (Consumo zero na fonte).',
    'Falha no circuito de carga.',
    'Conector de carga danificado, flex de carga rompido ou falha no CI de carga (Tristar/Tigris).',
    'Troca do conector de carga ou reparo no CI de carga.',
    '1. Testar com outro cabo e fonte de qualidade.\n2. Verificar tensão no conector da bateria com multímetro.\n3. Plugar na fonte de bancada e verificar se há consumo ao pressionar o botão Power.\n4. Substituir o conector de carga. Se não resolver, realizar reballing ou troca do CI de carga na placa-mãe.'
);

-- Inserindo diagnósticos genéricos para Android (Replicando para Samsung, Motorola, Xiaomi e Realme como base inicial)

-- SAMSUNG
INSERT INTO samsung_diagnosticos (modelo, defeito, diagnostico, possiveis_causas, solucao, como_resolver)
VALUES 
(
    'Todos os Modelos',
    'Touch screen não responde (Tela visualmente intacta).',
    'Falha de comunicação entre o touch e a placa.',
    'Falha no display, flex do touch desconectado/danificado ou falha no CI de Touch.',
    'Substituição da tela frontal ou reparo em placa.',
    '1. Desconectar e reconectar a bateria e o flex da tela para descartar mau contato.\n2. Testar com uma tela nova (frontal de teste).\n3. Se a tela nova não funcionar, analisar o setor de touch na placa-mãe (conector FPC, filtros, CI).'
),
(
    'Todos os Modelos',
    'Bateria descarrega muito rápido ou aparelho desliga sozinho.',
    'Desgaste químico da bateria ou curto-circuito secundário na placa.',
    'Bateria degradada (vida útil baixa) ou fuga de corrente na placa-mãe.',
    'Troca da bateria ou reparo de curto na placa.',
    '1. Verificar a saúde da bateria via software (ex: AccuBattery).\n2. Conectar a placa na fonte de bancada e verificar se há consumo antes de pressionar o botão Power (isso indica fuga de corrente).\n3. Se houver fuga, localizar o componente em curto (usando breu, câmera térmica ou spray congelante) e substituí-lo. Se não houver fuga, trocar a bateria.'
);

-- MOTOROLA
INSERT INTO motorola_diagnosticos (modelo, defeito, diagnostico, possiveis_causas, solucao, como_resolver)
VALUES 
(
    'Todos os Modelos',
    'Touch screen não responde (Tela visualmente intacta).',
    'Falha de comunicação entre o touch e a placa.',
    'Falha no display, flex do touch desconectado/danificado ou falha no CI de Touch.',
    'Substituição da tela frontal ou reparo em placa.',
    '1. Desconectar e reconectar a bateria e o flex da tela para descartar mau contato.\n2. Testar com uma tela nova (frontal de teste).\n3. Se a tela nova não funcionar, analisar o setor de touch na placa-mãe (conector FPC, filtros, CI).'
),
(
    'Todos os Modelos',
    'Bateria descarrega muito rápido ou aparelho desliga sozinho.',
    'Desgaste químico da bateria ou curto-circuito secundário na placa.',
    'Bateria degradada (vida útil baixa) ou fuga de corrente na placa-mãe.',
    'Troca da bateria ou reparo de curto na placa.',
    '1. Verificar a saúde da bateria via software.\n2. Conectar a placa na fonte de bancada e verificar se há consumo antes de pressionar o botão Power.\n3. Se houver fuga, localizar o componente em curto e substituí-lo. Se não houver fuga, trocar a bateria.'
);

-- XIAOMI
INSERT INTO xiaomi_diagnosticos (modelo, defeito, diagnostico, possiveis_causas, solucao, como_resolver)
VALUES 
(
    'Todos os Modelos',
    'Touch screen não responde (Tela visualmente intacta).',
    'Falha de comunicação entre o touch e a placa.',
    'Falha no display, flex do touch desconectado/danificado ou falha no CI de Touch.',
    'Substituição da tela frontal ou reparo em placa.',
    '1. Desconectar e reconectar a bateria e o flex da tela para descartar mau contato.\n2. Testar com uma tela nova (frontal de teste).\n3. Se a tela nova não funcionar, analisar o setor de touch na placa-mãe (conector FPC, filtros, CI).'
),
(
    'Todos os Modelos',
    'Bateria descarrega muito rápido ou aparelho desliga sozinho.',
    'Desgaste químico da bateria ou curto-circuito secundário na placa.',
    'Bateria degradada (vida útil baixa) ou fuga de corrente na placa-mãe.',
    'Troca da bateria ou reparo de curto na placa.',
    '1. Verificar a saúde da bateria via software.\n2. Conectar a placa na fonte de bancada e verificar se há consumo antes de pressionar o botão Power.\n3. Se houver fuga, localizar o componente em curto e substituí-lo. Se não houver fuga, trocar a bateria.'
);

-- REALME
INSERT INTO realme_diagnosticos (modelo, defeito, diagnostico, possiveis_causas, solucao, como_resolver)
VALUES 
(
    'Todos os Modelos',
    'Touch screen não responde (Tela visualmente intacta).',
    'Falha de comunicação entre o touch e a placa.',
    'Falha no display, flex do touch desconectado/danificado ou falha no CI de Touch.',
    'Substituição da tela frontal ou reparo em placa.',
    '1. Desconectar e reconectar a bateria e o flex da tela para descartar mau contato.\n2. Testar com uma tela nova (frontal de teste).\n3. Se a tela nova não funcionar, analisar o setor de touch na placa-mãe (conector FPC, filtros, CI).'
),
(
    'Todos os Modelos',
    'Bateria descarrega muito rápido ou aparelho desliga sozinho.',
    'Desgaste químico da bateria ou curto-circuito secundário na placa.',
    'Bateria degradada (vida útil baixa) ou fuga de corrente na placa-mãe.',
    'Troca da bateria ou reparo de curto na placa.',
    '1. Verificar a saúde da bateria via software.\n2. Conectar a placa na fonte de bancada e verificar se há consumo antes de pressionar o botão Power.\n3. Se houver fuga, localizar o componente em curto e substituí-lo. Se não houver fuga, trocar a bateria.'
);
