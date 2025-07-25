*** Settings ***
Resource    ../../resources/main.resource

*** Keywords ***
Gerar tokens para os perfis de usuários
    [Documentation]    Gera os tokens de acesso para os perfis de usuários e grava em variáveis globais
    
    ${TOKEN_USER_ADM}  Realizar o login de um usuário
    ...                    USUARIO=${USER_ADM}
    
    ${TOKEN_USER_ADM}  Set Global Variable    
    ...                    ${TOKEN_USER_ADM}

    ${TOKEN_USER_01}   Realizar o login de um usuário
    ...                    USUARIO=${USER_01}
    
    ${TOKEN_USER_01}  Set Global Variable    
    ...                    ${TOKEN_USER_01}
    
    ${TOKEN_USER_02}   Realizar o login de um usuário
    ...                    USUARIO=${USER_02}
    
    ${TOKEN_USER_02}  Set Global Variable    
    ...                    ${TOKEN_USER_02}

Realizar o login de um usuário
    [Documentation]    Realiza o login conforme os dados de usuário informados e retorna o token gerado
    [Arguments]        ${USUARIO}
    
    ${BODY_REQUEST}    Criar o body da request conforme o template JSON    
    ...                    PATH_TEMPLATE=${PATH_TEMPLETE_LOGIN}
    
    ${BODY_REQUEST}    Alterar o valor do campo no body
    ...                    BODY_REQUEST=${BODY_REQUEST}
    ...                    PATH_CAMPO=${TEMPLATE_LOGIN.username}
    ...                    NEW_VALOR=${USUARIO.email}
    
    ${BODY_REQUEST}    Alterar o valor do campo no body
    ...                    BODY_REQUEST=${BODY_REQUEST}
    ...                    PATH_CAMPO=${TEMPLATE_LOGIN.username}
    ...                    NEW_VALOR=${USUARIO.senha}
    
    ${TOKEN}           Enviar requisição para gerar o token do usuário
    ...                    BODY_REQUEST=${BODY_REQUEST}
    
    Log                ${TOKEN.text}
 
    IF    "${TOKEN.json()['access_token']}" == "${EMPTY}"
        Fatal Error    msg=Token não gerado
    ELSE
        RETURN             ${TOKEN.json()['access_token']}
    END
 