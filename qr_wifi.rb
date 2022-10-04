
require "rqrcode"

puts "You have chosen to generate a QR code to access a WIFI network"

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
