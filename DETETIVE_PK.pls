create or replace PACKAGE detetive_pk AS

    PROCEDURE player_insert(p_record in out player%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE player_update(p_record in out player%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE cast_insert(p_record in out cast%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE cast_update(p_record in out cast%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE gun_insert(p_record in out gun%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE gun_update(p_record in out gun%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE map_insert(p_record in out map%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE map_update(p_record in out map%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE environment_insert(p_record in out environment%rowtype 
                            ,p_message out varchar2
                            );
    PROCEDURE environment_update(p_record in out environment%rowtype 
                            ,p_message out varchar2
                            );
    procedure game_create(p_map_name VARCHAR2
                         ,p_player_name varchar2
                         ,p_cast_name varchar2
                         ,p_record out game%rowtype
                         ,p_message out varchar2);  
    procedure game_enter(p_game_id number
                        ,p_player_name varchar2
                        ,p_cast_name varchar2
                        ,p_message out varchar2);
    procedure game_start(p_game_id number
                        ,p_message out varchar2);
    
                            
                        
                            
END detetive_pk;