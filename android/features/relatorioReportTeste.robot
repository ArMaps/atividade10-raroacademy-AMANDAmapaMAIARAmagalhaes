*** Settings ***
Resource   ../utils/config.robot

Test Setup        Open Test Application
Test Teardown     Teardown

*** Test Cases ***
CT001 - Relatórios
    Dado que o usuário possui produto cadastrado
    Quando abre o menu
    E clica em Relatório
    Então visualiza as opções da página de relatório

CT002 - Relatórios - Inventário estoque - gerar pdf
    Dado que o usuário possui um produto cadastrado
    Quando abre o menu
    E clica em Relatório
    E clica em inventário de estoque
    E clica em gerar PDF
    Então gera um PDF
    
CT003 - Relatórios - Inventário estoque - visualizar PDF
    Dado que o usuário está na tela de inventário de estoque
    Quando gera um PDF
    Então clica em visualizar PDF

CT004 - Relatórios - Inventário estoque - enviar PDF
    Dado que o usuário está na tela de inventário de estoque
    Quando gera um PDF
    Então clica em enviar PDF

CT005 - Relatórios - Entradas estoque - visualizar PDF
    Dado que o usuário esta na tela de relatório
    Quando clica em Entradas no estoque
    E seleciona as datas
    E clica em gerar PDF
    Então clica em visualizar PDF

CT006 - Relatórios - Entradas estoque - enviar PDF
    Dado que o usuário esta na tela de relatório
    Quando clica em Entradas no estoque
    E seleciona as datas
    E clica em gerar PDF
    Então clica em enviar PDF

CT007 - Relatórios - Saídas do estoque - visualizar PDF
    Dado que o usuário esta na tela de relatório
    Quando clica em Saídas do estoque
    E seleciona as datas
    E clica em gerar PDF
    Então clica em visualizar PDF

CT008 - Relatórios - Saídas do estoque - enviar PDF
    Dado que o usuário esta na tela de relatório
    Quando clica em Saídas do estoque
    E seleciona as datas
    E clica em gerar PDF
    Então clica em enviar PDF    