# Um médico cujo crm é 'ChjOT3547341' deseja saber quais são seus pacientes que tiveram sintomas com grau >= 4 para sua análise.
# Projeção do nome, ultimo_nome e cpf dos pacientes por meio da junção com medicos pelo crm e pela junção com os relatos pelo cpf do paciente, filtradas pela gravidade do sintoma >=4 e pelo crm = 'ChjOT3547341'.
explain analyze select p.nome, p.ultimo_nome, p.cpf
from paciente p
join medico m on p.medico_crm = m.crm
join relato_sintoma_paciente r on r.paciente_cpf = p.cpf
where r.gravidade >= 4 and m.crm = 'ChjOT3547341'
