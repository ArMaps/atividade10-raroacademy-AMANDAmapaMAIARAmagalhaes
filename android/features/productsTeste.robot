*** Settings ***
Resource   ../utils/config.robot

Test Setup        Open Test Application
Test Teardown     Teardown

*** Test Cases ***
CT001 - cadastro de Produto
    Dado que o usuário esta na tela de cadastro de Produto
    Quando insere os dados necessários    Batedeira    4    200
    E insere os demais dados    23    3216     56
    Então um novo produto é cadastrado

CT002 - cadastro de produto com Template
    [Template]    Cadastro de produto Template
    FOR    ${counter}    IN RANGE    1
        Liquidificador    4    100
        Mixer    5    200
        Fogão    1    600
    END

CT003 - edição de produto
    Dado que o usuário possui produto cadastrado
    Quando clica em editar
    E insere as informações a serem alteradas
    Então o produto é editado com sucesso

CT004 - entrada de produto
    Dado que o usuário possui produto cadastrado
    Quando clica em entrada
    E insere a quantidade de produto desejada
    Então a quantidade é alterada com sucesso

CT005 - saída de produto
    Dado que o usuário possui produto cadastrado
    Quando clica em saída
    E insere a quantidade de produto que deseja retirar do estoque
    Então a quantidade é diminuída com sucesso

CT006 - estoque insuficiente
    Dado que o usuário possui produto cadastrado
    Quando clica em saída
    E retira todo o estoque
    Então visualiza uma mensagem

CT007 - exclusão de produto
    Dado que o usuário possui produto cadastrado
    Quando clica em deletar
    E confirma
    Então retorna a página inicial

CT008 - pesquisa de produto
    Dado que o usuario possui produtos cadastros
    Quando clica na lupa
    Então insere o nome que deseja pesquisar

CT009 - tentativa de cadastro de produto sem preencher os campos obrigatórios
    Dado que o usuário esta na tela de cadastro de Produto       
    Quando clica em salvar
    Então permanece na mesma tela