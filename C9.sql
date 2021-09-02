# Um administrador deseja avaliar o desempenho de médicos, para isso, precisa saber quais foram os valores  médios dos relatos de sintoma dos pacientes de cada médico, ordenados pela maior média de gravidade, para que ele possa avaliar se há alguma discrepância.
# Projeção do nome, ultimo_nome, e crm do medico assim como  máximo dos valores de relatos de sintoma para os paciente de cada medico, a partir da junção das tabelas medico, paciente e relato_sintoma_paciente, agrupada para cada medico, ordenadas por  indice de gravidade médio.
select  avg(gravidade) as media, m.nome, m.ultimo_nome, m.crm
from paciente p, medico m , relato_sintoma_paciente r
where p.medico_crm = m.crm and r.paciente_cpf = p.cpf 
group by m.nome, m.ultimo_nome, m.crm
order by media desc