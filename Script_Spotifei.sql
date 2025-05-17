-- Usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,
    senha_hash VARCHAR(100) NOT NULL
);

-- Artistas
CREATE TABLE artistas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- Músicas
CREATE TABLE musicas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL REFERENCES artistas(id) ON DELETE CASCADE,
    genero VARCHAR(50),
    duracao_segundos INT CHECK (duracao_segundos > 0)
);

-- Curtidas 
CREATE TABLE curtidas (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_curtida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_curtidas_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_curtidas_musica FOREIGN KEY (musica_id) REFERENCES musicas(id) ON DELETE CASCADE,
    CONSTRAINT uq_usuario_musica UNIQUE (usuario_id, musica_id)
);

-- Descurtidas 
CREATE TABLE descurtidas (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_descurtida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_descurtidas_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_descurtidas_musica FOREIGN KEY (musica_id) REFERENCES musicas(id) ON DELETE CASCADE
);

-- Playlists
CREATE TABLE playlists (
    id SERIAL PRIMARY KEY,
    nome_playlist VARCHAR(100) NOT NULL,
    usuario_id INT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_ultima_edicao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_playlists_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Músicas dentro das playlists
CREATE TABLE playlist_musicas (
    id SERIAL PRIMARY KEY,
    playlist_id INT NOT NULL,
    musica_id INT NOT NULL,
    CONSTRAINT fk_playlistmusicas_playlist FOREIGN KEY (playlist_id) REFERENCES playlists(id) ON DELETE CASCADE,
    CONSTRAINT fk_playlistmusicas_musica FOREIGN KEY (musica_id) REFERENCES musicas(id) ON DELETE CASCADE,
    CONSTRAINT uq_playlist_musica UNIQUE (playlist_id, musica_id)
);

-- Histórico de ações: buscar, curtir, descurtir
CREATE TABLE historico_acoes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    musica_id INT,
    termo_buscado VARCHAR(100),
    tipo_acao VARCHAR(20) NOT NULL CHECK (tipo_acao IN ('buscar', 'curtir', 'descurtir')),
    data_acao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historico_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_historico_musica FOREIGN KEY (musica_id) REFERENCES musicas(id) ON DELETE SET NULL
);
