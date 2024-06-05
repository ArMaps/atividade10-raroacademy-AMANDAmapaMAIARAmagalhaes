*** Settings ***
Resource   ../utils/config.robot
Resource    ../page/backupRestorePage.robot

Test Setup        Open Test Application
Test Teardown     Teardown

*** Test Cases ***
CT001 - Backup
    Dado que o usuário acessa a tela de menu 
    Quando clica em Backup
    E clica em gerar backup
    Então um arquivo é gerado

CT002 - Enviar backup
    Dado que o usuário acessa a tela de menu 
    Quando clica em Backup
    E clica em enviar

CT003 - Restore
    Dado que o usuário acessa a tela de menu 
    Quando clica em Restore
    Então clica em selecionar arquivo