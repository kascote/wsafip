require 'rubygems'
gem 'soap4r'
require 'wsafip/wsafip'

ticket = WSAA::WSAAService.request_ticket( :service => 'wsfe',
                                           :certificate => 'certs/fe_netflux.crt',
                                           :private_key => 'certs/fe_pk_netflux.key')

unless ticket.error
  wsfe = WSFEService.new( ticket, 20219033444 )
  req = wsfe.get_ultimo_nro_comprobante(1, 6)
  puts req.cbte_nro
else
  puts ticket.error
end
