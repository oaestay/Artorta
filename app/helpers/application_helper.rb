module ApplicationHelper
  def navbar_links
    [
      { name: 'Inicio', url: root_url },
      { name: 'Catálogo', url: catalog_url },
      { name: 'Comprar', url: buy_url },
      { name: 'Despacho', url: delivery_url },
      { name: 'Sabores', url: flavours_url },
      { name: 'Prensa', url: press_url },
      { name: 'Empresas', url: companies_url },
      { name: 'Ubicación', url: location_url },
      { name: 'Nosotros', url: us_url }
    ]
  end
end
