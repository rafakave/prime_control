***Settings***
Library  SeleniumLibrary

***Variables***
${url}                  http://automationpractice.com
${browser}              chrome
${searchbox_input}      //input[contains(@id,'search_query_top')]
${search_for_this}      itemNãoExistente
${submit_form}          //form[contains(@id,'searchbox')]
${form_result_xpath}    //span[@class='heading-counter']

***Keywords***
Abrir Navegador
    Open Browser        ${url}  ${browser}

Inserir Texto de Busca
    Input Text          ${searchbox_input}  ${search_for_this}

Enviar Formulário de Busca
    Submit Form         ${submit_form}

Exibir Resultado da Busca
    ${form_result}          Element Text Should Be    ${form_result_xpath}     0 results have been found.
    ${produto_encontrado}   GetText     ${form_result_xpath}
    Log To Console          \nProduto: ${search_for_this}\nQuantidade: ${produto_encontrado}

***Test Cases***
Cenário: pesquisar item inexistente
    Abrir Navegador
    Inserir Texto de Busca
    Enviar Formulário de Busca
    Exibir Resultado da Busca