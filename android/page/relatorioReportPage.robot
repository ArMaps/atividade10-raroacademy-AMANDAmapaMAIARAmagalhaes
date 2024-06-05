*** Settings ***
Resource   ../base.robot

*** Variables ***
# Relatórios
${RELATORIO_BTN}             id=br.com.pztec.estoque:id/btn_relatorios
${RELATORIO_TITULO}          id=br.com.pztec.estoque:id/lbl_titulo
${INVANTARIO_ESTOQUE}        id=br.com.pztec.estoque:id/inventario
${GERAR_PDF}                 id=br.com.pztec.estoque:id/btn_gerar
${ARQUIVO}                   id=br.com.pztec.estoque:id/datafile
${VISUALIZAR_PDF}            id=br.com.pztec.estoque:id/btn_abrir
${ENVIAR_PDF}                id=br.com.pztec.estoque:id/btn_email
${ENTRADAS_ESTOQUE}          id=br.com.pztec.estoque:id/relentrada
${DATA_INICIAL}              id=br.com.pztec.estoque:id/data1
${DATA_FINAL}                id=br.com.pztec.estoque:id/data2
${OK_DATA}                   id=android:id/button1
${SAIDAS_ESTOQUE}            id=br.com.pztec.estoque:id/relsaida

*** Keywords ***
Dado que o usuário possui um produto cadastrado
    Dado que o usuário esta na tela de cadastro de Produto
    Quando insere os dados necessários    Xbox Series X    20    3800
    Então um novo produto é cadastrado

Quando abre o menu
    Espera o elemento e clica no elemento    ${MENU_BTN}

E clica em Relatório
    Espera o elemento e clica no elemento    ${RELATORIO_BTN}

Então visualiza as opções da página de relatório
    Espera o elemento e verifica o elemento    ${RELATORIO_TITULO}
    Espera o elemento e verifica o elemento    ${INVANTARIO_ESTOQUE}
    Espera o elemento e verifica o elemento    ${SAIDAS_ESTOQUE}

E clica em inventário de estoque
    Espera o elemento e clica no elemento    ${INVANTARIO_ESTOQUE}

E clica em gerar PDF
    Espera o elemento e clica no elemento    ${GERAR_PDF}

Então gera um PDF
    Espera o elemento e verifica o elemento    ${ARQUIVO}

Dado que o usuário está na tela de inventário de estoque
    Dado que o usuário possui produto cadastrado
    Quando abre o menu
    E clica em Relatório
    E clica em inventário de estoque
    E clica em gerar PDF

Quando gera um PDF
    Espera o elemento e verifica o elemento    ${ARQUIVO}

Então clica em visualizar PDF
    Espera o elemento e clica no elemento    ${VISUALIZAR_PDF}

Então clica em enviar PDF
    Espera o elemento e clica no elemento    ${ENVIAR_PDF}

Dado que o usuário esta na tela de relatório
    Dado que o usuário possui produto cadastrado
    Quando abre o menu
    E clica em Relatório

Quando clica em Entradas no estoque
    Espera o elemento e clica no elemento    ${ENTRADAS_ESTOQUE}
    
E seleciona as datas
    Espera o elemento e clica no elemento    ${DATA_INICIAL}
    Espera o elemento e clica no elemento    ${OK_DATA}
    Espera o elemento e clica no elemento    ${DATA_FINAL}
    Espera o elemento e clica no elemento    ${OK_DATA}

Quando clica em Saídas do estoque
    Espera o elemento e clica no elemento    ${SAIDAS_ESTOQUE}