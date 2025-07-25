*** Settings ***
Resource    ../../resources/main.resource

*** Variables ***
${ALIAS_API}            API_OPERACOES

*** Keywords ***
### SETUP ### -------------------------------------------------------------------------------------
Abrir conexões com as APIs
    [Documentation]    Cria uma sessão para todas as APIs do sistema, que serão utilizadas nos testes, e gera os tokens de acesso (gravando em variáveis globais)

    #! Aumento do level de detalhamento dos logs
    Set Log Level      TRACE
 
    #! Sessão usada na API de COMPANY_DATA
    Create Session     alias=${ALIAS_API}
    ...                url=${LOCAL}
    ...                disable_warnings=1
    
    #! Geração dos Tokens de acesso
    Gerar tokens para os perfis de usuários

### -----------------------------------------------------------------------------------------------
### TEARDOWN ### ----------------------------------------------------------------------------------
Fechar conexões com as APIs
    Delete All Sessions