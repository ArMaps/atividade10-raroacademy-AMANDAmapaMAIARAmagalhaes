*** Settings ***
Resource   ../base.robot

*** Variables ***
${HOME_PAGE}                id=br.com.pztec.estoque:id/todoObjeto

${NOVO_BTN}                 id=br.com.pztec.estoque:id/Button1
${PRODUTO_TXT}              id=br.com.pztec.estoque:id/textView3

${INPUT_CODIGO}             id=br.com.pztec.estoque:id/txt_codigo

${INPUT_DESCRICAO}          id=br.com.pztec.estoque:id/txt_descricao

${INPUT_UNIDADE}            id=br.com.pztec.estoque:id/txt_unidade

${INPUT_QUANTIDADE}         id=br.com.pztec.estoque:id/txt_quantidade

${INPUT_VALUNIT}            id=br.com.pztec.estoque:id/txt_valunit

${INPUT_LOTE}               id=br.com.pztec.estoque:id/txt_lote

${TELA_CADASTRO}            id=br.com.pztec.estoque:id/scrollView1
${CALENDARIO_BTN}           id=br.com.pztec.estoque:id/data

${SALVAR_BTN}               id=br.com.pztec.estoque:id/btn_gravar_assunto
${PROD_PESQUISADO}          xpath=//android.widget.TextView[@text="tenis"]
${ID_PRODUTO}               id=br.com.pztec.estoque:id/txt_idprod
${CODIGO}                   xpath=//android.widget.TextView[@text="Código"]
${DESCRICAO}                id=new UiSelector().text("Descrição")
${GRUPO}                    xpath=//android.widget.TextView[@text="Grupo"]
${UNIDADE}                  xpath=//android.widget.TextView[@text="Unidade"]
${QUANTIDADE}               xpath=//android.widget.TextView[@text="Quantidade"]
${QUANTIDADE_ESTOQUE}       id=br.com.pztec.estoque:id/txt_quantidade
${VALOR}                    xpath=//android.widget.TextView[@text="Val.Unit."]
${LOTE}                     xpath=//android.widget.TextView[@text="Lote"]
${DELETAR}                  id=br.com.pztec.estoque:id/deletar
${SIM_DELETAR}              id=android:id/button1
${EDITAR}                   id=br.com.pztec.estoque:id/editar
${ENTRADA}                  id=br.com.pztec.estoque:id/entrada
${ADD_ESTOQUE_TXT}          xpath=(//android.widget.TextView[@text="Adicionar estoque"])[2]
${ADD_ESTOQUE}              id=br.com.pztec.estoque:id/txt_qtdentrada
${DIMINUIR_ESTOQUE_TXT}     xpath=(//android.widget.TextView[@text="Diminuir estoque"])[2]
${DIMINUIR_ESTOQUE}         id=br.com.pztec.estoque:id/txt_qtdsaida
${SAIDA}                    id=br.com.pztec.estoque:id/saida
${MENSAGEM}                 id=android:id/message
${SALVAR_ALTERACOES}        id=br.com.pztec.estoque:id/btn_salvar

${PESQUISA_BTN}             id=android:id/search_button
${LOCALIZAR}                id=android:id/search_src_text

*** Keywords ***

Dado que o usuário esta na tela de cadastro de Produto
    Espera o elemento e clica no elemento    ${NOVO_BTN}

Quando insere os dados necessários
    [Arguments]    ${descricao}    ${qtd}    ${valunit}
    Wait Until Keyword Succeeds    5    1        Espera o elemento e insere texto    ${INPUT_DESCRICAO}    ${descricao}
    Input Text    ${INPUT_QUANTIDADE}    ${qtd}
    Input Text    ${INPUT_VALUNIT}    ${valunit}

E insere os demais dados
    [Arguments]    ${codprod}    ${unid}    ${loteprd}
    Input Text    ${INPUT_CODIGO}    ${codprod}
    Input Text    ${INPUT_UNIDADE}    ${unid}
    Hide Keyboard
    Input Text    ${INPUT_LOTE}    ${loteprd}
    
Então um novo produto é cadastrado
    Click Element    ${SALVAR_BTN}
    Wait Until Element Is Visible    ${ID_PRODUTO}
    ${cod}    Get Element Attribute    ${ID_PRODUTO}    text
    Element Text Should Be    //android.widget.TextView[@text="${cod}"]    ${cod}

Cadastro de produto Template
    [Arguments]    ${descricao}    ${qtd}    ${valunit}
    Dado que o usuário esta na tela de cadastro de Produto
    Quando insere os dados necessários    ${descricao}    ${qtd}    ${valunit}
    Então um novo produto é cadastrado

Dado que o usuário possui produto cadastrado
    Dado que o usuário esta na tela de cadastro de Produto
    Quando insere os dados necessários    Xbox Series X    20    3800
    Então um novo produto é cadastrado
    
Quando clica em editar
    Espera o elemento e clica no elemento    ${EDITAR}

E insere as informações a serem alteradas
    Espera o elemento e verifica o elemento       ${PRODUTO_TXT} 
    Espera e limpa o texto                        ${INPUT_DESCRICAO}
    Input Text                                    ${INPUT_DESCRICAO}    Playstation 5
    
Então o produto é editado com sucesso
    Click Element    ${SALVAR_BTN}
    Espera o elemento e verifica o elemento    ${NOVO_BTN}
    Espera o elemento e verifica texto    ${INPUT_DESCRICAO}    Playstation 5

Quando clica em entrada
    Espera o elemento e clica no elemento    ${ENTRADA}

E insere a quantidade de produto desejada
    Espera o elemento e verifica o elemento       ${ADD_ESTOQUE_TXT} 
    Input Text                                    ${ADD_ESTOQUE}    5

Então a quantidade é alterada com sucesso
    Click Element    ${SALVAR_ALTERACOES}
    Espera o elemento e verifica o elemento    ${QUANTIDADE}
    Espera o elemento e verifica texto    ${QUANTIDADE_ESTOQUE}    25

Quando clica em saída
    Espera o elemento e clica no elemento    ${SAIDA}

E insere a quantidade de produto que deseja retirar do estoque
    Espera o elemento e verifica o elemento       ${DIMINUIR_ESTOQUE_TXT} 
    Input Text                                    ${DIMINUIR_ESTOQUE}    10

Então a quantidade é diminuída com sucesso
    Click Element    ${SALVAR_ALTERACOES}
    Espera o elemento e verifica o elemento    ${QUANTIDADE}
    Espera o elemento e verifica texto    ${QUANTIDADE_ESTOQUE}    10

E retira todo o estoque
    Espera o elemento e verifica o elemento       ${DIMINUIR_ESTOQUE_TXT} 
    Input Text                                    ${DIMINUIR_ESTOQUE}    21

Então visualiza uma mensagem
    Click Element    ${SALVAR_ALTERACOES}
    Espera o elemento e verifica texto    ${MENSAGEM}    Estoque insuficiente

Quando clica em deletar
    Click Element    ${DELETAR}

E confirma
    Espera o elemento e verifica texto    ${MENSAGEM}    Confirma exclusão?
    Click Element    ${SIM_DELETAR}

Então retorna a página inicial
    Espera o elemento e verifica o elemento    ${HOME_PAGE}

Adiciona produto ao aplicativo 
    [Arguments]    ${descricao}    ${qtd}    ${valunit}
    Dado que o usuário esta na tela de cadastro de Produto
    Quando insere os dados necessários    ${descricao}    ${qtd}    ${valunit}
    Então um novo produto é cadastrado

Quando clica na lupa
    Click Element    ${PESQUISA_BTN}

Então insere o nome que deseja pesquisar
    Input Text    ${LOCALIZAR}    tenis
    Press Keycode    66
    Hide Keyboard
    Element Text Should Be    ${PROD_PESQUISADO}        tenis

Dado que o usuario possui produtos cadastros
    Adiciona produto ao aplicativo    tenis    50    120
    Adiciona produto ao aplicativo     chuteira    20    120

Quando clica em salvar
    Click Element    ${SALVAR_BTN}

Então permanece na mesma tela
    Hide Keyboard
    Espera o elemento e verifica o elemento    ${TELA_CADASTRO}