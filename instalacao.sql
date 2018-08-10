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
    add('Amanda Peres');

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
--/*Instala CAST 
DECLARE
    set_record cast%rowtype;
    m long;
    l_blob blob;
    l_bfile bfile;
    
    type r_img is record(name varchar2(100)
                        ,image_name varchar2(100)
                        ,short_image_name varchar2 (100)
                        );                                                  
    type t_img is table of r_img;
    imagens t_img := t_img();

    procedure add   (lp_name varchar2
                    ,lp_image_name varchar2
                    ,lp_short_image_name varchar2
                    )is
    begin  
        imagens.extend;
        imagens(imagens.count).name := lp_name;
        imagens(imagens.count).image_name := lp_image_name;
        imagens(imagens.count).short_image_name := lp_short_image_name;
    end add;

BEGIN
    add('Coronel Mustard','Coronel Mustard.png','Coronel Mustarda Short.png');
    add('Dona Branca','Dona Branca.png','Dona Branca Short.png');
    add('Professor Black','Professor Black.png','Professor Black Short.png');
    add('Senhor Green','Senhor Green.png','Senhor Green Short.png');
    add('Senhora Violeta','Senhora Violeta.png','Senhora Violeta Short.png');
    add('Senhorita Rosa','Senhorita Rosa.png','Senhorita Rosa Short.png');
    delete cast;
    for i in 1 .. imagens.count
    loop
        set_record := null;
        set_record.cast_image       :=  empty_blob();
        set_record.cast_short_image :=  empty_blob();
        set_record.cast_name        :=  imagens(i).name;
        detetive_pk.cast_insert(set_record,m);
        select * 
        into set_record 
        from cast 
        where cast_id = set_record.cast_id for update;
        l_bfile := bfilename('DIR_FIGURAS',imagens(i).image_name);
        dbms_lob.fileopen(l_bfile);
        DBMS_LOB.loadfromfile(set_record.cast_image,L_BFILE,DBMS_LOB.GETLENGTH(l_bfile));
        DBMS_LOB.loadfromfile(set_record.cast_short_image,L_BFILE,DBMS_LOB.GETLENGTH(l_bfile));
        dbms_lob.fileclose(l_bfile);
        IF m is not null THEN
            DBMS_OUTPUT.PUT_LINE(m);
        END IF;
    END LOOP;
END;
/
--Instala Cast*/
--/* Instala Gun
DECLARE
    set_record gun%rowtype;
    m long;
    l_blob blob;
    l_bfile bfile;
    
    type r_img is record(name varchar2(100)
                        ,image_name varchar2(100)
                        );                                                  
    type t_img is table of r_img;
    imagens t_img := t_img();

    procedure add   (lp_name varchar2
                    ,lp_image_name varchar2
                    )is
    begin  
        imagens.extend;
        imagens(imagens.count).name := lp_name;
        imagens(imagens.count).image_name := lp_image_name;
    end add;

BEGIN

    add('Revolver','Revolver.jpg');
    add('Faca','Faca.jpg');
    add('Corda','Corda.jpg');
    add('Chave Inglesa','Chave Inglesa.jpg');
    add('Castiçal','Castical.jpg');
    add('Cano','Cano.jpg');
    delete gun;
    for i in 1 .. imagens.count
    loop
        set_record := null;
        set_record.gun_image     :=  empty_blob();
        set_record.gun_name      :=  imagens(i).name;
        detetive_pk.gun_insert(set_record,m);
        IF m is not null THEN
            DBMS_OUTPUT.PUT_LINE(m);
        END IF;
        select * 
        into set_record 
        from gun 
        where gun_id = set_record.gun_id for update;
        l_bfile := bfilename('DIR_FIGURAS',imagens(i).image_name);
        dbms_lob.fileopen(l_bfile);
        dbms_lob.loadfromfile(set_record.gun_image,L_BFILE,DBMS_LOB.GETLENGTH(l_bfile));
        dbms_lob.fileclose(l_bfile);
        IF m is not null THEN
            DBMS_OUTPUT.PUT_LINE(m);
        END IF;
    END LOOP;
END;
/
--Instala Gun*/


