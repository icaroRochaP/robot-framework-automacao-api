*** Settings ***
Resource    ../../resources/main.resource

*** Keywords ***
Criar o body da request conforme o template JSON
    [Documentation]    Retorna um JSON conforme o path do template informado
    ...
    ...                ``PATH_TEMPLATE`` -> Path do template JSON usado para criar o Body
    [Arguments]        ${PATH_TEMPLATE}
 
    ${BODY_REQUEST}    Load JSON From File
    ...                    file_name=${CURDIR}${PATH_TEMPLATE}
    ...                    encoding=UTF-8        
   
    Log                ${BODY_REQUEST}
    RETURN             ${BODY_REQUEST}

Alterar o valor do campo no body
    [Documentation]    Altera o valor do campo conforme o path informado. E retorna o Body alterado
    ...
    ...                ``BODY_REQUEST`` -> Body JSON com campo que será alterado
    ...
    ...                ``PATH_CAMPO`` -> Path do dicionário referente ao campo informado
    ...
    ...                ``NEW_VALOR`` -> Novo Valor que será gravado no campo
    [Arguments]        ${BODY_REQUEST}    ${PATH_CAMPO}    ${NEW_VALOR}
 
    ${BODY_REQUEST}    Update Value To Json
    ...                    json_object=${BODY_REQUEST}
    ...                    json_path=${PATH_CAMPO}
    ...                    new_value=${NEW_VALOR}
   
    Log                ${BODY_REQUEST}
    RETURN             ${BODY_REQUEST}
 