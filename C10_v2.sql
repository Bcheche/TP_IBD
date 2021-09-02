#O administrador do hospital deseja saber quais médicos possuem apenas 1 telefone de contato no banco de dados para que possa requerer o cadastro de mais um.
#Para isso, iremos fazer fazer a projeção do nome, ultimo_nome e crm dos medicos que possuem contagem de telefones cadastrados iguais a 1 pela junção da tabela medico e telefone.
select m.nome, m.ultimo_nome, m.crm, count(t.telefone) as contagem
from telefone_de_contato t
join medico m on m.crm = t.medico_crm 
group by m.nome, m.ultimo_nome, m.crm
having contagem = 1