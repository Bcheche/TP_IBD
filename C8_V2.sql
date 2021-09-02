#Um pesquisador deseja estudar a correlação entre as condições dos pacientes e seus sintomas graves reportados desde 2010, para isso precisará de uma tabela denormalizada contendo as condições e os sintomas reportados.
#Faremos então uma projeção de codigo_icd (condicao) e codigo_ctcae (sintoma) a partir da junção das tabelas condicao_paciente, paciente e relato_sintoma_paciente em que gravidade >=4 e inicado_em >= 2010.
explain analyze select cp.condicao_codigo_icd, r.sintoma_codigo_ctcae 
from relato_sintoma_paciente r, paciente p, condicao_paciente cp
where cp.paciente_cpf = p.cpf and r.paciente_cpf = p.cpf and r.gravidade >=4 and r.iniciado_em >= '2010-01-01'