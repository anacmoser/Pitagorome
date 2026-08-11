# Pitagorome

Jogo educativo de administração e matemática, desenvolvido em **Godot Engine 4**.

## Sobre o projeto

Pitagorome é uma proposta gamificada que une matemática e administração escolar em uma experiência interativa voltada para estudantes do Ensino Médio. No jogo, o jogador assume o papel de diretor(a) de uma escola, sendo responsável por organizar turmas, administrar recursos, resolver conflitos e tomar decisões estratégicas relacionadas ao funcionamento da instituição.

Para progredir nas fases e melhorar o desempenho da escola, o jogador precisa resolver desafios lógico-matemáticos contextualizados em situações administrativas, envolvendo porcentagem, probabilidade, análise combinatória, funções, equações e raciocínio algébrico. A proposta busca fugir da repetição mecânica de exercícios, inserindo a matemática em problemas práticos do cotidiano escolar, com progressão por fases, recompensas e interação com personagens (NPCs), em uma estética "cozy" e interface minimalista.

Autoria: Ana Julia Cardoso Moser, Eduardo de Lazzari Oliveira, Guilherme Pereira de Oliveira e João Paulo Queiroz Costa — Instituto Federal de Educação, Ciência e Tecnologia de São Paulo (IFSP – Câmpus São Paulo).

## Objetivo geral

Demonstrar que o uso de um jogo educativo voltado ao ensino de matemática pode aumentar o engajamento, a motivação e a compreensão de conceitos matemáticos por estudantes do Ensino Médio, em comparação a métodos tradicionais de aprendizagem.

### Objetivos específicos

- Desenvolver um jogo educativo que integre desafios matemáticos com mecânicas de exploração e progressão;
- Aplicar conceitos de gamificação para estimular o interesse e a participação ativa dos estudantes;
- Relacionar problemas matemáticos a situações práticas e contextualizadas dentro da narrativa do jogo;
- Incentivar a autonomia e o raciocínio lógico dos jogadores durante a resolução de desafios;
- Analisar o potencial do uso de metodologias ativas e jogos digitais como ferramentas complementares ao ensino tradicional de matemática;
- Avaliar se o uso do "Pitagorome" contribui para reduzir a aversão e o distanciamento dos estudantes em relação à disciplina.

## Requisitos do sistema

### Requisitos Funcionais (resumo)

| Código | Nome | Descrição resumida |
|---|---|---|
| RF01 | Exibir Menu Principal | Menu inicial com novo jogo, continuar, configurações e créditos |
| RF02 | Exibir Tutorial Introdutório | Explicação inicial conduzida pela NPC Coordenadora em cada fase |
| RF03 | Customizar Personagem | Personalização de gênero, tom de pele, cabelo e vestimenta (baixa prioridade) |
| RF04 | Movimentar Personagem | Movimentação do diretor(a) pelo cenário nas 4 direções |
| RF05 | Interagir com NPCs | Diálogos com NPCs para missões, dicas e contexto narrativo |
| RF06 | Apresentar Desafio Matemático | Exibição de desafios lógico-matemáticos contextualizados |
| RF07 | Validar Resposta do Desafio | Verificação da resposta com feedback didático imediato |
| RF08 | Exibir HUD de Jogo | Painel com minimapa e missão ativa |
| RF09 | Navegar entre Cenas | Transição entre ambientes (corredor, sala, pátio, refeitório, biblioteca) |
| RF10 | Registrar Progresso por Fase | Salvamento automático de fase e desafios concluídos |
| RF11 | Avançar entre Fases | Desbloqueio da fase seguinte (4 fases, uma por bimestre) |
| RF12 | Gerenciar Tempo de Jogo | Simulação de um ciclo de 200 dias in-game |

### Requisitos Não Funcionais (resumo)

| Código | Nome | Descrição resumida |
|---|---|---|
| RNF01 | Plataforma-Alvo | Exportação HTML5, sem instalação |
| RNF02 | Tempo de Resposta | Até 0,5s para ações simples |
| RNF03 | Tempo de Carregamento Inicial | Até 15s em conexão média |
| RNF04 | Disponibilidade | Funciona sem servidores externos |
| RNF05 | Desempenho Gráfico | 60 FPS estáveis |
| RNF06 | Memória | Consumo-alvo de até 512 MB |
| RNF07 | Espaço em Disco | Até 200 MB no total |
| RNF08 | Resolução | 1280x720 |
| RNF09 | Perspectiva | Top-down 2D |
| RNF10 | Arquitetura do Sistema | Arquitetura nativa da Godot Engine 4 |
| RNF11 | Site do Projeto | Site institucional em HTML, CSS e JavaScript |
| RNF12 | Trilha Sonora | Reforça o ambiente cozy do jogo |
| RNF13 | Confiabilidade | Sem falhas que interrompam a gameplay |
| RNF14 | Segurança dos Dados | Progresso armazenado localmente |
| RNF15 | Persistência de Dados | Progresso mantido entre sessões |
| RNF16 | Consistência Visual | Identidade visual coesa |
| RNF17 | Adequação Pedagógica | Conteúdo alinhado ao currículo oficial |
| RNF18 | Usabilidade da Interface | Interface intuitiva e adequada ao público-alvo |
| RNF19 | Acessibilidade Visual | Diretrizes WCAG |

