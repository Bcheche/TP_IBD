# Aqui temos uma consulta simples na qual por exemplo, um operador do sistema deseja ver os dados de todos os pacientes cadastrados no sistema, portanto ele irá requisitar todos os dados dos pacientes cadastrados no sistema.
explain analyze select cpf, data_nascimento, nome, ultimo_nome, medico_crm from paciente
