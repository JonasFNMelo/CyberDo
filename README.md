# CyberDo

Um app de **to-do list gamificado** com estética cyberpunk: cumprir tarefas e metas te dá **XP**, evolui seus **atributos** e desbloqueia **conquistas**.

## Sobre o projeto

To-do lists tradicionais funcionam, mas raramente são divertidas. O CyberDo nasceu da ideia de transformar a rotina em algo parecido com um RPG: cada tarefa concluída deixa de ser só um checkmark e passa a ser uma ação que faz seu "personagem" evoluir.

A proposta central é tornar a produtividade **ramificada e progressiva** — você não só marca o que fez, você vê o impacto disso refletido em estatísticas, níveis e conquistas ao longo do tempo.

## Funcionalidades

- **Tarefas e metas** organizadas em formato ramificado
- **Sistema de XP** — cada tarefa cumprida concede pontos de experiência
- **Atributos** que melhoram conforme você completa diferentes tipos de tarefa
- **Sistema de conquistas** para marcar marcos importantes da sua jornada
- Visual com pegada **cyberpunk**, fugindo do look genérico dos apps de produtividade

> 📸 _Screenshots em breve._

## O que este projeto demonstra

- **Persistência com Core Data**: tarefas e metas são entidades do modelo `CyberDoModel`, acessadas por um `CoreDataController` central
- **MVVM**: ViewModels separados por área (`HomeViewModel`, `MetasModel`, `AchievementViewModel`)
- **Swift Charts** para visualizar o progresso no perfil
- **Identidade visual própria** com fontes customizadas e componentes SwiftUI reutilizáveis

## Tecnologias

- Swift 5 · SwiftUI
- Core Data
- Swift Charts

## Estrutura do projeto

```
CyberDo/CyberDo/
├── HomeView/          # Lista de tarefas e criação de tarefas
├── ProfileView/       # Nível, metas, ofensiva e gráfico de progresso
├── AchievementView/   # Conquistas
├── Models/            # CoreDataController, ViewModels e modelo Core Data
└── Font/              # Fontes customizadas
```

## Requisitos

- Xcode 16 ou superior
- iOS 18.5 ou superior

## Como rodar

1. Clone o repositório:
   ```bash
   git clone https://github.com/JonasFNMelo/CyberDo.git
   ```
2. Abra `CyberDo/CyberDo.xcodeproj` no **Xcode**.
3. Selecione um simulador de iPhone e execute (`⌘R`).

## Autor

- [**Jonas Melo**](https://github.com/JonasFNMelo)

---

> Sua rotina, em modo RPG. 🕹️
