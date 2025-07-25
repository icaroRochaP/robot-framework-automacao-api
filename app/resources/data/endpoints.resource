*** Settings ***
Resource    ../../resources/main.resource

*** Variables ***
### AMBIENTE ###
${LOCAL}                http://127.0.0.1:8000/


### MÓDULO ###
${API}                  api/v1/users/


### ROTAS DO MÓDULO ###
${USERS}                users/
${OPERATIONS}           operations/
${EXTERNAL_APP}         external_app/

### RECURSOS ###
###### USERS ######
${GET_CURRENT_USER}     current_user
${GET_ALL_USERS}        all_users
${POST_SIGNUP}          signup
${POST_LOGIN}           login

###### OPERATIONS ######
${POST_SEND}            send
${GET_ME}               me
${GET_UNPROCESSED}      unprocessed
${POST_LOGIN}           login
${GET_OPERATION}        operation/
${DELETE_OPERATION}     operation/
${PATCH_OPERATION}      operation/