# ==========================================================
# Esquema do Cenário-0003 – Tela de cadastro / Checkout
# ==========================================================

  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Contexto:
    Dado que estou na tela de cadastro do checkout

  Cenário: Cadastro válido com todos os dados obrigatórios
    Dado que informo todos os campos obrigatórios corretamente
    E informo o e-mail "cliente@example.com"
    E informmo a senha "senha_cadastro"
    Quando clico em "Finalizar cadastro"
    Então o cadastro deve ser concluído com sucesso

  Esquema do Cenário: E-mail em formato inválido
    Dado que preencho todos os campos obrigatórios corretamente
    E informo o e-mail "<email>"
    Quando clico em "Finalizar cadastro"
    Então o sistema deve exibir a mensagem "Formato de e-mail inválido"
    E o cadastro não deve ser concluído

    Exemplos:
      | email                  |
      | joaosilva-at-email.com |
      | joao@.com              |
      | @exemplo.com           |

  Cenário: Tentativa de cadastro com campos obrigatórios vazios
    Dado que deixo campos obrigatórios vazios
      | Nome     |
      | E-mail   |
      | Endereço |
      | Senha    |
    Quando clico em "Finalizar cadastro"
    Então o sistema deve exibir mensagem de alerta para cada campo vazio
    E o cadastro não deve ser concluído
