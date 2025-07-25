*** Settings ***
Resource               ../../resources/main.resource
Test Setup             Abrir conexões com as APIs
Test Teardown          Fechar conexões com as APIs

*** Test Cases ***
# POST /send
Validar o envio de uma operação com sucesso
    [Tags]    Integração    Operations    Operations.POST    Operations.POST.positivos    Operations.POST.send    Operations.POST.send.positivos
    No Operation
    # Criar operação com todos os campos válidos e token válido → 201 Created

Validar a tentativa de enviar uma operação utilizando um token inválido
    [Tags]    Integração    Operations    Operations.POST    Operations.POST.negativos    Operations.POST.send    Operations.POST.send.negativos
    No Operation
    # Sem token → 401 Unauthorized

Validar a tentativa de enviar uma operação não informando campos obrigatórios
    [Tags]    Contrato    Operations    Operations.POST    Operations.POST.negativos    Operations.POST.send    Operations.POST.send.negativos
    No Operation
    # Campos ausentes no body → 422 Unprocessable Entity

Validar a tentativa de enviar uma operação informando campos inválidos
    [Tags]    Contrato    Operations    Operations.POST    Operations.POST.negativos    Operations.POST.send    Operations.POST.send.negativos
    No Operation    
    # Campos inválidos no body → 422 Unprocessable Entity

Validar a tentativa de enviar uma operação informando campos com valores incorretos
    [Tags]    Contrato    Operations    Operations.POST    Operations.POST.negativos    Operations.POST.send    Operations.POST.send.negativos
    No Operation
    # Campo com valor negativo, ou tipo errado → 422

#-------------------------------------------------------------------------------------------------------
# GET /me
Validar a consulta das operações registradas do usuário logado - usuário com operações realizadas
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.positivos    Operations.GET.me    Operations.GET.me.positivos
    No Operation
    # Usuário autenticado com token → lista apenas suas operações → 200 OK

Validar a consulta das operações registradas do usuário logado - usuário sem operações realizadas
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.positivos    Operations.GET.me    Operations.GET.me.positivos
    No Operation
    # Usuário autenticado com token → lista vazia → 200 OK

Validar a tentativa de consultar as operações do usuário logado informando um token em branco
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.me    Operations.GET.me.negativos
    No Operation
    # Sem token → 401 Unauthorized

Validar a tentativa de consultar as operações do usuário logado informando um token inválido
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.me    Operations.GET.me.negativos
    No Operation
    # Token inválido → 401 Unauthorized

#-------------------------------------------------------------------------------------------------------
# GET /unprocessed
Validar a consulta das operações não processadas pelo sistema - com operações existentes
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.positivos    Operations.GET.unprocessed    Operations.GET.unprocessed.positivos
    No Operation
    # Usuário admin com token válido → lista operações não executadas → 200 OK

Validar a consulta das operações não processadas pelo sistema - sem operações existentes
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.positivos    Operations.GET.unprocessed    Operations.GET.unprocessed.positivos
    No Operation
    # Usuário admin com token válido → lista vazia → 200 OK

Validar a tentativa de consultar operações não processadas pelo sistema com um usuário não administrador
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.unprocessed    Operations.GET.unprocessed.negativos
    No Operation
    # Usuário comum → 403 Forbidden

Validar a tentativa de consultar operações não processadas pelo sistema informando um token em branco
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.unprocessed    Operations.GET.unprocessed.negativos
    No Operation
    # Sem token → 401 Unauthorized

Validar a tentativa de consultar operações não processadas pelo sistema informando um token inválido
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.unprocessed    Operations.GET.unprocessed.negativos
    No Operation
    # Token inválido → 401 Unauthorized

#-------------------------------------------------------------------------------------------------------
# GET operation/{operation_id}
Validar a consulta de uma operação pelo ID com o usuário comum dono da operação
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.positivos    Operations.GET.operation    Operations.GET.operation.positivos
    No Operation
    # Dono da operação → 200 OK

Validar a consulta de uma operação pelo ID com um usuário administrador
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.positivos    Operations.GET.operation    Operations.GET.operation.positivos
    No Operation
    # admin → 200 OK

Validar a tentativa de consultar uma operação pelo ID informando um ID inválido
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.operation    Operations.GET.operation.negativos
    No Operation
    # ID inexistente → 404 Not Found

Validar a tentativa de consultar uma operação pelo ID com um usuário comum que não seja o dono da operação
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.operation    Operations.GET.operation.negativos
    No Operation
    # Outro usuário → 403 Forbidden

Validar a tentativa de consultar uma operação pelo ID informando um token em branco 
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.operation    Operations.GET.operation.negativos
    No Operation
    # Sem token → 401 Unauthorized

Validar a tentativa de consultar uma operação pelo ID informando um token inválido 
    [Tags]    Integração    Operations    Operations.GET    Operations.GET.negativos    Operations.GET.operation    Operations.GET.operation.negativos
    No Operation
    # Token inválido → 401 Unauthorized

