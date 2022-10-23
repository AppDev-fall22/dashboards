Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Homepage route
  get("/", { :controller => "application", :action => "homepage"})

  #Foreign exchange
  get("/forex", { :controller => "application", :action => "currency_pairs"})
  get("/forex/:this_symbol", { :controller => "application", :action => "conversion_pairs"})
  get("/forex/:symbol_from/:symbol_to", { :controller => "application", :action => "conversion_results"})
end
