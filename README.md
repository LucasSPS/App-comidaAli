# App ComidaAli

ComidaAli é um aplicativo mobile desenvolvido com o objetivo de conectar doadores de alimentos com receptores, e também facilitar a venda de alimentos a um baixo custo. A motivação do projeto foi a grande quantidade de alimentos desperdiçados pelos brasileiros devido à extrapolação da data de validade, tornando a doação um ótimo meio de evitar o desperdício.

O aplicativo utiliza o Firebase como 'backend as a service' (BaaS), aproveitando funcionalidades como autenticação, armazenamento em nuvem e banco de dados em tempo real. O desenvolvimento foi realizado através da plataforma FlutterFlow em conjunto com implementações personalizadas no Android Studio.

## Desenvolvimento

A linguagem escolhida para implementar essa aplicação foi o Flutter, devido à possibilidade de obtenção de um código multiplataforma (Android/iOS) através de um mesmo código-fonte. Para isso, foi utilizada a plataforma FlutterFlow, que disponibiliza, por meio do low-code, a criação de uma aplicação sucinta, organizada e extremamente performática.

### Principais Funcionalidades:

- **Autenticação com Firebase Authentication**: Utilizado para permitir que os usuários se cadastrem e façam login no aplicativo de forma segura, em total conformidade com a LGPD.
  
- **Armazenamento de Dados em Tempo Real com Firebase Cloud Firestore**: Usado para armazenar informações de chats e anúncios para doação ou venda. Essa funcionalidade permite uma experiência de usuário fluida e atualizada em tempo real.
  
- **Armazenamento de Arquivos em Nuvem com Firebase Cloud Storage**: Utilizado para armazenar imagens dos alimentos disponíveis para doação ou venda, além de imagens enviadas nos chats entre os usuários. Com isso, reduzindo o tempo de carregamento e melhora a experiência do usuário.

- **Chat em Tempo Real**: Capacidade de enviar mensagens textuais e imagens em tempo real entre o anunciante e o interessado nos alimentos.

- **Controle de Exibição dos Anúncios**: Os anúncios são controlados por escolha do anunciante e pela data de validade dos alimentos. Itens abertos ou com data vencida não podem ser anunciados.

- **Emissão de Relatórios**: Funcionalidade que permite a exportação de dados referentes aos anúncios publicados, trazendo informações relevantes para uma eventual análise.

- **Filtragem e Ordenação de Anúncios**: Capacidade de filtrar e ordenar anúncios com base em preço, categoria e tempo de validade.

- **Grande quantidade de informações no anúncio**: Um anúncio de alimento é composto por título, imagem, descrição, categoria pré-selecionada, preço/doação se for gratuito, localização para retirada do item, além do acionamento do chat onde será feita toda a negociação e relacionamento doador/receptador.

### Implementações Futuras:

- Possibilidade de filtrar baseado na geolocalização.
- Adquirir produtos por meio de pagamentos na própria aplicação.
- Gamificação para reconhecer os usuários que mais realizarem doações.
- Sistema de avaliação doador/receptador.
