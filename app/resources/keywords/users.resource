*** Settings ***
Resource    ../main.resource

*** Keywords ***
Enviar requisição para gerar o token do usuário
    [Documentation]    Envia a requisição para autenticar e gerar o token de um usuário e retorna um Object Response da API
    ...                  
    ...                ``BODY_REQUEST`` -> JSON que será enviado na requisição
    [Arguments]        ${BODY_REQUEST}

    ${RESPONSE}        POST On Session
    ...                    alias=${ALIAS_API}
    ...                    url=${USERS}${POST_LOGIN} 
    ...                    json=${BODY_REQUEST}
    ...                    expected_status=any
 
    Log                ${RESPONSE.text}
    RETURN             ${RESPONSE}