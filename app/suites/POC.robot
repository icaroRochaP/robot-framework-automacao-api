*** Settings ***
Resource               ../resources/main.resource
Test Setup             Abrir conexões com as APIs
Test Teardown          Fechar conexões com as APIs

*** Test Cases ***
Test
    Log    message=${TOKEN_USER_ADM}
    Log    message=${TOKEN_USER_01}
    Log    message=${TOKEN_USER_02}


    