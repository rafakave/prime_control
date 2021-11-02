# Para executar e testar este script instale a biblioteca FakerLibrary usando o seguinte comando:
#pip install robotframework-faker
***Settings***
Library     SeleniumLibrary
Library     FakerLibrary    locale=en_US

***Variables***
${url}                              http://automationpractice.com
${browser}                          chrome
${click_this_login}                 //a[@class='login'][contains(.,'Sign in')]
${this_email_field}                 //input[@id='email_create']
${click_this_create}                //span[contains(.,'Create an account')]

#FORM FIELDS
${this_firstname_field}             //input[@id='customer_firstname']
${this_lastname_field}              //input[@id='customer_lastname']
${this_passwd_field}                //input[@id='passwd']
${this_address_field}               //input[@id='address1']
${this_city_field}                  //input[@id='city']
${this_postcode_field}              //input[@id='postcode']
${this_state_field}                 //select[@id='id_state']
${this_phone_field}                 //input[@id='phone_mobile']
${click_this_submit_form}           //span[contains(.,'Register')]

***Keywords***
Abrir Navegador
    Open Browser                    ${url}  ${browser}

Clicar em Login
    Click Element                   ${click_this_login}

Inserir Email
    ${random_email}                 FakerLibrary.Email
    Input Text                      ${this_email_field}     ${random_email}

Clicar em Create Account
    Wait Until Element Is Visible   ${click_this_create}
    Click Element                   ${click_this_create}

Preencher Formulario
    #Adicionado "Wait Until Element Is Visible" nos elementos que estavam causando erro na hora de executar o teste.
    Wait Until Element Is Visible   ${this_firstname_field}
    Input Text                      ${this_firstname_field}     Rafa
    Input Text                      ${this_lastname_field}      El
    Input Password                  ${this_passwd_field}        123123
    Input Text                      ${this_address_field}       Rua dos Bobos 0
    Input Text                      ${this_city_field}          Curitiba
    Wait Until Element Is Visible   ${this_postcode_field}
    Input Text                      ${this_postcode_field}      12345
    Input Text                      ${this_phone_field}         +55 11-99999-9999
    Wait Until Element Is Visible   ${this_state_field}/option[contains(., 'Alabama')]
    Click Element                   ${this_state_field}/option[contains(., 'Alabama')]

Exibir Dados do Novo Cliente
    ${firstname}    Get Value       ${this_firstname_field}
    ${lastname}     Get Value       ${this_lastname_field}
    ${email}        Get Value       //input[@data-validate='isEmail']
    ${password}     Get Value       ${this_passwd_field}
    ${address}      Get Value       ${this_address_field}
    ${city}         Get Value       ${this_city_field}
    ${postcode}     Get Value       ${this_postcode_field}
    ${state}        Get Value       ${this_state_field}
    ${phone}        Get Value       ${this_phone_field}

    Log to Console  \nNovo usuário cadastrado\n\nNome: ${firstname}\nSobrenome: ${lastname}\nEmail: ${email}\nPassword: ${password}\nEndereço: ${address}\nCidade: ${city}\nEstado: ${state}\nTelefone: ${phone}

Enviar Formulário
    Click Element                   ${click_this_submit_form}

***Test Cases***
Cenário: cadastrar cliente
    Abrir Navegador
    Clicar em Login
    Inserir Email
    Clicar em Create Account
    Preencher Formulario
    Exibir Dados do Novo Cliente
    Enviar Formulário