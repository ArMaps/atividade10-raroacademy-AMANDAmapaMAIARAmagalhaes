*** Settings ***
Resource   ../base.robot

*** Variables ***
# Backup
${MENU_BTN}                 id=br.com.pztec.estoque:id/Button3
${BACKUP_BTN}                id=br.com.pztec.estoque:id/btn_backup
${GERAR_BACKUP}              id=br.com.pztec.estoque:id/btn_gerar
${ENVIAR_BACKUP}             id=br.com.pztec.estoque:id/btn_send
${ARQUIVO_BACKUP}            id=br.com.pztec.estoque:id/datafile

${OK_BACKUP}                 id=android:id/button1

# Restore
${RESTORE_BTN}               id=br.com.pztec.estoque:id/btn_restore
${SELECIONAR_ARQUIVO}        id=br.com.pztec.estoque:id/btn_procurar
${ANDROID_PASTA}             xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Android"]


*** Keywords ***
Dado que o usuário acessa a tela de menu 
    Espera o elemento e clica no elemento    ${MENU_BTN}

Quando clica em Backup
    Espera o elemento e clica no elemento    ${BACKUP_BTN}

E clica em gerar backup
    Espera o elemento e clica no elemento    ${GERAR_BACKUP}
    Espera o elemento e clica no elemento    ${OK_BACKUP}

Então um arquivo é gerado
    Espera o elemento e verifica o elemento    ${ARQUIVO_BACKUP}

E clica em enviar
    Espera o elemento e clica no elemento    ${ENVIAR_BACKUP}

# Restore
Quando clica em Restore
    Espera o elemento e clica no elemento    ${RESTORE_BTN}

Então clica em selecionar arquivo
    Espera o elemento e clica no elemento    ${SELECIONAR_ARQUIVO}