#-------------------------------------------------------------------------------------------------------
# DELETE operation/{operation_id}
Validar a exclusão de uma operação não executada com o usuário comum dono da operação
    [Tags]    Integração    Operations    Operations.DELETE    Operations.DELETE.positivos    Operations.DELETE.operation    Operations.DELETE.operation.positivos
    No Operation
    # Dono da operação não executada → 204 No Content

Validar a exclusão de uma operação não executada com um usuário administrador
    [Tags]    Integração    Operations    Operations.DELETE    Operations.DELETE.positivos    Operations.DELETE.operation    Operations.DELETE.operation.positivos
    No Operation
    # admin → 204 No Content

Validar a tentativa de excluir uma operação não existente
    [Tags]    Integração    Operations    Operations.DELETE    Operations.DELETE.negativos    Operations.DELETE.operation    Operations.DELETE.operation.negativos
    No Operation
    # Operação não existe → 404 Not Found

Validar a tentativa de excluir uma operação não executada com um usuário comum que não seja o dono da operação
    [Tags]    Integração    Operations    Operations.DELETE    Operations.DELETE.negativos    Operations.DELETE.operation    Operations.DELETE.operation.negativos
    No Operation
    # Operação de outro usuário → 403 Forbidden

Validar a tentativa de excluir uma operação já executada
    [Tags]    Integração    Operations    Operations.DELETE    Operations.DELETE.negativos    Operations.DELETE.operation    Operations.DELETE.operation.negativos
    No Operation
    # Operação já executada → 409 Conflict

Validar a tentativa de excluir uma operação não executada informando um token em branco
    [Tags]    Integração    Operations    Operations.DELETE    Operations.DELETE.negativos    Operations.DELETE.operation    Operations.DELETE.operation.negativos
    No Operation
    # Sem token → 401 Unauthorized

Validar a tentativa de excluir uma operação não executada informando um token inválido
    [Tags]    Integração    Operations    Operations.DELETE    Operations.DELETE.negativos    Operations.DELETE.operation    Operations.DELETE.operation.negativos
    No Operation
    # Token inválido → 401 Unauthorized

#-------------------------------------------------------------------------------------------------------
# PATCH operation/{operation_id}
Validar a atualização de uma operação não executada com o usuário comum dono da operação
    [Tags]    Integração    Operations    Operations.PATCH    Operations.PATCH.positivos    Operations.PATCH.operation    Operations.PATCH.operation.positivos
    No Operation
    # Dono da operação não executada → 202 Accepted

Validar a atualização de uma operação não executada com um usuário administrador
    [Tags]    Integração    Operations    Operations.PATCH    Operations.PATCH.positivos    Operations.PATCH.operation    Operations.PATCH.operation.positivos
    No Operation
    # admin → 202 Accepted

Validar a tentativa de atualizar uma operação não existente
    [Tags]    Integração    Operations    Operations.PATCH    Operations.PATCH.negativos    Operations.PATCH.operation    Operations.PATCH.operation.negativos
    No Operation
    # Operação não existe → 404 Not Found

Validar a tentativa de atualizar uma operação não executada com um usuário comum que não seja o dono da operação
    [Tags]    Integração    Operations    Operations.PATCH    Operations.PATCH.negativos    Operations.PATCH.operation    Operations.PATCH.operation.negativos
    No Operation
    # Operação de outro usuário → 403 Forbidden

Validar a tentativa de atualizar uma operação já executada
    [Tags]    Integração    Operations    Operations.PATCH    Operations.PATCH.negativos    Operations.PATCH.operation    Operations.PATCH.operation.negativos
    No Operation
    # Operação já executada → 409 Conflict

Validar a tentativa de atualizar uma operação não executada informando um token em branco
    [Tags]    Integração    Operations    Operations.PATCH    Operations.PATCH.negativos    Operations.PATCH.operation    Operations.PATCH.operation.negativos
    No Operation
    # Sem token → 401 Unauthorized

Validar a tentativa de atualizar uma operação não executada informando um token inválido
    [Tags]    Integração    Operations    Operations.PATCH    Operations.PATCH.negativos    Operations.PATCH.operation    Operations.PATCH.operation.negativos
    No Operation
    # Token inválido → 401 Unauthorized

Validar a tentativa de atualizar uma operação não executada informando campos inválidos
    [Tags]    Contrato    Operations    Operations.PATCH    Operations.PATCH.positivos    Operations.PATCH.operation    Operations.PATCH.operation.negativos
    No Operation
    # Campos inválidos → 422

Validar a tentativa de atualizar uma operação não executada informando campos com valores incorretos
    [Tags]    Contrato    Operations    Operations.PATCH    Operations.PATCH.positivos    Operations.PATCH.operation    Operations.PATCH.operation.negativos
    No Operation
    # Campo com valor negativo, ou tipo errado → 422