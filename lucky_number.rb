require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end


get("/dice/2/6") do
    die_one = rand(1..6)
    die_two = rand(1..6)
    sum = die_one + die_two
    @outcome = "You rolled a #{die_one} and a #{die_two} for a total of #{sum}"
  erb(:twoxsix)
end

get("/dice/2/10") do
  die_one = rand(1..10)
  die_two = rand(1..10)
  sum = die_one + die_two
  @outcome = "You rolled a #{die_one} and a #{die_two} for a total of #{sum}"
  erb(:twoxten)
end

get("/dice/1/20") do
  @die_one = rand(1..20)
  sum = @die_one
  @outcome = "You rolled a #{@die_one} for a total of #{@sum}"
  erb(:onextwenty)
end

get("/dice/5/4") do
  die_one = rand(1..4)
  die_two = rand(1..4)
  die_three = rand(1..4)
  die_four = rand(1..4)
  die_five = rand(1..4)
  sum = die_one + die_two + die_three + die_four + die_five
  @outcome = "You rolled a #{die_one}, a #{die_two}, a #{die_three}, a #{die_four} and a #{die_five} for a total of #{sum}"
  erb(:fivexfour)
end

get("/dice/100/6") do
 @rolls = [] 
 counter = 1
 while counter <=100
  number = rand(1..6)
  @rolls.push(number)
  counter = counter + 1
 end
  @outcome = "You rolled a sum of #{@rolls.sum}"
  erb(:onehundredxsix)
end
