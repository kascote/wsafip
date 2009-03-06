require 'rubygems'
gem 'soap4r'
require 'wsafip/wsafip'

ticket = WSAA::WSAAService.request_ticket( :service => 'wsfe',
                                           :certificate => 'certs/fe_netflux.crt',
                                           :private_key => 'certs/fe_pk_netflux.key')

if ticket.error.nil?
  puts ticket.token
  puts ticket.sign
  puts ticket.verify
else
  puts "Error: #{ticket.error}"
end
