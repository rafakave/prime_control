***Variables***
@{frutas}   abacaxi  banana  caju  damasco  embauba  figo

***Test Cases***
Cenario: variavel lista de frutas
    Log To Console  \nFrutas: @{frutas}
    #Resultado: Frutas: ['abacaxi', 'banana', 'caju', 'damasco', 'embauba', 'figo']


***Variables***
@{pessoa}   Rafael  20  Curitiba    Parana  41999998888 dev 

***Test Cases***
Cenario: variavel pessoa
    Log To Console  \nDados Pessoais do Rafael: @{pessoa}
    #Resultado: Dados Pessoais do Rafael: ['Rafael', '20', 'Curitiba', 'Parana', '41999998888 dev']