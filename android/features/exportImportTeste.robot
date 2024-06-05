*** Settings ***
Resource   ../utils/config.robot

Test Setup        Open Test Application
Test Teardown     Teardown

*** Test Cases ***
CT001 - Exportar dados
    Dado que o usuário acessa a tela de menu
    Quando clica em Export
    E clica em exportar dados
    Então clica em Enviar
    
CT002 - Importar dados
    Dado que o usuário acessa a tela de menu
    Quando clica em Import
    Então visualiza as opções da página

CT003 - Importar dados - Restaurar Produtos
    Dado que o usuário acessa a tela de menu
    Quando clica em Import
    E clica em Restaurar Produtos
    Então clica na pasta Estoque

CT004 - Importar dados - Restaurar Entradas
    Dado que o usuário acessa a tela de menu
    Quando clica em Import
    E clica em Restaurar Entradas
    Então clica na pasta Estoque

CT005 - Importar dados - Restaurar Saídas
    Dado que o usuário acessa a tela de menu
    Quando clica em Import
    E clica em Restaurar Saídas
    Então clica na pasta Estoque

CT006 - Importar dados - Grupo de Produtos
    Dado que o usuário acessa a tela de menu
    Quando clica em Import
    E clica em Grupo de Produtos
    Então clica na pasta Estoque