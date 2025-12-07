#Language:pt-br 

# ==========================================================
# Esquema do Cenário-0003 – Tela de cadastro / Checkout
# ==========================================================

  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Background:
    Given que estou na tela de cadastro do checkout

  Scenario: Cadastro válido com todos os dados obrigatórios
    Given informo todos os campos obrigatórios corretamente
    And informo o e-mail "cliente@example.com"
    When clico em "Finalizar cadastro"
    Then o cadastro deve ser concluído com sucesso

  Scenario Outline: E-mail em formato inválido
    Given preencho todos os campos obrigatórios corretamente
    And informo o e-mail "<email>"
    When clico em "Finalizar cadastro"
    Then o sistema deve exibir a mensagem "Formato de e-mail inválido"
    And o cadastro não deve ser concluído

    Examples:
      | email                  |
      | joaosilva-at-email.com |
      | joao@.com              |
      | @exemplo.com           |

  Scenario: Tentativa de cadastro com campos obrigatórios vazios
    Given deixo campos obrigatórios vazios
      | Nome      |
      | E-mail    |
      | Endereço  |
    When clico em "Finalizar cadastro"
    Then o sistema deve exibir mensagem de alerta para cada campo vazio
    And o cadastro não deve ser concluído
