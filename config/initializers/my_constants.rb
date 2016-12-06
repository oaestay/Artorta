# coding: utf-8
require 'ostruct'

STOP_WORDS = ['', 'un', 'una', 'unas', 'unos', 'uno', 'sobre', 'de', 'a', 'o',
  'todo', 'también', 'tras', 'otro', 'algún', 'alguno', 'alguna', 'algunos',
  'algunas', 'es', 'eres', 'esta', 'estan', 'como', 'en', 'para', 'atras',
  'ambos', 'pero', 'por', 'cada', 'tiene', 'tienen', 'el', 'la', 'lo', 'las',
  'los', 'su', 'si', 'dentro', 'solo', 'ultimo', 'largo', 'e', 'i', 'u', 'y',
  'bastante', 'muchos', 'sus', 'dos', 'bajo', 'arriba', 'encima', 'muy', 'bien',
  'con', 'entre', 'sin', 'de', 'del', 'mi', '_']

MENU_DECORADAS = {
  "ninas" => "Niñas",
  "ninos" => "Niños",
  "primeros_anitos" => "Primeros Añitos",
  "bautizo" => "Bautizo",
  "baby_shower" => "Baby Shower",
  "primera_comunion" => "Primera Comunión",
  "enamorados" => "Enamorados",
  "juveniles" => "Juveniles",
  "ellas" => "Ellas",
  "ellos" => "Ellos",
  "juegos" => "Juegos",
  "cine" => "Cine",
  "musica" => "Música",
  "deportes" => "Deportes",
  "oficios" => "Oficios",
  "graduacion" => "Graduación",
  "navidad" => "Navidad",
  "despedida_solteros" => "Despedida de Solteros",
  "vehiculos" => "Vehículos",
  "halloween" => "Halloween",
  "otros" => "Otros",
}

MENU_NOVIOS = {
  "novios_pequenos" => "Novios Pequeños",
  "tematicas" => "Temáticas",
  "clasicas" => "Clásicas",
  "flores" => "Flores",
  "vintage" => "Vintage",
  "modernas" => "Modernas",
  "sombras" => "Sombras",
  "castillos" => "Castillos y Carruajes",
  "chile_lugares" => "Chile y el mundo",
  "musica" => "Música",
  "cuadradas" => "Cuadradas",
  "cupcakes_minitortas" => "Cupcakes y Minitortas",
}

MENU_TRADICIONALES = {
  "bizcocho" => "Bizcocho",
  "merengue" => "Merengue",
  "panqueque" => "Panqueque",
}

MENU_CUPCAKES = {
  "ninos" => "Niños",
  "eventos" => "Eventos"
}
