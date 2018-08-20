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
  "unicornios" => "Unicornios",
  "ninas" => "Niñas",
  "ninos" => "Niños",
  "primeros_anitos" => "Primeros Añitos",
  "emojis" => "Emojis",
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
  "vintage" => "Vintage",
  "tematicas" => "Temáticas",
  "flores" => "Flores",
  "sombras" => "Sombras",
  "novios_pequenos" => "Novios Pequeños",
  "modernas" => "Modernas",
  "chile_lugares" => "Chile y el mundo",
  "musica" => "Música",
  "cuadradas" => "Cuadradas",
  "cupcakes_minitortas" => "Cupcakes y Minitortas",
  "cupulas" => "Cúpulas",
}

MENU_TRADICIONALES = {
  "bizcocho" => "Bizcocho",
  "merengue" => "Merengue",
  "panqueque" => "Panqueque",
  "honey_cakes" => "Honey Cakes",
}

MENU_CUPCAKES = {
  "bautizo" => "Bautizo",
  "primeros_anitos" => "Primeros Añitos",
  "ninas" => "Niñas",
  "ninos" => "Niños",
  "enamorados" => "Enamorados",
  "ellas" => "Ellas",
  "ellos" => "Ellos",
  "tradicionales" => "Tradicionales",
  "decorados" => "Decorados",
  "novios" => "Novios",
}

MENU_COCTEL = {
  "panqueque" => "Panqueque",
  "pies" => "Pies",
  "piesdulces_chilenos" => "Piesdulces Chilenos",
}

MENU_POSTRES = {}
MENU_PIES = {}
MENU_CHOCOLATERIA = {}
MENU_GALLETONES = {}
