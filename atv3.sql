/*QUESTÃO 1*/

DELIMITER $$
CREATE FUNCTION cadastroAluno(
    cod_curso INT,
    dat_nasc DATE, 
    tot_cred INT, 
    mgp DOUBLE(10,2), 
    nom_alun VARCHAR(60), 
    email VARCHAR(30))

RETURNS VARCHAR(60)
DETERMINISTIC

BEGIN
	INSERT INTO aluno(
    cod_curso,
		dat_nasc, 
        tot_cred, 
        mgp, 
        nom_alun, 
        email) VALUES(cod_curso,
		dat_nasc, 
        tot_cred, 
        mgp, 
        nom_alun, 
        email);
	RETURN nom_alun;
END$$
DELIMITER ;

SELECT cadastroAluno(Null, '2001-08-24', 30, 4, 'carlos', 'carlosaugusto@gmail.com') AS Nome_do_Aluno;

/*QUESTÃO 2*/

DELIMITER //
CREATE PROCEDURE sequencia()
BEGIN
DECLARE conta 
TINYINT UNSIGNED DEFAULT 1;
DECLARE str VARCHAR(30) DEFAULT "";

WHILE conta < 6 DO
	set str = concat(str, conta, ",");
    SET conta = conta + 1;
END WHILE;

select str;
END//
DELIMITER ;

CALL sequencia();

/*QUESTÃO 3*/

DELIMITER $$
CREATE PROCEDURE sequencia_repeat()
begin
	declare result 
    varchar (30) default "";
    declare soma
    int default 1  ;
    repeat
		set result = concat(result, soma, "," );
        set soma = soma + 1;
        until soma > 9
    end repeat;
    
    select result;
END $$
DELIMITER ; 

CALL sequencia_repeat();
