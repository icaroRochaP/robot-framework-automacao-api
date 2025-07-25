*** Settings ***
Library             Collections
Library             String
Library             RequestsLibrary
Library             FakerLibrary
...                 locale=pt_BR
Library             String
Library             DateTime
Library             OperatingSystem
Library             JSONLibrary
 

### CUSTOM LIBRARIES


### DATA
Resource    data/dicionarios.resource
Resource    data/endpoints.resource
Resource    data/templates_path.resource
Resource    data/database.resource

### KEYWORDS
Resource    keywords/operations.resource
Resource    keywords/users.resource
Resource    keywords/body_build.resource

### SHARED    
Resource    shared/setup_teardown.resource
Resource    shared/autenticacao.resource