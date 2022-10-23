require "open-uri"
require "json"

class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "homepage_template.html.erb"})
  end

  def currency_pairs
    symbols_endpoint = "https://api.exchangerate.host/symbols"
    raw_data = URI.open(symbols_endpoint).read
    parsed_data = JSON.parse(raw_data)
    symbols_hash = parsed_data.fetch("symbols")

    @symbols_list = symbols_hash.keys

    render({ :template => "currency_pairs_template.html.erb"})
  end

  def conversion_pairs
    @current_symbol = params.fetch("this_symbol")

    symbols_endpoint = "https://api.exchangerate.host/symbols"
    raw_data = URI.open(symbols_endpoint).read
    parsed_data = JSON.parse(raw_data)
    symbols_hash = parsed_data.fetch("symbols")

    @symbols_list = symbols_hash.keys

    render({ :template => "conversion_pairs_template.html.erb"})
  end

  def conversion_results
    @symbol1 = params.fetch("symbol_from")
    @symbol2 = params.fetch("symbol_to")

    conversion_endpoint = "https://api.exchangerate.host/convert?from=#{@symbol1}&to=#{@symbol2}"
    
    raw_data = URI.open(conversion_endpoint).read
    @parsed_data = JSON.parse(raw_data)
    @exchange_rate = @parsed_data.fetch("result")

    render({ :template => "conversion_results_template.html.erb"})
  end
end
