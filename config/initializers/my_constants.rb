# coding: utf-8
require 'ostruct'

STOP_WORDS = ['', 'un', 'una', 'unas', 'unos', 'uno', 'sobre', 'de', 'a', 'o',
  'todo', 'también', 'tras', 'otro', 'algún', 'alguno', 'alguna', 'algunos',
  'algunas', 'es', 'eres', 'esta', 'estan', 'como', 'en', 'para', 'atras',
  'ambos', 'pero', 'por', 'cada', 'tiene', 'tienen', 'el', 'la', 'lo', 'las',
  'los', 'su', 'si', 'dentro', 'solo', 'ultimo', 'largo', 'e', 'i', 'u', 'y',
  'bastante', 'muchos', 'sus', 'dos', 'bajo', 'arriba', 'encima', 'muy', 'bien',
  'con', 'entre', 'sin', 'de', 'del', 'mi', '_']
