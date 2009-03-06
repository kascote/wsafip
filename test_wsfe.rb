require 'rubygems'
gem 'soap4r'
require 'wsafip/wsafip'

ticket = WSAA::WSAAService.request_ticket( :service => 'wsfe',
                                           :certificate => 'certs/fe_netflux.crt',
                                           :private_key => 'certs/fe_pk_netflux.key')

unless ticket.error

  puts "armando solicitud"
  wsfe = WSFEService.new( ticket, 20219033444 )
  wsfe.cae_request(false)
  wsfe.requests << { :tipo_doc => 80,       :nro_doc => 20219033431,   :tipo_cbte => 6,     
                     :punto_vta => 1,       :cbt_desde => 12,           :cbt_hasta => 12,  
                     :imp_total => 123.45,  :imp_tot_conc => 0,        :imp_neto => 123.45, 
                     :impto_liq => 0,       :impto_liq_nri => 0,       :imp_op_ex => 0,
					 :presta_serv => 0, # 0 = ventas , 1 = servicio
                     :fecha_cbte => '20081201',       
					 :fecha_serv_desde => '20081201' , :fecha_serv_hasta => '20081201', 
					 :fecha_venc_pago => '20081201' }
  wsfe.requests << { :tipo_doc => 80,       :nro_doc => 20219033431,   :tipo_cbte => 6,     
                     :punto_vta => 1,       :cbt_desde => 13,           :cbt_hasta => 13,
                     :imp_total => 123.45,  :imp_tot_conc => 0,        :imp_neto => 123.45, 
					 :presta_serv => 0, # 0 = ventas , 1 = servicio
                     :impto_liq => 0,       :impto_liq_nri => 0,       :imp_op_ex => 0,
                     :fecha_cbte => '20081201',       :fecha_serv_desde => '20081201' ,
                     :fecha_serv_hasta => '20081201', :fecha_venc_pago => '20081202' }

  puts "haciendo request"
  wsfe.do_request
  if wsfe.response.rError.percode != 0
    puts "Error: #{wsfe.response.rError.perrmsg} [#{wsfe.response.rError.percode}]"
  else
    wsfe.response.fedResp.each do |fr|
      puts "#{fr.tipo_cbte} #{fr.punto_vta}-#{fr.cbt_desde}/#{fr.cbt_hasta} : #{fr.cae}"
      puts fr.inspect
    end
  end
  
  req = wsfe.get_ultimo_nro_comprobante(1, 6)
  puts req.cbte_nro
  puts req.rError.percode
  puts req.rError.perrmsg

else
  puts ticket.error
end
