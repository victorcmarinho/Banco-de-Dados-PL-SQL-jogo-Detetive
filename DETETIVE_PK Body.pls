create or replace PACKAGE BODY detetive_pk AS
    
    PROCEDURE player_validate (p_record in out player%rowtype
                               ,p_message out varchar2
                               ) is 
    BEGIN
            
        IF p_record.player_name IS NULL THEN
            p_message   := 'Nome do jogador deve ser informado.';
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END player_validate;

    PROCEDURE player_insert(p_record in out player%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
        
        IF p_record.start_date IS NULL THEN
            p_record.start_date  := trunc(sysdate);
        END IF;
        
        player_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
        
            IF p_record.player_id IS NULL THEN
                p_record.player_id  := CAT_SEQ.NEXTVAL;
            END IF;
            
            INSERT INTO player VALUES p_record;
        END IF;
        
        EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END player_insert;
    
    PROCEDURE player_update(p_record in out player%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
               
        player_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
            SELECT player_id 
            INTO p_record.player_id 
            FROM player 
            WHERE player_id = p_record.player_id
            FOR UPDATE NOWAIT;
            
            UPDATE player 
            SET player_name = p_record.player_name
                ,password = p_record.password
                ,end_date = p_record.end_date
            WHERE player_id = p_record.player_id;
            
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END player_update;
    
    PROCEDURE cast_validate (p_record in out cast%rowtype
                               ,p_message out varchar2
                               ) is 
    BEGIN
            
        IF p_record.cast_name IS NULL THEN
            p_message   := 'Nome do cast deve ser informado.';
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END cast_validate;

    PROCEDURE cast_insert(p_record in out cast%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
        
        IF p_record.start_date IS NULL THEN
            p_record.start_date  := trunc(sysdate);
        END IF;
        
        cast_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
        
            IF p_record.cast_id IS NULL THEN
                p_record.cast_id  := CAT_SEQ.NEXTVAL;
            END IF;
            
            INSERT INTO cast VALUES p_record;
        END IF;
        
        EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END cast_insert;
    
    PROCEDURE cast_update(p_record in out cast%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
               
        cast_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
            SELECT cast_id 
            INTO p_record.cast_id 
            FROM cast 
            WHERE cast_id = p_record.cast_id
            FOR UPDATE NOWAIT;
            
            UPDATE cast 
            SET cast_name = p_record.cast_name
                ,cast_image = p_record.cast_image
                ,end_date = p_record.end_date
            WHERE cast_id = p_record.cast_id;
            
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END cast_update;

    PROCEDURE gun_validate (p_record in out gun%rowtype
                               ,p_message out varchar2
                               ) is 
    BEGIN
            
        IF p_record.gun_name IS NULL THEN
            p_message   := 'Nome da arma deve ser informado.';
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END gun_validate;

    PROCEDURE gun_insert(p_record in out gun%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
        
        IF p_record.start_date IS NULL THEN
            p_record.start_date  := trunc(sysdate);
        END IF;
        
        gun_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
        
            IF p_record.gun_id IS NULL THEN
                p_record.gun_id  := CAT_SEQ.NEXTVAL;
            END IF;
            
            INSERT INTO gun VALUES p_record;
        END IF;
        
        EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END gun_insert;
    
    PROCEDURE gun_update(p_record in out gun%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
               
        gun_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
            SELECT gun_id 
            INTO p_record.gun_id 
            FROM gun 
            WHERE gun_id = p_record.gun_id
            FOR UPDATE NOWAIT;
            
            UPDATE gun 
            SET gun_name = p_record.gun_name
                ,gun_image = p_record.gun_image
                ,end_date = p_record.end_date
            WHERE gun_id = p_record.gun_id;
            
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END gun_update;
    
    PROCEDURE map_validate (p_record in out map%rowtype
                               ,p_message out varchar2
                               ) is 
    BEGIN
            
        IF p_record.map_name IS NULL THEN
            p_message   := 'Nome da arma deve ser informado.';
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END map_validate;

    PROCEDURE map_insert(p_record in out map%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
        
        IF p_record.start_date IS NULL THEN
            p_record.start_date  := trunc(sysdate);
        END IF;
        
        map_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
        
            IF p_record.map_id IS NULL THEN
                p_record.map_id  := CAT_SEQ.NEXTVAL;
            END IF;
            
            INSERT INTO map VALUES p_record;
        END IF;
        
        EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END map_insert;
    
    PROCEDURE map_update(p_record in out map%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
               
        map_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
            SELECT map_id 
            INTO p_record.map_id 
            FROM map 
            WHERE map_id = p_record.map_id
            FOR UPDATE NOWAIT;
            
            UPDATE map 
            SET map_name = p_record.map_name
                ,map_image = p_record.map_image
                ,end_date = p_record.end_date
            WHERE map_id = p_record.map_id;
            
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END map_update;
    
    PROCEDURE environment_validate (p_record in out environment%rowtype
                               ,p_message out varchar2
                               ) is 
    BEGIN
            
        IF p_record.environment_name IS NULL THEN
            p_message   := 'Nome do ambiente deve ser informado.';
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END environment_validate;

    PROCEDURE environment_insert(p_record in out environment%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
        
        IF p_record.start_date IS NULL THEN
            p_record.start_date  := trunc(sysdate);
        END IF;
        
        environment_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
        
            IF p_record.environment_id IS NULL THEN
                p_record.environment_id  := CAT_SEQ.NEXTVAL;
            END IF;
            
            INSERT INTO environment VALUES p_record;
        END IF;
        
        EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END environment_insert;
    
    PROCEDURE environment_update(p_record in out environment%rowtype
                           ,p_message out varchar2
                           ) is 
    BEGIN    
               
        environment_validate(p_record,p_message);
        
        IF p_message IS NULL THEN
            SELECT environment_id 
            INTO p_record.environment_id 
            FROM environment 
            WHERE environment_id = p_record.environment_id
            FOR UPDATE NOWAIT;
            
            UPDATE environment 
            SET map_id = p_record.map_id
                ,environment_name = p_record.environment_name
                ,position = p_record.position
                ,width = p_record.width
                ,heigth = p_record.heigth
                ,environment_image = p_record.environment_image
                ,environment_door_positions = p_record.environment_door_positions
                ,end_date = p_record.end_date
            WHERE environment_id = p_record.environment_id;
            
        END IF;
        
    EXCEPTION 
    
    WHEN OTHERS THEN 
        p_message:= sqlerrm;
    END environment_update;

    procedure game_create(p_map_name varchar2
                          ,p_player_name varchar2
                          ,p_cast_name varchar2
                          ,p_record out game%rowtype
                          ,p_message out varchar2) is
    l_cast_id number;
    begin
        begin
 
            select map_id
            into p_record.map_id
            from map
            where map_name = p_map_name
            and  end_date is null;
        
        exception
            when no_data_found then
                p_message := 'Mapa não encontrado ou inativo.';
            when too_many_rows then
                p_message := 'Vários mapas encontrados.';
            when others then
                p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;
        
        begin
 
            select cast_id
            into l_cast_id
            from cast
            where cast_name = p_cast_name
            and  end_date is null;
        
        exception
        when no_data_found then
            p_message := 'Personagem não encontrado ou inativo.';
        when too_many_rows then
            p_message := 'Vários personagens encontrados.';
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;
        
        begin
 
            select player_id
            into p_record.master_player_id
            from player
            where player_name = p_player_name
            and  end_date is null;
        
        exception
        when no_data_found then
            p_message := 'Jodador(a) não encontrado(a) ou inativo.';
        when too_many_rows then
            p_message := 'Vários joadores encontrados(as).';
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;
        
        --/*game_insert 
        
        p_record.game_id    := cat_seq.nextval;
        p_record.start_date := sysdate;
        p_record.status     := 0;
        
        INSERT INTO game VALUES p_record;
        
        --game_insert*/

        
        --/*game_content_insert (CAST,ENV,GUN,PLAYER)
        insert into game_content 
        (game_content_id
        ,game_id
        ,content_type
        ,content_id
        )
        select cat_seq.nextval
               ,p_record.game_id
               ,'CAST'
               ,cast_id
        from cast
        where end_date is null;
        
        insert into game_content 
        (game_content_id
        ,game_id
        ,content_type
        ,content_id
        )
        select cat_seq.nextval
               ,p_record.game_id
               ,'ENV'
               ,environment_id
        from environment
        where end_date is null;
        
        insert into game_content 
        (game_content_id
        ,game_id
        ,content_type
        ,content_id
        )
        select cat_seq.nextval
               ,p_record.game_id
               ,'GUN'
               ,gun_id
        from gun
        where end_date is null;
        
        insert into game_content 
        (game_content_id
        ,game_id
        ,content_type
        ,content_id
        ,using_cast_id
        )
        values 
        (cat_seq.nextval
        ,p_record.game_id
        ,'PLAYER'
        ,p_record.master_player_id
        ,l_cast_id
        );
        --game_content_insert*/
        
    exception
        when others then
            p_message:= sqlerrm;
        
    end game_create; 
    
    procedure game_enter(p_game_id number
                        ,p_player_name varchar2
                        ,p_cast_name varchar2
                        ,p_message out varchar2) is
    l_game_id number;
    l_cast_id number;
    l_player_id number;
    begin
        begin
 
            select game_id
            into l_game_id
            from game
            where game_id = p_game_id
            and  status = 0;
    
        exception
        when no_data_found then
            p_message := 'Jogo não encontrado ou inativo.';
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;

        begin
 
            select cast_id
            into l_cast_id
            from cast
            where cast_name = p_cast_name
            and  end_date is null;
    
        exception
        when no_data_found then
            p_message := 'Personagem não encontrado ou inativo.';
        when too_many_rows then
            p_message := 'Vários personagens encontrados.';
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;

        begin
 
            select player_id
            into l_player_id
            from player
            where player_name = p_player_name
            and  end_date is null;
        
        exception
        when no_data_found then
            p_message := 'Jodador(a) não encontrado(a) ou inativo.';
        when too_many_rows then
            p_message := 'Vários joadores encontrados(as).';
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;
        
        begin
 
            select content_id
            into l_player_id
            from game_content
            where content_id = l_player_id
            and content_type = 'PLAYER'
            and game_id = p_game_id;
        
            p_message := 'Jodador(a) já está no jogo.';
            
        exception
        when no_data_found then
           null;
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;
        
        begin
 
            select content_id
            into l_player_id
            from game_content
            where using_cast_id = l_cast_id
            and content_type = 'PLAYER'
            and game_id = p_game_id;
        
            p_message := 'Personagem já está no jogo.';
            
        exception
        when no_data_found then
           null;
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;
        
        insert into game_content 
        (game_content_id
        ,game_id
        ,content_type
        ,content_id
        ,using_cast_id
        )
        values 
        (cat_seq.nextval
        ,p_game_id
        ,'PLAYER'
        ,l_player_id
        ,l_cast_id
        );
        
              
    exception
        when others then
            p_message:= sqlerrm;
        
    end game_enter; 
    
    procedure game_start(p_game_id number
                        ,p_message out varchar2)is
    
    l_game game%rowtype;
    
    begin
        begin
 
            select game_id
            into l_game.game_id
            from game
            where game_id = p_game_id
            and  status = 0
            for update nowait;
            
            l_game.status := 5;
         
         
            for r_shuffle in( 
                
                SELECT DBMS_RANDOM.VALUE random
                      ,content_id
                      ,content_type
                FROM game_content 
                WHERE content_type != 'PLAYER'
                AND game_id = l_game.game_id
                ORDER BY random
            )
            loop
                case r_shuffle.content_type
                    when 'CAST' then
                        l_game.target_cast_id := r_shuffle.content_id;
                    when 'GUN' then
                        l_game.target_gun_id := r_shuffle.content_id;
                    when 'ENV' then
                        l_game.target_environment_id := r_shuffle.content_id;
                    else null;
                end case;
            end loop;


            UPDATE game_content gc
            set gc.content_sequence = dbms_random.value()
            where gc.game_id = l_game.game_id
            and gc.content_id not in ( l_game.target_cast_id,l_game.target_environment_id,l_game.target_gun_id);
                       
            
            insert into player_content 
            select cat_seq.nextval
                  ,pla.player_id
                  ,con.content_id
                  ,l_game.game_id
                  ,pla.player_id
            from (select rownum player_seq
                               ,player_id
                  from (select content_id player_id
                        from game_content
                        where game_id = l_game.game_id
                        and content_type = 'PLAYER'
                        order by content_id
                    )   
                ) pla
            ,(select mod(rownum,(select count(*) 
                                   from game_content
                                  where game_id = l_game.game_id
                                    and content_type = 'PLAYER'))+1 content_seq
            ,content_id
                from(select content_id 
                    from game_content
                    where game_id = l_game.game_id
                    and content_sequence is not null
                    and content_type != 'PLAYER'
                    order by content_sequence
                    )  
            )con
            where con.content_seq = pla.player_seq;     
            
            insert into player_content 
            select cat_seq.nextval
                  ,p.content_id player_id
                  ,gc.content_id
                  ,gc.game_id
                  ,null
            from game_content p
                ,game_content gc
            where p.game_id = l_game.game_id
            and p.content_type = 'PLAYER'
            and gc.game_id = p.game_id
            and gc.content_type != 'PLAYER'
            and not exists (select null 
                            from player_content x
                            where x.game_id = gc.game_id
                            and x.player_id = p.content_id
                            and x.game_content_id = gc.content_id
                            and rownum = 1);


 
           
            UPDATE game 
            SET status = l_game.status
                ,target_cast_id = l_game.target_cast_id
                ,target_environment_id = l_game.target_environment_id
                ,target_gun_id = l_game.target_gun_id
                ,current_player_id = l_game.current_player_id
                ,next_player_id = l_game.next_player_id
            WHERE game_id = l_game.game_id;
            
    
        exception
        when no_data_found then
            p_message := 'Jogo não pode ser iniciado.';
        when others then
            p_message := sqlerrm;
        end;
        
        if p_message is not null then
            return;
        end if;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    end game_start;
END detetive_pk;



















