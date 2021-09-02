# Um médico deseja ter uma lista online de todos os seus pacientes com seus respectivos nomes, ultimo nomes, data de nascimento e cpf. Seleção do nome, ultimo_nome, data_nascimento da junção das tabelas medico e paciente com base no crm do medico para o médico que possui o crm: 'aIOfy3016166'
explain analyze select p.nome, p.ultimo_nome, p.data_nascimento, p.cpf, m.crm
from medico m join paciente p
on m.crm = p.medico_crm
where m.crm = 'aIOfy3016166'
