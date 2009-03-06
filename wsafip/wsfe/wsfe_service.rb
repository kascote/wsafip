require 'wsfe/wsfe_driver'

class WSFEService
  attr_reader :response
  attr_accessor :requests

  HOMO_WS = 'https://wswhomo.afip.gov.ar/wsfe/service.asmx'
  PROD_WS = 'https://servicios1.afip.gov.ar/wsfe/service.asmx'

  def initialize(wsaa_ticket, cuit, service = :homo)
    @wsaa_ticket = wsaa_ticket
    @cuit = cuit
    @service = service
  end

  def cae_request( is_service, uniqueid = Time.now.to_i)
    @is_service = is_service ? 1 : 0
    @uniqueid = uniqueid
    @requests = []
  end

  def do_request
    auth = FEAuthRequest.new( @wsaa_ticket.token, @wsaa_ticket.sign, @cuit )
    fecr = FECabeceraRequest.new( @uniqueid, @requests.size, @is_service )
    fedr = build_fedr
    fereq = FERequest.new( fecr, fedr )
    autReq = FEAutRequest.new( auth, fereq )

    obj = ServiceSoap.new( @service == :prod ? PROD_WS : HOMO_WS )
    obj.streamhandler.client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @response = obj.fEAutRequest(autReq).fEAutRequestResult
  end
  
  def get_ultimo_nro_comprobante(pto_vta, tipo_cbte)
    auth = FEAuthRequest.new( @wsaa_ticket.token, @wsaa_ticket.sign, @cuit )
    cpm = FELastCMPtype.new(pto_vta, tipo_cbte)
    req = FERecuperaLastCMPRequest.new(auth,cpm)
    obj = ServiceSoap.new( @service == :prod ? PROD_WS : HOMO_WS )
    obj.streamhandler.client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
    obj.fERecuperaLastCMPRequest(req).fERecuperaLastCMPRequestResult
  end

  private

  def build_fedr
    fedr = ArrayOfFEDetalleRequest.new
    @requests.each {|req|
      fedr << FEDetalleRequest.new( req[:tipo_doc],  req[:nro_doc],
                    req[:tipo_cbte], req[:punto_vta],  req[:cbt_desde],
                    req[:cbt_hasta], req[:imp_total],  req[:imp_tot_conc],
                    req[:imp_neto],  req[:impto_liq],  req[:impto_liq_nri],
                    req[:imp_op_ex], req[:fecha_cbte], req[:fecha_serv_desde],
                    req[:fecha_serv_hasta], req[:fecha_venc_pago])
    }
    return fedr
  end

end




#endpoint_url = ARGV.shift
#obj = ServiceSoap.new(endpoint_url)
#obj.streamhandler.client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE

# run ruby with -d to see SOAP wiredumps.
#obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   FERecuperaQTYRequest(parameters)
#
# ARGS
#   parameters      FERecuperaQTYRequest - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTYRequest
#
# RETURNS
#   parameters      FERecuperaQTYRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTYRequestResponse
#
#parameters = nil
#puts obj.fERecuperaQTYRequest(parameters)

# SYNOPSIS
#   FEDummy(parameters)
#
# ARGS
#   parameters      FEDummy - {http://ar.gov.afip.dif.facturaelectronica/}FEDummy
#
# RETURNS
#   parameters      FEDummyResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEDummyResponse
#
#parameters = nil
#puts obj.fEDummy(parameters)

# SYNOPSIS
#   FERecuperaLastCMPRequest(parameters)
#
# ARGS
#   parameters      FERecuperaLastCMPRequest - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaLastCMPRequest
#
# RETURNS
#   parameters      FERecuperaLastCMPRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaLastCMPRequestResponse
#
#parameters = nil
#puts obj.fERecuperaLastCMPRequest(parameters)

# SYNOPSIS
#   FEUltNroRequest(parameters)
#
# ARGS
#   parameters      FEUltNroRequest - {http://ar.gov.afip.dif.facturaelectronica/}FEUltNroRequest
#
# RETURNS
#   parameters      FEUltNroRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEUltNroRequestResponse
#
#parameters = nil
#puts obj.fEUltNroRequest(parameters)

