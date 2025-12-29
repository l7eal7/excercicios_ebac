#Language:pt-br 

# ==========================================================
# US-0002 – Login na plataforma
# ==========================================================

  Como cliente da EBAC-SHOP
  Quero fazer o login na plataforma
  Para visualizar meus pedidos

  Contexto:
    Dado que estou na tela de login

  Cenário: Login bem-sucedido com dados válidos
    Dado que informo o usuário "usuario_valido@example.com"
    E informo a senha "senha_valida"
    Quando clico no botão "Entrar"
    Então devo ser autenticado e direcionado para a página dee checkout


  Esquema do Cenário: Login inválido não deve permitir acesso
    Dado que informo o usuário "<usuario>"
    E informo a senha "<senha>"
    Quando clico no botão "Entrar"
    Então o sistema deve exibir a mensagem "Usuário ou senha inválidos"
    E o acesso não deve ser permitido

    Exemplos:
      | usuario                    | senha        |
      | usuario_inexistente@ex.com | qualquer     |
      | usuario_valido@example.com | senha_errada |

  Cenário: Login com campos vazios
    Dado que deixo os campos usuário e senha vazios
    Quando clico no botão "Entrar"
    Então o sistema deve exibir "Usuário ou senha inválidos"
    E o acesso não deve ser permitido
