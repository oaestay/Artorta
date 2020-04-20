class BackfillCategories < ActiveRecord::Migration[5.2]
  CATEGORIES = {
    decoradas: {
      unicornios: "Unicornios",
      ninas: "Niñas",
      ninos: "Niños",
      primeros_anitos: "Primeros Añitos",
      emojis: "Emojis",
      bautizo: "Bautizo",
      baby_shower: "Baby Shower",
      primera_comunion: "Primera Comunión",
      enamorados: "Enamorados",
      juveniles: "Juveniles",
      ellas: "Ellas",
      ellos: "Ellos",
      juegos: "Juegos",
      cine: "Cine",
      musica: "Música",
      deportes: "Deportes",
      oficios: "Oficios",
      graduacion: "Graduación",
      navidad: "Navidad",
      despedida_solteros: "Despedida de Solteros",
      vehiculos: "Vehículos",
      halloween: "Halloween",
      otros: "Otros",
    },
    novios: {
      boda: "Boda",
      novios_pequenos: "Novios Pequeños"
    },
    tradicionales: {
      bizcocho: "Bizcocho",
      merengue: "Merengue",
      panqueque: "Panqueque",
      honey_cakes: "Honey Cakes",
    },
    cupcakes: {
      tradicionales: "Tradicionales",
      novios: "Novios",
      bautizo: "Bautizo",
      primeros_anitos: "Primeros Añitos",
      ninas: "Niñas",
      ninos: "Niños",
      enamorados: "Enamorados",
      ellas: "Ellas",
      ellos: "Ellos",
      juegos: "Juegos",
      navidad: "Navidad",
    },
    coctel: {
      panqueque: "Panqueque",
      pies: "Pies",
      piesdulces_chilenos: "Piesdulces Chilenos",
    },
    postres: {},
    pies: {},
    chocolateria: {},
    galletones: {}
  }

  def up
    CATEGORIES.each do |name, subcategories|
      Category.create! name: name, subcategories: subcategories, realm: :decorated
    end
  end

  def down
    Category.destroy_all
  end
end
