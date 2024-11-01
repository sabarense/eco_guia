

# EcoGuia 🌱

**EcoGuia** é um aplicativo projetado para ajudar as pessoas a reciclarem, promovendo a sustentabilidade por meio de educação e gamificação. O aplicativo reconhece diferentes tipos de resíduos recicláveis por meio de uma foto tirada pelo usuário e fornece informações sobre os centros de reciclagem mais próximos.

## Funcionalidades Principais 🛠️

- **Reconhecimento de Resíduos Recicláveis**: O usuário pode tirar uma foto do resíduo e, após processado, o app identifica o material reciclável.
- **Centros de Reciclagem Próximos**: Com base na localização do usuário, o app mostra os centros de coleta de reciclagem mais próximos.
- **Gamificação**: 
  - O app atribui pontos com base no tipo de resíduo reciclado (quanto mais difícil o item for de reciclar, mais pontos são atribuídos).
  - Os pontos podem ser:
    - **Doação para caridade**.
    - **Convertidos em créditos de carbono**, promovendo a sustentabilidade e incentivando investimentos ecológicos.
- **Tópicos Educacionais**: A seção "Learn" traz informações e dicas sobre práticas sustentáveis e como melhorar hábitos de reciclagem.

## Tecnologias Utilizadas 💻

- **Flutter**: Aplicativo mobile multiplataforma.
- **Firebase**: Backend, autenticação e banco de dados.
- **Google Maps API**: Integração para mostrar os centros de reciclagem mais próximos.
- **Dart**: Linguagem de programação usada com Flutter para a lógica do app.

## Estrutura de Pastas 📁

- **lib/**: Contém todo o código fonte do aplicativo.
  - **auth/**: Lida com a autenticação de usuários.
  - **pages/**: Páginas e componentes principais do app.
    - **components/**: Contém os componentes de interface reutilizáveis, como barras de navegação e seções de conteúdo.
    - **tabs/**: Contém as páginas principais do app, como `home.dart`, `scan.dart`, e `minha_conta.dart`.
  - **services/**: Serviços utilitários, como chamadas à API e manipulação de dados.
  - **utils/**: Arquivos utilitários.
  - **main.dart**: Arquivo principal que inicializa o app.

## Como Instalar e Rodar o Projeto 🚀

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/eco_guia.git
   ```
2. **Navegue até a pasta do projeto**:
   ```bash
   cd eco_guia
   ```
3. **Instale as dependências**:
   ```bash
   flutter pub get
   ```
4. **Rode o app**:
   ```bash
   flutter run
   ```

## Contribuição 🤝

Sinta-se à vontade para abrir uma [issue](https://github.com/seu-usuario/eco_guia/issues) ou enviar um [pull request](https://github.com/seu-usuario/eco_guia/pulls). Todas as contribuições são bem-vindas!



## Licença 📄

Este projeto está licenciado sob a [MIT License](https://opensource.org/licenses/MIT) - veja o arquivo LICENSE para mais detalhes.

---

**Desenvolvedores:**  
- [Alexandre Niess](https://github.com/alexandreniess)
- [Yan Sabarense Coelho Silva](https://github.com/sabarense)
- [Rafael Maluf Araujo](https://github.com/RafaelMaluf)

