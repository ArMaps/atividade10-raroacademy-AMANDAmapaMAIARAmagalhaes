*** Settings ***
Resource   ../base.robot

*** Variables ***
# Export
${EXPORT_BTN}                id=br.com.pztec.estoque:id/btn_exportar
${EXPORTAR_DADOS_BTN}        id=br.com.pztec.estoque:id/btn_gerar
${OK_EXPORT}                 id=android:id/button1
${ENVIAR_EXPORT}            id=br.com.pztec.estoque:id/btn_grupo

# Import
${IMPORT_BTN}                id=br.com.pztec.estoque:id/btn_importar
${RESTAURAR_PRODUTOS}        id=br.com.pztec.estoque:id/btn_produtos
${RESTAURAR_ENTRADAS}        id=br.com.pztec.estoque:id/btn_entradas
${RESTAURAR_SAIDAS}          id=br.com.pztec.estoque:id/btn_saidas
${GRUPO_PRODUTOS}            id=br.com.pztec.estoque:id/btn_grupos
${PASTAS_DISPOSITIVO}        xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${GRUPOS}                    xpath=//android.widget.TextView[contains(@resource-id,"android:id/text1")]

*** Keywords ***
Quando clica em Export
     Espera o elemento e clica no elemento    ${EXPORT_BTN}
     
E clica em exportar dados
    Espera o elemento e clica no elemento    ${EXPORTAR_DADOS_BTN}
    Espera o elemento e clica no elemento    ${OK_EXPORT}

Então clica em Enviar
    Espera o elemento e clica no elemento    ${ENVIAR_EXPORT}

Quando clica em Import
    Espera o elemento e clica no elemento    ${IMPORT_BTN}

Então visualiza as opções da página
    Espera o elemento e verifica o elemento    ${RESTAURAR_PRODUTOS}
    Espera o elemento e verifica o elemento    ${RESTAURAR_ENTRADAS}
    Espera o elemento e verifica o elemento    ${RESTAURAR_SAIDAS}
    Espera o elemento e verifica o elemento    ${GRUPO_PRODUTOS}

E clica em Restaurar Produtos
    Espera o elemento e clica no elemento    ${RESTAURAR_PRODUTOS}

Então clica na pasta Estoque
    Espera o elemento e clica no elemento   ${PASTAS_DISPOSITIVO}
    Espera o elemento e verifica o elemento    ${GRUPOS}

E clica em Restaurar Entradas
    Espera o elemento e clica no elemento    ${RESTAURAR_ENTRADAS}

E clica em Restaurar Saídas
    Espera o elemento e clica no elemento    ${RESTAURAR_SAIDAS}

E clica em Grupo de Produtos
    Espera o elemento e clica no elemento    ${GRUPO_PRODUTOS}