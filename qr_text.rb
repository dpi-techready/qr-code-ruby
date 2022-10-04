
require "rqrcode"

puts "You have chosen to generate a QR code to create a text message"

puts "Enter the recipiet's phone number"

phone_number = gets.chomp

puts "Enter a message"

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
