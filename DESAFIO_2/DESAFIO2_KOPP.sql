CREATE TABLE situ_remessa(
	id_situacao SERIAL primary key,
	criada TIMESTAMP,
	expedida TIMESTAMP,
	aceita CHAR(5),
	nao_aceita CHAR (5)
);

select *
	from situ_remessa;

CREATE TABLE tab_remessa(
	id_remessa SERIAL primary key,
	total_infracoes INTEGER,
	situacao INTEGER REFERENCES situ_remessa (id_situacao)
);

select *
	from tab_remessa;

CREATE TABLE tab_infracoes (
	id_infracoes SERIAL primary key,
	id_remessa INTEGER REFERENCES tab_remessa (id_remessa),
	data_e_hora_infra TIMESTAMP,
	equipamento CHAR (10),
	velocidade_permitida DECIMAL(5,2),
	velocidade_medida DECIMAL(5,2),
	infra_valida BOOLEAN
);

select *
	from tab_infracoes;

//////////////////////BUSCA 1////////////////////////////////////
SELECT tab_infracoes.velocidade_medida, 
	   tab_infracoes.velocidade_permitida,
	   tab_infracoes.data_e_hora_infra,
	   tab_infracoes.id_infracoes
	FROM tab_infracoes
	JOIN tab_remessa ON id_infracoes = tab_remessa.id_remessa
WHERE
    velocidade_medida >= 1.2 * velocidade_permitida
ORDER BY data_e_hora_infra;

/////////////////////BUSCA 2/////////////////////////////////////

SELECT tab_remessa.id_remessa, 
	   situ_remessa, 
	   tab_remessa.total_infracoes,
	   COUNT(CASE WHEN tab_infracoes.infra_valida THEN 1 END) AS total_infracoes_validas,
	   COUNT(CASE WHEN NOT tab_infracoes.infra_valida THEN 1 END) AS total_infracoes_invalidas
	FROM 
		tab_remessa 
	JOIN 
		situ_remessa ON tab_remessa.situacao = situ_remessa.id_situacao
	LEFT JOIN
    	tab_infracoes ON tab_remessa.id_remessa = tab_infracoes.id_remessa
	GROUP BY
    	tab_remessa.id_remessa, situ_remessa.id_situacao, tab_remessa.total_infracoes
ORDER BY id_situacao, criada, expedida, aceita, nao_aceita;