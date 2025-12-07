#Language:pt-br 

# ==========================================================
# US-0001 – Configurar produto
# ==========================================================

  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto
  E escolher a quantidade
  Para depois inserir no carrinho

  Background:
    Given que estou na página de detalhes do produto

  Scenario: Seleções obrigatórias devem ser feitas antes de adicionar ao carrinho
    Given que o produto está disponível
    When tento adicionar ao carrinho sem selecionar cor, tamanho ou quantidade
    Then o sistema deve impedir a ação
    And deve exibir a mensagem "Selecione cor, tamanho e quantidade"

  Scenario Outline: Quantidade válida (1 a 10 unidades)
    Given selecionei a cor "<cor>"
    And selecionei o tamanho "<tamanho>"
    When seleciono a quantidade "<quantidade>"
    And clico em "Adicionar ao carrinho"
    Then o produto deve ser adicionado com a quantidade "<quantidade>"

    Examples:
      | cor      | tamanho | quantidade |
      | vermelho | M       | 1          |
      | azul     | G       | 5          |
      | preto    | P       | 10         |

  Scenario: Quantidade acima de 10 não deve ser permitida
    Given selecionei a cor "preto"
    And selecionei o tamanho "M"
    When seleciono a quantidade "11"
    And clico em "Adicionar ao carrinho"
    Then o sistema deve impedir a ação
    And deve exibir a mensagem "Máximo de 10 produtos por venda"

  Scenario: Botão limpar deve restaurar o estado inicial
    Given selecionei cor "azul", tamanho "G" e quantidade "3"
    When clico no botão "Limpar"
    Then a seleção de cor deve ser limpa
    And a seleção de tamanho deve ser limpa
    And a quantidade deve voltar ao padrão (1)
