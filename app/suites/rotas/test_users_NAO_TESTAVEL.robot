*** Settings ***
Resource    ../../resources/main.resource

*** Test Cases ***
# POST /signup
Validar a criação de um usuário com sucesso
    [Tags]    Integração    Users    Users.POST    Users.POST.positivos    Users.POST.signup
    No Operation
    # Dados válidos (email, senha, is_adm) → usuário criado → 201 Created

Validar a tentativa de criar um usuário informando um e-mail já cadastrado
    [Tags]    Integração    Users    Users.POST    Users.POST.negativos    Users.POST.signup
    No Operation
    # E-mail já cadastrado → 409 Conflict

Validar a tentativa de criar um usuário informando o campo de senha em branco
    [Tags]    Contrato    Users    Users.POST    Users.POST.negativos    Users.POST.signup
    No Operation
    # Campo senha ausente → 422 Unprocessable Entity

Validar a tentativa de criar um usuário informando um e-mail com o formato inválido
    [Tags]    Contrato    Users    Users.POST    Users.POST.negativos    Users.POST.signup
    No Operation
    # Formato de e-mail inválido → 422

Validar a tentativa de criar um usuário informando o campo de is_adm com o tipo de dado incorreto
    [Tags]    Contrato    Users    Users.POST    Users.POST.negativos    Users.POST.signup
    No Operation
    # Campo is_adm fora do tipo esperado (bool) → 422

#-------------------------------------------------------------------------------------------------------
# POST /login
Validar o login de um usuário com sucesso
    [Tags]    Integração    Users    Users.POST    Users.POST.positivos    Users.POST.login
    No Operation
    # Credenciais válidas → retorna access_token e token_type → 200 OK

Validar a tentativa de login de um usuário informando um e-mail não cadastrado
    [Tags]    Integração    Users    Users.POST    Users.POST.negativos    Users.POST.login
    No Operation
    # E-mail não cadastrado → 400 Bad Request

Validar a tentativa de login de um usuário informando a senha incorreta
    [Tags]    Integração    Users    Users.POST    Users.POST.negativos    Users.POST.login
    No Operation
    # Senha incorreta → 400 Bad Request

Validar a tentativa de login de um usuário não informando campos obrigatórios
    [Tags]    Contrato    Users    Users.POST    Users.POST.negativos    Users.POST.login
    No Operation
    # Campos ausentes no form-data (não JSON) → 422

#-------------------------------------------------------------------------------------------------------
# GET /current_user
Validar o retorno dos dados de um usuário logado com sucesso
    [Tags]    Integração    Users    Users.GET    Users.GET.positivos    Users.GET.current_user
    No Operation
    # Com token JWT válido → deve retornar os dados do usuário logado → 200 OK

Validar a tentativa de obter o retorno dos dados de um usuário logado utilizando um token em branco
    [Tags]    Integração    Users    Users.GET    Users.GET.negativos    Users.GET.current_user
    No Operation
    # Sem token → 401 Unauthorized

Validar a tentativa de obter o retorno dos dados de um usuário logado utilizando um token inválido
    [Tags]    Integração    Users    Users.GET    Users.GET.negativos    Users.GET.current_user
    No Operation
    # Token inválido/expirado → 401 Unauthorized

#-------------------------------------------------------------------------------------------------------
# GET /all_users
Validar o retorno dos usuários cadastrados com sucesso
    [Tags]    Integração    Users    Users.GET    Users.GET.positivos    Users.GET.all_users
    No Operation
    # Com token JWT válido → deve retornar os dados do usuário logado → 200 OK

