--/*Drop
DROP TABLE player_content;
DROP TABLE game_content;
DROP TABLE game;
DROP TABLE environment;
DROP TABLE CAST;
DROP TABLE gun;
DROP TABLE map;
DROP TABLE player;
DROP TYPE COORDENADAS;
DROP TYPE COORDENADA;
DROP SEQUENCE CAT_SEQ;
--Drop*/

/* Cria Diretório
--Para criação dos diretórios utilize o usuário System e libere o acesso para outro usuário
CREATE OR REPLACE DIRECTORY DIR_FIGURAS AS 'C:\Users\victo\OneDrive\detetive\imagens';
--Cria Diretório*/

CREATE SEQUENCE CAT_SEQ INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;

CREATE TYPE coordenada AS OBJECT (
    top_position     INTEGER,
    left_position   INTEGER
) NOT FINAL;
/
CREATE TYPE coordenadas as table of coordenada;
/

CREATE TABLE cast (
    cast_id             INTEGER NOT NULL,
    cast_name           VARCHAR2(255 CHAR),
    cast_image          BLOB,
    cast_short_image    BLOB,
    start_date          DATE,
    end_date            DATE
);

ALTER TABLE cast ADD CONSTRAINT cast_pk PRIMARY KEY ( cast_id );

CREATE TABLE environment (
    environment_id               INTEGER NOT NULL,
    map_id                       INTEGER NOT NULL,
    environment_name             VARCHAR2 (255),
    position                     coordenada,
    width                        INTEGER,
    heigth                       INTEGER,
    environment_image            BLOB,
    environment_door_positions   coordenadas,
    start_date                   DATE,
    end_date                     DATE
) NESTED TABLE environment_door_positions STORE AS environment_nt;

ALTER TABLE environment ADD CONSTRAINT environment_pk PRIMARY KEY ( environment_id );

CREATE TABLE game (
    game_id                 INTEGER NOT NULL,
    start_date              DATE,
    end_date                DATE,
    master_player_id        INTEGER,
    map_id                  INTEGER,
    target_cast_id          INTEGER,
    target_environment_id   INTEGER,
    target_gun_id           INTEGER,
    current_player_id       INTEGER,
    next_player_id          INTEGER,
    winner_player_id        INTEGER,
    status                  NUMBER
);

ALTER TABLE game ADD CONSTRAINT game_pk PRIMARY KEY ( game_id );

CREATE TABLE game_content (
    game_content_id        INTEGER NOT NULL,
    game_id                INTEGER NOT NULL,
    content_type           VARCHAR2(10 CHAR),
    content_id             INTEGER NOT NULL,
    content_sequence       NUMBER,
    content_position       coordenada,
    using_cast_id          number
);

ALTER TABLE game_content ADD CONSTRAINT game_content_pk PRIMARY KEY ( game_content_id );

CREATE TABLE gun (
    gun_id       INTEGER NOT NULL,
    gun_name     VARCHAR2(255 CHAR),
    gun_image    BLOB,
    start_date   DATE,
    end_date     DATE
);

ALTER TABLE gun ADD CONSTRAINT gun_pk PRIMARY KEY ( gun_id );

CREATE TABLE map (
    map_id                  INTEGER NOT NULL,
    map_name                VARCHAR2(255 CHAR),
    map_image               BLOB,
    map_positions           coordenadas,
    cast_start_positions    coordenadas,
    start_date              DATE,
    end_date                DATE
) NESTED TABLE map_positions STORE AS map_nt1
NESTED TABLE cast_start_positions STORE AS map_nt2;

ALTER TABLE map ADD CONSTRAINT map_pk PRIMARY KEY ( map_id );

CREATE TABLE player (
    player_id     INTEGER NOT NULL,
    player_name   VARCHAR2(255 CHAR),
    password      VARCHAR2(200),
    start_date    DATE,
    end_date      DATE
);

ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY ( player_id );

CREATE TABLE player_content (
    player_content_id   INTEGER NOT NULL,
    player_id           INTEGER NOT NULL,
    game_content_id     INTEGER NOT NULL,
    game_id             INTEGER NOT NULL,
    player_id_owner     INTEGER
);

ALTER TABLE player_content ADD CONSTRAINT player_content_pk PRIMARY KEY ( player_content_id );


