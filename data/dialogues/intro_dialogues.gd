class_name IntroDialogues
extends RefCounted

# Diálogos oficiais extraídos de 'Game Script (falas) - Pitagorome.pdf'

static func get_intro_sequence() -> Array:
	return [
		{
			"speaker": "Coordenadora",
			"text": "Ah, você chegou! Eu sou a Coordenadora da Escola Pitagórica srta. Margareth H., estávamos realmente precisando de um novo diretor desde que o último foi embora, os conflitos e os dilemas só tem aumentado."
		},
		{
			"speaker": "Coordenadora",
			"text": "Aqui na Escola Pitagórica nós vivemos um dia de cada vez, seu papel como diretor será organizar a escola e solucionar problemas, você deve estar se perguntando que tipos de problemas um diretor enfrentaria… só espero que você não vá embora como o último…"
		},
		{
			"speaker": "Coordenadora",
			"text": "Mas não se preocupe! sempre que se sentir perdido ou precisar de ajuda é só me procurar!"
		},
		{
			"speaker": "Coordenadora",
			"text": "Oh! Eu falei demais… me fale um pouco sobre você.",
			"event": "ask_name"
		},
		{
			"speaker": "Coordenadora",
			"text": "Seja Bem-Vindo(a), é um prazer te conhecer {player_name}! Seremos bons amigos a partir de agora."
		},
		{
			"speaker": "Coordenadora",
			"text": "Vamos! Preciso fazer um tour com você pela escola. Saia pela porta da sua sala para explorarmos o corredor!"
		}
	]

static func get_zelador_sequence() -> Array:
	return [
		{
			"speaker": "Coordenadora",
			"text": "Zelador, esse é o novo diretor da nossa escola, {player_title} {player_name}."
		},
		{
			"speaker": "Zelador",
			"text": "Bom dia. *continua a limpar o chão*"
		},
		{
			"speaker": "Coordenadora",
			"text": "Ele é sempre assim… vamos indo."
		}
	]

static func get_professor_matematica_sequence() -> Array:
	return [
		{
			"speaker": "Professor de Matemática",
			"text": "Olá! você deve ser o novo diretor(a), muito prazer eu sou o responsável pela parte matemática, se precisar da minha ajuda pode pedir… mas terá um preço… risada maléfica muahaha."
		},
		{
			"speaker": "Coordenadora",
			"text": "E aí está o professor de matemática, *cochicho* ele não é muito agradável, Depois vocês se acertam, vamos indo."
		}
	]

static func get_tour_complete_sequence() -> Array:
	return [
		{
			"speaker": "Coordenadora",
			"text": "Excelente! Apresentamos os principais servidores e espaços do corredor. Com tudo apresentado, nosso tour inicial está concluído!"
		},
		{
			"speaker": "Coordenadora",
			"text": "Agora você já pode retornar ao seu gabinete para iniciarmos a resolução dos desafios escolares do primeiro dia!"
		}
	]
