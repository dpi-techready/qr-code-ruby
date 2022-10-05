require "rqrcode"  

def choices
p "What type of QR code would you like to generate?"
p
p "Enter 1 for website"
p "Enter 2 for WIFI access"
p "Enter 3 for text message"
p "Enter 4 to exit"
end

def website_qr
# promp user to enter url
puts "Enter url for website"

# store url in variable
website_url = gets.chomp

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new(website_url)

# promp user to enter file name for QR code image
puts "Enter desired name for image file"
filename = gets.chomp

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite(filename + ".png", png.to_s)

# let user know qr code image is ready
puts "QR code file #{filename}.png for #{website_url.to_s} is ready!"
end

def wifi_qr
# promp user to enter an SSID
puts "Enter the network's SSID"

# store value for SSID
wifi_ssid = gets.chomp

# promp user to enter password
puts "Enter the network's password"

# store value for password
password = gets.chomp

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi_ssid};P:#{password};;")

# promp user to enter file name for QR code image
puts "Enter desired name for image file"
filename = gets.chomp

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite(filename + ".png", png.to_s)

# let user know qr code image is ready
puts "QR code file #{filename}.png for #{wifi_ssid} is ready!"
end


def text_qr
# propmt user to enter a recipient's phone number
puts "Enter the recipiet's phone number"

# store value for phone number
phone_number = gets.chomp

# propmt user to enter a message
puts "Enter a message"

# store value for pmessage
message = gets.chomp

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("SMSTO: #{phone_number}:Hi #{message}")

# promp user to enter file name for QR code image
puts "Enter desired name for image file"
filename = gets.chomp

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite(filename + ".png", png.to_s)

# let user know qr code image is ready
puts "QR code file #{filename}.png for #{phone_number} with message: #{message} is ready!"
end

while true
  choices
  user_input = gets.chomp.to_i
if user_input == 4
  p "You have exit this program successfully"
  break
elsif user_input == 3
  puts "You have chosen to generate a QR code to create a text message"
  puts
  text_qr
elsif user_input == 2
  puts "You have chosen to generate a QR code to access a WIFI network"
  puts
  wifi_qr
else user_input == 1
  puts "You have chosen to generate a QR code for a website"
  puts
  website_qr
  end
end  
