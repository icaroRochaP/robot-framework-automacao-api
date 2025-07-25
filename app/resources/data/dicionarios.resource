*** Settings ***
Resource    ../../resources/main.resource

*** Variables ***
### USUÁRIOS --------------------------------------------------------------------------------------

&{USER_ADM}                    email=adm@adm.com
...                            senha=123456

&{USER_01}                     email=gerson@teste.com
...                            senha=123456

&{USER_02}                     email=ernesto@teste.com
...                            senha=123456

### -----------------------------------------------------------------------------------------------
### CAMPOS DOS TEMPLATES JSON ---------------------------------------------------------------------

&{TEMPLATE_LOGIN}              username=$.username
...                            password=$.password