# Deseja-se saber quais são os pacientes já fizeram reportes de sintomas de gravidade 4 ou maior. Projeção do nome, ultimo_nome e cpf, dos pacientes, na junção da tabela paciente com relato_sintoma_paciente
explain analyze select p.nome, p.ultimo_nome, p.data_nascimento, p.cpf
from relato_sintoma_paciente r join paciente p
on p.cpf = r.paciente_cpf
where r.gravidade >= 4 
