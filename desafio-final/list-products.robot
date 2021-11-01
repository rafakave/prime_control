***Settings***
Library  SeleniumLibrary

***Variables***
${url}                      http://automationpractice.com
${browser}                  chrome
${this_menu}                //a[@title='Women']
${click_this}               (//a[@href='http://automationpractice.com/index.php?id_category=11&controller=category'][contains(.,'Summer Dresses')])[1]
${products_found_xpath}     //span[@class='heading-counter']
${category_name_xpath}      //span[contains(@class,'category-name')]
${category_desc_xpath}      //div[@class='rte']

***Keywords***
Abrir Navegador
    Open Browser        ${url}  ${browser}

Passar o Mouse Sobre o Menu
    Mouse Over          ${this_menu}

Clicar no Submenu
    Click Element          ${click_this}

Exibir Resultado da Busca
    ${quantity_products_found}  GetText     ${products_found_xpath}
    ${category_name}            GetText     ${category_name_xpath}
    ${category_desc}            GetText     ${category_desc_xpath}
    Log To Console          \nCategory Name: ${category_name}\nCategory Description:${category_desc}\nQuantity: ${quantity_products_found}

***Test Cases***
Cenário: clicar em submenu para exibir itens
    Abrir Navegador
    Passar o Mouse Sobre o Menu
    Clicar no Submenu
    Exibir Resultado da Busca