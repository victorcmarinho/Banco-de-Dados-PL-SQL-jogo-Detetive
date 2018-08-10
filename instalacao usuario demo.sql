--/*Instala player 
DECLARE
    
    set_record player%rowtype;
    m long;  
    
    type r_img is record(name varchar2(100)
                        );                                                  
    type t_img is table of r_img;
    players t_img := t_img();

    procedure add   (lp_name varchar2)is
    begin  
        players.extend;
        players(players.count).name := lp_name;
    end add;

BEGIN

    add('Victor Marinho');
    add('Francisco Peres');
    add('Estefane Peres');
    add('Leandro Buzati');
    add('Eduardo Moraes');

    delete player;
    for i in 1 .. players.count
    loop
        set_record              := null;
        set_record.player_name  :=  players(i).name;
        set_record.password     :=  players(i).name;
        detetive_pk.player_insert(set_record,m);
        
        IF m is not null THEN
            DBMS_OUTPUT.PUT_LINE(m);
        END IF;
        
    END LOOP;
END;
/
--Instala Player*/
