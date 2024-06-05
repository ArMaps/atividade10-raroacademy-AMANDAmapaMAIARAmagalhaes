*** Settings ***
Resource   ../base.robot

*** Keywords ***
Espera o elemento e verifica o atributo
    [Arguments]    ${elemento}    ${atributo}    ${valor_atributo}
    Wait Until Element Is Visible        ${elemento}
    Element Attribute Should Match       ${elemento}    ${atributo}    ${valor_atributo}    regexp=true

Espera o elemento e verifica o elemento
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Element Should Be Visible        ${elemento}

Espera o elemento e clica no elemento
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}    ${TIMEOUT}
    Click Element    ${elemento}

Espera o elemento e insere texto
    [Arguments]    ${elemento}    ${texto}
    Wait Until Element Is Visible    ${elemento}
    Input Text    ${elemento}    ${texto}

 Espera e limpa o texto
     [Arguments]    ${elemento} 
     Wait Until Element Is Visible    ${elemento}
     Clear Text       ${elemento}

Espera o elemento e verifica texto
    [Arguments]    ${elemento}    ${texto}
    Wait Until Element Is Visible    ${elemento}    timeout=${TIMEOUT}
    Element Should Contain Text      ${elemento}    ${texto} 