🔸 1. POST /operations – Criar operação
✅ Casos de sucesso:
Criar operação com todos os campos válidos e token válido → 201 Created

❌ Casos de erro:
Sem token → 401 Unauthorized

Campos ausentes ou inválidos no body → 422 Unprocessable Entity

Campo com valor negativo, ou tipo errado → 422

🔸 2. GET /operations/me – Listar operações do usuário logado
✅ Casos de sucesso:
Usuário autenticado com token → lista apenas suas operações → 200 OK

❌ Casos de erro:
Sem token → 401 Unauthorized

🔸 3. GET /operations/unprocessed – Listar operações não processadas (admin)
✅ Casos de sucesso:
Usuário admin com token válido → lista operações não executadas → 200 OK

❌ Casos de erro:
Usuário comum → 403 Forbidden

Sem token → 401 Unauthorized

🔸 4. GET /operations/{operation_id} – Buscar operação por ID
✅ Casos de sucesso:
Dono da operação ou admin → 200 OK

❌ Casos de erro:
ID inexistente → 404 Not Found

Outro usuário → 403 Forbidden

Sem token → 401 Unauthorized

🔸 5. DELETE /operations/{operation_id} – Excluir operação
✅ Casos de sucesso:
Dono/admin da operação não executada → 204 No Content

❌ Casos de erro:
Operação não existe → 404 Not Found

Operação de outro usuário → 403 Forbidden

Operação já executada → 409 Conflict

Sem token → 401 Unauthorized

🔸 6. PATCH /operations/{operation_id} – Atualizar operação
✅ Casos de sucesso:
Dono/admin de operação não executada → 202 Accepted

❌ Casos de erro:
Operação não existe → 404 Not Found

Operação de outro usuário → 403 Forbidden

Operação já executada → 409 Conflict

Campos inválidos → 422

Sem token → 401 Unauthorized



<!-- USERS: -->

🔹 1. GET /users/current_user – Usuário autenticado
✅ Sucesso:
Com token JWT válido → deve retornar os dados do usuário logado → 200 OK

❌ Falhas:
Sem token → 401 Unauthorized

Token inválido/expirado → 401 Unauthorized

Token de outro usuário (manipulado) → 401 Unauthorized

🔹 2. POST /users/signup – Cadastrar novo usuário
✅ Sucesso:
Dados válidos (email, senha, is_adm) → usuário criado → 201 Created

❌ Falhas:
E-mail já cadastrado → 409 Conflict

Campo senha ausente → 422 Unprocessable Entity

Formato de e-mail inválido → 422

Campo is_adm fora do tipo esperado (bool) → 422

🔹 3. GET /users/all_users – Listar todos os usuários
OBS: Essa rota está exposta sem autenticação (pode ser risco de segurança se não for proposital).

✅ Sucesso:
Qualquer chamada → retorna lista de usuários → 200 OK

❌ (opcional):
Se for necessário restringir essa rota a admins, deve haver testes como:

Sem token → 401

Com token de não-admin → 403

🔹 4. POST /users/login – Login com geração de token JWT
✅ Sucesso:
Credenciais válidas → retorna access_token e token_type → 200 OK

❌ Falhas:
E-mail não cadastrado → 400 Bad Request

Senha incorreta → 400 Bad Request

Campos ausentes no form-data (não JSON) → 422