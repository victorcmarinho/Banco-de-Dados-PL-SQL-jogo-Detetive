DECLARE
    m long;
    set_record game%rowtype;
begin
    detetive_pk.game_create(p_map_name => 'Mansão do Wellysnelson'
                          ,p_player_name=> 'Francisco Peres'
                          ,p_cast_name=>'Coronel Mustard'
                          ,p_record=>set_record
                          ,p_message=>m);
    IF m is not null then
        RAISE_APPLICATION_ERROR(-20000, m);
    end if;
end;
/

DECLARE
    m long;
begin
    detetive_pk.game_enter(p_game_id => 29
                          ,p_player_name=> 'Amanda Peres'
                          ,p_cast_name=>'Senhora Violeta'
                          ,p_message=>m);
    IF m is not null then
        RAISE_APPLICATION_ERROR(-20000, m);
    end if;
    detetive_pk.game_enter(p_game_id => 29
                          ,p_player_name=> 'Estefane Peres'
                          ,p_cast_name=>'Senhorita Rosa'
                          ,p_message=>m);
    IF m is not null then
        RAISE_APPLICATION_ERROR(-20000, m);
    end if;
    detetive_pk.game_enter(p_game_id => 29
                          ,p_player_name=> 'Victor Marinho'
                          ,p_cast_name=>'Professor Black'
                          ,p_message=>m);
    IF m is not null then
        RAISE_APPLICATION_ERROR(-20000, m);
    end if;
end;
/

DECLARE
    m long;
begin
    detetive_pk.game_start(p_game_id => 29
                          ,p_message=>m);
    IF m is not null then
        RAISE_APPLICATION_ERROR(-20000, m);
    end if;
end;
/






SELECT * FROM GAME;
SELECT * FROM GAME_CONTENT;
SELECT * FROM PLAYER;
SELECT * FROM PLAYER_CONTENT;
SELECT player_id, count(*) FROM player_content group by player_id;
SELECT * FROM cast;
UPDATE game_content 
set content_sequence = dbms_random.value()
where game_id = 29
and content_id != (SELECT target_cast_id FROM game where game_id = 29)
and content_id != (SELECT target_environment_id FROM game where game_id = 29)
and content_id != (SELECT target_gun_id FROM game where game_id = 29);

UPDATE game_content gc
set gc.content_sequence = dbms_random.value()
where gc.game_id = 29
and gc.content_id not in (SELECT g.target_cast_id FROM game g where g.game_id = gc.game_id 
                       union all 
                       SELECT g.target_environment_id FROM game g where g.game_id = gc.game_id
                       union all 
                       SELECT g.target_gun_id FROM game g where g.game_id = gc.game_id
                       );
