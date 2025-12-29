#Language:pt-br 

# ==========================================================
# US-0001 – Configurar produto
# ==========================================================

  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto
  e escolher a quantidade
  Para depois inserir no carrinho

  Contexto:
    Dado que estou na página de detalhes do produto

  Cenário: Seleções obrigatórias devem ser feitas antes de adicionar ao carrinho
    Dado que o produto está disponível
    Quando tento adicionar ao carrinho sem selecionar cor, tamanho ou quantidade
    Então o sistema deve impedir a ação
    E deve exibir a mensagem "Selecione cor, tamanho e quantidade"

  Esquema do Cenário: Quantidade válida (1 a 10 unidades)
    Dado que selecionei a cor "<cor>"
    E selecionei o tamanho "<tamanho>"
    E seleciono a quantidade "<quantidade>"
    Quando clico em "Adicionar ao carrinho"
    Então o produto deve ser adicionado com a quantidade "<quantidade>"

    Exemplos:
      | cor      | tamanho | quantidade |
      | vermelho | M       | 1          |
      | azul     | G       | 5          |
      | preto    | P       | 10         |

  Cenário: Quantidade acima de 10 não deve ser permitida
    Dado que selecionei a cor "preto"
    E selecionei o tamanho "M"
    Quando seleciono a quantidade "11"
    E clico em "Adicionar ao carrinho"
    Então o sistema deve impedir a ação
    E deve exibir a mensagem "Máximo de 10 produtos por venda"

  Cenário: Botão limpar deve restaurar o estado inicial
    Dado que selecionei cor "azul", tamanho "G" e quantidade "3"
    Quando clico no botão "Limpar"
    Então a seleção de cor deve ser limpa
    E a seleção de tamanho deve ser limpa
    E a quantidade deve voltar ao padrão (1)
