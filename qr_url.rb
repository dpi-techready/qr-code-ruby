require "rqrcode"
# require "io/console"

# oldsync = $stdout.sync
# $stdout.sync = true
# $stdin.sync = true

puts "You have chosen to generate a QR code for a website"

# explanation here
# $stdout.sync = true

# explanation here
# $stdout.flush

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

# $stdout.sync = oldsync
