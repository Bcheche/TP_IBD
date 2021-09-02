# Um médico abriu seu painel de acompanhamento de pacientes e clicou em um paciente específico, abrindo a aba de histórico de sintomas. Ele deseja ver o histórico completo de sintomas reportados, a data de início e fim, quais foram e suas repectivas gravidades por meio de uma timeline. O paciente possui o cpf: 11112882
# Para isso, selecionar gravidade, datas de inicio e fim, nome e codigo do sintoma, da junção de relatos, sintomas e paciente para um paciente com cpf específico.
explain analyze select r.gravidade, r.iniciado_em, r.encerrado_em, s.nome, s.codigo_ctcae
from relato_sintoma_paciente r
 join paciente p on p.cpf = r.paciente_cpf 
 join sintoma s on s.codigo_ctcae = r.sintoma_codigo_ctcae
where r.paciente_cpf = p.cpf and r.sintoma_codigo_ctcae = s.codigo_ctcae and cpf = 11112872