--/*Instala Map an Environment
DECLARE

    set_record map%rowtype;
    set_recordE environment%rowtype;
    m long;
    l_blob blob;
    l_bfile bfile;
    
    type r_img is record(name varchar2(100)
                        ,image_name varchar2(100)
                        ,doors coordenadas
                        );                                                  
    type t_img is table of r_img;
    imagens t_img := t_img();

    procedure add   (lp_name varchar2
                    ,lp_image_name varchar2
                    ,lp_doors coordenadas default null
                    )is
    begin  
        imagens.extend;
        imagens(imagens.count).name := lp_name;     
        imagens(imagens.count).image_name := lp_image_name;
        imagens(imagens.count).doors := lp_doors;
    end add;
    
    procedure addpos(lp_coord coordenada
                    )is
    begin
        set_record.map_positions.extend;
        set_record.map_positions(set_record.map_positions.count) := lp_coord;
    end addpos;
    
    procedure addstart(lp_coord coordenada
                    )is
    begin
        set_record.cast_start_positions.extend;
        set_record.cast_start_positions(set_record.cast_start_positions.count) := lp_coord;
    end addstart;
    
    
BEGIN

    add('Mansão do Wellysnelson','map.png');
    delete map;
    for i in 1 .. imagens.count
    loop
        set_record := null;
        set_record.map_image            :=  empty_blob();
        set_record.map_name             :=  imagens(i).name;
        set_record.map_positions        :=  coordenadas();
        set_record.cast_start_positions :=  coordenadas();
        
        addstart(coordenada(10,1));
        addstart(coordenada(1,7));
        addstart(coordenada(1,20));
        addstart(coordenada(17,25));
        addstart(coordenada(24,18));
        addstart(coordenada(15,1));
        
        addpos(coordenada(1,7));
        addpos(coordenada(1,20));
        addpos(coordenada(2,7));
        addpos(coordenada(2,8));
        addpos(coordenada(2,14));
        addpos(coordenada(2,20));
        addpos(coordenada(2,21));
        addpos(coordenada(3,7));
        addpos(coordenada(3,8));
        addpos(coordenada(3,14));
        addpos(coordenada(3,20));
        addpos(coordenada(3,21));
        addpos(coordenada(4,7));
        addpos(coordenada(4,8));
        addpos(coordenada(4,14));
        addpos(coordenada(4,20));
        addpos(coordenada(4,21));
        addpos(coordenada(5,7));
        addpos(coordenada(5,8));
        addpos(coordenada(5,14));
        addpos(coordenada(5,20));
        addpos(coordenada(5,21));
        addpos(coordenada(6,7));
        addpos(coordenada(6,8));
        addpos(coordenada(6,14));
        addpos(coordenada(6,20));
        addpos(coordenada(6,21));
        addpos(coordenada(7,3));
        addpos(coordenada(7,4));
        addpos(coordenada(7,5));
        addpos(coordenada(7,6));
        addpos(coordenada(7,7));
        addpos(coordenada(7,8));
        addpos(coordenada(7,9));
        addpos(coordenada(7,10));
        addpos(coordenada(7,11));
        addpos(coordenada(7,12));
        addpos(coordenada(7,13));
        addpos(coordenada(7,14));
        addpos(coordenada(7,15));
        addpos(coordenada(7,19));
        addpos(coordenada(7,20));
        addpos(coordenada(7,21));
        addpos(coordenada(8,2));
        addpos(coordenada(8,3));
        addpos(coordenada(8,4));
        addpos(coordenada(8,5));
        addpos(coordenada(8,6));
        addpos(coordenada(8,7));
        addpos(coordenada(8,8));
        addpos(coordenada(8,9));
        addpos(coordenada(8,10));
        addpos(coordenada(8,11));
        addpos(coordenada(8,12));
        addpos(coordenada(8,13));
        addpos(coordenada(8,14));
        addpos(coordenada(8,15));
        addpos(coordenada(8,16));
        addpos(coordenada(8,17));
        addpos(coordenada(8,18));
        addpos(coordenada(8,19));
        addpos(coordenada(8,20));
        addpos(coordenada(8,21));
        addpos(coordenada(8,22));
        addpos(coordenada(8,23));
        addpos(coordenada(8,24));
        addpos(coordenada(8,25));
        addpos(coordenada(9,2));
        addpos(coordenada(9,9));
        addpos(coordenada(9,10));
        addpos(coordenada(9,11));
        addpos(coordenada(9,12));
        addpos(coordenada(9,13));
        addpos(coordenada(9,14));
        addpos(coordenada(9,15));
        addpos(coordenada(9,16));
        addpos(coordenada(9,17));
        addpos(coordenada(9,18));
        addpos(coordenada(9,19));
        addpos(coordenada(9,20));
        addpos(coordenada(9,21));
        addpos(coordenada(9,22));
        addpos(coordenada(9,23));
        addpos(coordenada(9,24));
        addpos(coordenada(10,1));
        addpos(coordenada(10,2));
        addpos(coordenada(10,9));
        addpos(coordenada(10,10));
        addpos(coordenada(10,18));
        addpos(coordenada(11,9));
        addpos(coordenada(11,10));
        addpos(coordenada(11,18));    
        addpos(coordenada(12,9));
        addpos(coordenada(12,10));
        addpos(coordenada(12,18));
        addpos(coordenada(13,9));
        addpos(coordenada(13,10));
        addpos(coordenada(13,18));        
        addpos(coordenada(14,9));
        addpos(coordenada(14,10));
        addpos(coordenada(14,18));   
        addpos(coordenada(15,1));
        addpos(coordenada(15,2));
        addpos(coordenada(15,9));
        addpos(coordenada(15,10));
        addpos(coordenada(15,11));
        addpos(coordenada(15,12));
        addpos(coordenada(15,13));
        addpos(coordenada(15,14));
        addpos(coordenada(15,15));
        addpos(coordenada(15,16));
        addpos(coordenada(15,17));
        addpos(coordenada(15,18));
        addpos(coordenada(16,2));
        addpos(coordenada(16,9));
        addpos(coordenada(16,10));
        addpos(coordenada(16,11));
        addpos(coordenada(16,12));
        addpos(coordenada(16,13));
        addpos(coordenada(16,14));
        addpos(coordenada(16,15));
        addpos(coordenada(16,16));
        addpos(coordenada(16,17));
        addpos(coordenada(16,18));
        addpos(coordenada(16,19));
        addpos(coordenada(16,20));
        addpos(coordenada(16,21));
        addpos(coordenada(16,22));
        addpos(coordenada(16,23));
        addpos(coordenada(16,24));
        addpos(coordenada(17,2));
        addpos(coordenada(17,3));
        addpos(coordenada(17,4));
        addpos(coordenada(17,5));
        addpos(coordenada(17,6));
        addpos(coordenada(17,7));
        addpos(coordenada(17,8));
        addpos(coordenada(17,9));
        addpos(coordenada(17,10));
        addpos(coordenada(17,17));
        addpos(coordenada(17,18));
        addpos(coordenada(17,19));
        addpos(coordenada(17,20));
        addpos(coordenada(17,21));
        addpos(coordenada(17,23));
        addpos(coordenada(17,24));
        addpos(coordenada(17,25));
        addpos(coordenada(18,3));
        addpos(coordenada(18,4));
        addpos(coordenada(18,5));
        addpos(coordenada(18,6));
        addpos(coordenada(18,7));
        addpos(coordenada(18,8));
        addpos(coordenada(18,9));
        addpos(coordenada(18,10));
        addpos(coordenada(18,17));
        addpos(coordenada(18,18));
        addpos(coordenada(18,19));
        addpos(coordenada(19,8));
        addpos(coordenada(19,9));
        addpos(coordenada(19,10));
        addpos(coordenada(19,17));
        addpos(coordenada(19,18));
        addpos(coordenada(19,19));
        addpos(coordenada(20,8));
        addpos(coordenada(20,9));
        addpos(coordenada(20,17));
        addpos(coordenada(20,18));
        addpos(coordenada(20,19));
        addpos(coordenada(21,8));
        addpos(coordenada(21,9));
        addpos(coordenada(21,17));
        addpos(coordenada(21,18));
        addpos(coordenada(21,19));
        addpos(coordenada(22,8));
        addpos(coordenada(22,9));
        addpos(coordenada(22,17));
        addpos(coordenada(22,18));
        addpos(coordenada(22,19));
        addpos(coordenada(23,8));
        addpos(coordenada(23,9));
        addpos(coordenada(23,17));
        addpos(coordenada(23,18));
        addpos(coordenada(23,19));
        addpos(coordenada(24,8));
        addpos(coordenada(24,18));

        detetive_pk.map_insert(set_record,m);
        IF m is not null THEN
            DBMS_OUTPUT.PUT_LINE(m);
        END IF;
        select * 
        into set_record 
        from map 
        where map_id = set_record.map_id for update;
        l_bfile := bfilename('DIR_FIGURAS',imagens(i).image_name);
        dbms_lob.fileopen(l_bfile);
        dbms_lob.loadfromfile(set_record.map_image,L_BFILE,DBMS_LOB.GETLENGTH(l_bfile));
        dbms_lob.fileclose(l_bfile);
        
        --/*Environment
        imagens := t_img();
        
        add('Sala1 do Wellysnelson','map.png',coordenadas(coordenada(6,6)));     
        add('Sala2 do Wellysnelson','map.png',coordenadas(coordenada(7,10),coordenada(2,14)));
        add('Sala3 do Wellysnelson','map.png',coordenadas(coordenada(4,14),coordenada(8,17)));
        add('Sala4 do Wellysnelson','map.png',coordenadas(coordenada(7,21)));
        add('Sala5 do Wellysnelson','map.png',coordenadas(coordenada(8,6),coordenada(10,9),coordenada(15,9),coordenada(17,6)));
        add('Sala6 do Wellysnelson','map.png',coordenadas(coordenada(9,21),coordenada(12,18),coordenada(13,18)));
        add('Sala7 do Wellysnelson','map.png',coordenadas(coordenada(20,8)));
        add('Sala8 do Wellysnelson','map.png',coordenadas(coordenada(16,13),coordenada(18,17)));
        add('Sala9 do Wellysnelson','map.png',coordenadas(coordenada(18,19)));
        
        delete environment;
        for j in 1 .. imagens.count
        loop
        
            set_recordE := null;
            set_recordE.environment_image             :=  empty_blob();
            set_recordE.environment_name              :=  imagens(j).name;
            set_recordE.environment_door_positions    :=  imagens(j).doors;
            set_recordE.map_id                        :=  set_record.map_id;
        
            detetive_pk.environment_insert(set_recordE,m);

            select * 
            into set_recordE 
            from environment 
            where environment_id = set_recordE.environment_id for update;
            
            l_bfile := bfilename('DIR_FIGURAS',imagens(j).image_name);
            dbms_lob.fileopen(l_bfile);
            dbms_lob.loadfromfile(set_recordE.environment_image,L_BFILE,DBMS_LOB.GETLENGTH(l_bfile));
            dbms_lob.fileclose(l_bfile);
            
            IF m is not null THEN
                DBMS_OUTPUT.PUT_LINE(m);
            END IF;
        END LOOP;
        --Environment*/        
    END LOOP;
END;
/
--Instala Map and Environment*/
--Instala 
/*
SELECT * FROM CAST;
SELECT * FROM MAP;
SELECT * FROM GUN;
SELECT * FROM PLAYER;
SELECT * FROM ENVIRONMENT;
*/