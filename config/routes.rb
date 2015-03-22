Rails.application.routes.draw do

  controller :spreads, path: 'spreads', as: :spreads do
    get '/' => :index
  end

end
