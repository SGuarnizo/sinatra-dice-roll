require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "<h1>Dice Roll</h1>
    <ul>
      <li><a href ='/dice/2/6'>Roll two six-sided dice</a></li>
      <li><a href ='/dice/2/10'>Roll two ten-sided dice</a></li>
      <li><a href ='/dice/1/20'>Roll one twenty-sided dice</a></li>
      <li><a href ='/dice/5/4'>Roll five four-sided dice</a></li>
    </ul>"

end


get("/dice/2/6") do
    die_one = rand(1..6)
    die_two = rand(1..6)
    sum = die_one + die_two
    outcome = "You rolled a #{die_one} and a #{die_two} for a total of #{sum}"
  
  "<h1>2d6</h1>
  <p>#{outcome}</p>"

end

get("/dice/2/10") do
  die_one = rand(1..10)
  die_two = rand(1..10)
  sum = die_one + die_two
  outcome = "You rolled a #{die_one} and a #{die_two} for a total of #{sum}"

"<h1>2d10</h1>
<p>#{outcome}</p>"

end

get("/dice/1/20") do
  die_one = rand(1..20)
  sum = die_one
  outcome = "You rolled a #{die_one} for a total of #{sum}"

"<h1>1d20</h1>
<p>#{outcome}</p>"

end

get("/dice/5/4") do
  die_one = rand(1..4)
  die_two = rand(1..4)
  die_three = rand(1..4)
  die_four = rand(1..4)
  die_five = rand(1..4)
  sum = die_one + die_two + die_three + die_four + die_five
  outcome = "You rolled a #{die_one}, a #{die_two}, a #{die_three}, a #{die_four} and a #{die_five} for a total of #{sum}"

"<h1>5d4</h1>
<p>#{outcome}</p>"

end
