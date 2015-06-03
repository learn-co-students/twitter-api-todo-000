#This is my freeform test of running the Twitter API

require_relative './twitter.rb'

test = TwitterApi.new

=begin
puts "What is your name"
name = gets.chomp
puts "Oh, hello #{name}."
puts "Let's play a game"
sleep(2)
puts "It's called: What about me is publically available on Twitter!"
sleep(2)
puts "Ready? Let's go"
sleep(2)
=end
puts "What is your twitter username? Don't worry, I won't ask for your password..."
username = gets.chomp
puts "Ok.. Lets see..."
number = test.number_of_followers_for(username)
puts "You have #{number} followers."
if number < 50 then puts "That is not very much..." else puts "That is not bad." end
puts "Do you want to know more? Press Y to continue."
response = gets.chomp
until response == "Y"
  response = get.chomp
end
names = test.find_followers_names_for(username)
puts "Their names are:"
names.each_with_index {|name, index| puts "#{index}. #{name}"}