# SYNOPSIS
#   FEAutRequest(parameters)
#
# ARGS
#   parameters      FEAutRequest - {http://ar.gov.afip.dif.facturaelectronica/}FEAutRequest
#
# RETURNS
#   parameters      FEAutRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEAutRequestResponse
#
#auth = FEAuthRequest.new( wsaa_req.token, wsaa_req.sign, 2021903344 )
#fecr = FECabeceraRequest.new( 123456, 1, 1)
#fedr = FEDetalleRequest.new( 80, 2021903344, 6, 1, 1010, 1010, 123.45, 0, 123.45, 0, 0, 20080418, 20080301, 20080331, 20080430)
#fereq = FERequest.new( fecr, [fedr])
#fereq = FEAutRequest.new( auth, fereq)
#puts obj.fEAutRequest(parameters)

# SYNOPSIS
#   FEConsultaCAERequest(parameters)
#
# ARGS
#   parameters      FEConsultaCAERequest - {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAERequest
#
# RETURNS
#   parameters      FEConsultaCAERequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAERequestResponse
#
#parameters = nil
#puts obj.fEConsultaCAERequest(parameters)


#endpoint_url = ARGV.shift
#obj = ServiceSoap.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
#obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   FERecuperaQTYRequest(parameters)
#
# ARGS
#   parameters      FERecuperaQTYRequest - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTYRequest
#
# RETURNS
#   parameters      FERecuperaQTYRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTYRequestResponse
#
#parameters = nil
#puts obj.fERecuperaQTYRequest(parameters)

# SYNOPSIS
#   FEDummy(parameters)
#
# ARGS
#   parameters      FEDummy - {http://ar.gov.afip.dif.facturaelectronica/}FEDummy
#
# RETURNS
#   parameters      FEDummyResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEDummyResponse
#
#parameters = nil
#puts obj.fEDummy(parameters)

# SYNOPSIS
#   FERecuperaLastCMPRequest(parameters)
#
# ARGS
#   parameters      FERecuperaLastCMPRequest - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaLastCMPRequest
#
# RETURNS
#   parameters      FERecuperaLastCMPRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaLastCMPRequestResponse
#
#parameters = nil
#puts obj.fERecuperaLastCMPRequest(parameters)

# SYNOPSIS
#   FEUltNroRequest(parameters)
#
# ARGS
#   parameters      FEUltNroRequest - {http://ar.gov.afip.dif.facturaelectronica/}FEUltNroRequest
#
# RETURNS
#   parameters      FEUltNroRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEUltNroRequestResponse
#
#parameters = nil
#puts obj.fEUltNroRequest(parameters)

# SYNOPSIS
#   FEAutRequest(parameters)
#
# ARGS
#   parameters      FEAutRequest - {http://ar.gov.afip.dif.facturaelectronica/}FEAutRequest
#
# RETURNS
#   parameters      FEAutRequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEAutRequestResponse
#
#parameters = nil
#puts obj.fEAutRequest(parameters)

# SYNOPSIS
#   FEConsultaCAERequest(parameters)
#
# ARGS
#   parameters      FEConsultaCAERequest - {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAERequest
#
# RETURNS
#   parameters      FEConsultaCAERequestResponse - {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAERequestResponse
#
#parameters = nil
#puts obj.fEConsultaCAERequest(parameters)


#endpoint_url = ARGV.shift
#obj = ServiceHttpGet.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
#obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   FEDummy
#
# ARGS
#   N/A
#
# RETURNS
#   body            DummyResponse - {http://ar.gov.afip.dif.facturaelectronica/}DummyResponse
#

#puts obj.fEDummy


#endpoint_url = ARGV.shift
#obj = ServiceHttpPost.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
#obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   FEDummy
#
# ARGS
#   N/A
#
# RETURNS
#   body            DummyResponse - {http://ar.gov.afip.dif.facturaelectronica/}DummyResponse
#

#puts obj.fEDummy


