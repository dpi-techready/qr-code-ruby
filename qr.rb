
def choices
p "What type of QR code would you like to generate?"
p
p "Enter 1 for website"
p "Enter 2 for WIFI access"
p "Enter 3 for text message"
p "Enter 4 to exit"
end


while true
  choices
  user_input = gets.chomp.to_i
if user_input == 4
  p "You have exit this program successfully"
  break
elsif user_input == 3
  p "you selected 3"
elsif user_input == 2
  p "you selected 2"
else user_input == 1
  p "you selected 1"
  end
  puts
end  


# Get it working in one file
# Create classes and methods to encapsulate each piece of logic
# Move the classes into their own files and require them
