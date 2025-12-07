#Language:pt-br 

# ==========================================================
# US-0002 – Login na plataforma
# ==========================================================

  Como cliente da EBAC-SHOP
  Quero fazer o login na plataforma
  Para visualizar meus pedidos

  Background:
    Given que estou na tela de login

  Scenario: Login bem-sucedido com dados válidos
    Given que informo o usuário "usuario_valido@example.com"
    And informo a senha "senha_valida"
    When clico no botão "Entrar"
    Then devo ser autenticado
    And devo ser direcionado para a tela de checkout

  Scenario Outline: Login inválido não deve permitir acesso
    Given que informo o usuário "<usuario>"
    And informo a senha "<senha>"
    When clico no botão "Entrar"
    Then o sistema deve exibir a mensagem "Usuário ou senha inválidos"
    And o acesso não deve ser permitido

    Examples:
      | usuario                    | senha        |
      | usuario_inexistente@ex.com | qualquer     |
      | usuario_valido@example.com | senha_errada |

  Scenario: Login com campos vazios
    Given que deixo os campos usuário e senha vazios
    When clico no botão "Entrar"
    Then o sistema deve exibir "Usuário ou senha inválidos"
    And o acesso não deve ser permitido