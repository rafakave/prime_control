# O exercício pede para exibir um email no formato "$nome_$sobrenome_$idade@robot.com",
# sendo cada um dos elementos iniciados por $ argumentos de função
***Keywords***
Criar Email
    [Arguments]  ${nome}  ${sobrenome}  ${idade}
    ${email}  Catenate  ${nome}_${sobrenome}_${idade}@robot.com

    [Return]  ${email}

***Test Cases***
Cenario: teste de criacao de email
    ${test}  Criar Email  billy  graham    99
    Log To Console  \nImprimindo email: ${test}
    #resultado Imprimindo email: billy_graham_99@robot.com