CREATE DATABASE IF NOT EXISTS saep_farmacia DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE saep_farmacia;

-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Pedidos de Reposição
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    nome_medicamento VARCHAR(150) NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    categoria VARCHAR(50) NOT NULL,
    urgencia ENUM('baixa', 'média', 'alta') NOT NULL,
    data_solicitacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('solicitado', 'em separação', 'recebido') NOT NULL DEFAULT 'solicitado',
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id) ON DELETE CASCADE
);

-- Inserção de dados de teste (mínimo 3 funcionários e 5 pedidos)
INSERT INTO funcionarios (nome, email) VALUES
('Carlos Silva', 'carlos.silva@farmacia.com'),
('Ana Maria', 'ana.maria@farmacia.com'),
('João Pedro', 'joao.pedro@farmacia.com');

INSERT INTO pedidos (id_funcionario, nome_medicamento, quantidade, categoria, urgencia, status) VALUES
(1, 'Paracetamol 500mg', 50, 'Genérico', 'alta', 'solicitado'),
(2, 'Amoxicilina 875mg', 20, 'Referência', 'média', 'solicitado'),
(1, 'Dipirona 1g', 100, 'Genérico', 'baixa', 'em separação'),
(3, 'Rivotril 2mg', 15, 'Controlado', 'alta', 'em separação'),
(2, 'Sabonete Antisséptico', 30, 'Higiene', 'baixa', 'recebido');