## Estrutura do repositório

```
pitagorome/
├── scenes/            # Cenas "prontas" do fluxo atual do jogo
│   ├── intro/         # Cena inicial (gabinete do diretor) — cena principal do projeto
│   ├── school/        # Corredor, sala de matemática, biblioteca, coordenação
│   ├── characters/    # Player e NPCs usados nas cenas prontas
│   └── ui/            # HUD, caixa de diálogo, modal de desafio
├── scripts/           # Scripts GDScript usados pelas cenas prontas
├── assets/            # Fontes, props e frames de personagem usados nas cenas prontas
├── aseprites/         # Arquivos-fonte .aseprite dos sprites
├── data/dialogues/     # Diálogos da introdução
├── TileSet/            # Tudo relacionado a tileset/tilemap, unificado numa só pasta
│   ├── Ambientes/      # Tiles de chão e parede (arte própria)
│   ├── Elementos/      # Móveis (mesas, cadeiras, armários, lousas etc.)
│   ├── Personagens/    # Sprites de personagens em formato tileset
│   ├── Scenes/         # Cenas de TileMapLayer (ground_tilemap, wall_tilemap, wall_true_tm)
│   └── AssetPack_ModernTilesFree/  # Pacote de tiles gratuito ainda não incorporado ao fluxo do jogo
└── descartaveis/       # Código/cenas soltos, não usados pelo fluxo atual do jogo — revisar e decidir se ficam ou são apagados
    ├── mesa.gd
    ├── player.gd        # versão simplificada/antiga, duplicada de scripts/player.gd
    ├── test_level.tscn   # nível de teste/protótipo de tilemap
    └── characters/       # cena antiga do "director" usada só pelo test_level
```

> **Nota técnica:** os arquivos movidos para `TileSet/Scenes/` e para `descartaveis/` tiveram os caminhos internos (`ext_resource`) corrigidos, então devem continuar abrindo normalmente no editor. Ainda assim, é recomendável abrir o projeto no Godot após o pull e deixar reimportar caso apareça algum aviso.
>
> Uma pasta (`Tilemap-pronto`) não pôde ser movida para dentro de `TileSet/` nesta organização porque o Windows recusou renomear a pasta (provavelmente por estar com o Godot ou outro programa aberto travando algum arquivo). Assim que possível, feche o editor e mova manualmente o conteúdo de `Tilemap-pronto/` para `TileSet/AssetPack_ModernTilesFree/`. A pasta `tilemaps/` também ficou vazia após a reorganização e pode ser apagada manualmente.

## Tecnologia

- **Motor:** Godot Engine 4 (features: 4.6, Forward Plus)
- **Cena principal:** `res://scenes/intro/intro_scene.tscn`
- **Exportação alvo:** HTML5 (navegadores modernos)

## Glossário

- **Acessível:** o sistema pode ser usado por estudantes com diferentes níveis de acuidade visual, sem obstáculos desnecessários.
- **Adequado:** textos legíveis, ícones com significado claro e elementos visuais que não prejudicam a compreensão das mecânicas.
- **Feedback:** resposta visual, sonora ou textual do sistema após uma ação, indicando acerto, erro ou progresso.
- **HUD:** painel de informações exibido durante a gameplay (minimapa, indicadores, missão ativa).
- **Intuitivo:** o jogador navega pelos menus e resolve desafios sem precisar de instruções externas.
- **NPC:** personagem não controlado pelo jogador, que fornece missões, dicas e contexto narrativo.
- **Top-down:** perspectiva em que a câmera é posicionada acima do cenário.

## Referências

BARBOSA, F. E.; PONTES, M. M. de; CASTRO, J. B. de. *A utilização da gamificação aliada às tecnologias digitais no ensino da matemática: um panorama de pesquisas brasileiras.* Revista Prática Docente, v. 5, n. 3, p. 1593–1611, 2020.

FREIRE, P. *Pedagogia da autonomia: saberes necessários à prática educativa.* São Paulo: Paz e Terra, 1996.

MESQUITA, S. N. d.; MENESES, R. M. G. d. S.; RAMOS, D. M. *Metodologias ativas de ensino/aprendizagem: dificuldades de docentes de um curso de enfermagem.* Trabalho, Educação e Saúde, v. 12, n. 3, p. 473–486, 2014.

PAIXÃO, J. L. *Metodologias ativas no ensino da matemática.* Revista Tópicos, Rio de Janeiro, v. 3, n. 28, p. 1–17, 2025.

SILVEIRA, B. *As dificuldades de aprendizagem na matemática: discursos legitimados por estudantes da educação básica.* Trabalho de Conclusão de Curso, Caçapava do Sul, 2014.

SKOVSMOSE, O. *Educação matemática crítica: a questão da democracia.* Campinas: Papirus, 2001.

VOLMINK, J. Mathematics for all. In: ASHMAN, A.; CONWAY, R. (Ed.). *An introduction to cognitive education: theory and applications.* London: Routledge, 1989. p. 35–42.
