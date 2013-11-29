require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'
# require 'pry'

QUOTES = []

#loads the form on the / page
get '/' do
  erb :form
end

# on submit, grabs the quote data from yahoofinance as quotes, stores it in QUOTES array
 # and redirects to /index results page, printing @quote
post '/quote' do

  @quote_symbol = params[:quote_symbol]

  quotes = YahooFinance::get_standard_quotes( @quote_symbol )

  QUOTES << quotes[@quote_symbol.upcase].lastTrade

  redirect "/index"

end

get '/index' do
  # @quote_symbol = params[:quote_symbol]
  @quote_symbol
  "#{@quote_symbol}"

  @quote = QUOTES.pop
  "#{@quote}"

erb :index
end




