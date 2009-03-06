require 'xsd/qname'

# {http://ar.gov.afip.dif.facturaelectronica/}FEAuthRequest
#   token - SOAP::SOAPString
#   sign - SOAP::SOAPString
#   cuit - SOAP::SOAPLong
class FEAuthRequest
  attr_accessor :token
  attr_accessor :sign
  attr_accessor :cuit

  def initialize(token = nil, sign = nil, cuit = nil)
    @token = token
    @sign = sign
    @cuit = cuit
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTYResponse
#   qty - FERecuperaQTY
#   rError - VError
class FERecuperaQTYResponse
  attr_accessor :qty
  attr_accessor :rError

  def initialize(qty = nil, rError = nil)
    @qty = qty
    @rError = rError
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTY
#   value - SOAP::SOAPInt
class FERecuperaQTY
  attr_accessor :value

  def initialize(value = nil)
    @value = value
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}vError
#   percode - SOAP::SOAPInt
#   perrmsg - SOAP::SOAPString
class VError
  attr_accessor :percode
  attr_accessor :perrmsg

  def initialize(percode = nil, perrmsg = nil)
    @percode = percode
    @perrmsg = perrmsg
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}DummyResponse
#   appserver - SOAP::SOAPString
#   dbserver - SOAP::SOAPString
#   authserver - SOAP::SOAPString
class DummyResponse
  attr_accessor :appserver
  attr_accessor :dbserver
  attr_accessor :authserver

  def initialize(appserver = nil, dbserver = nil, authserver = nil)
    @appserver = appserver
    @dbserver = dbserver
    @authserver = authserver
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FELastCMPtype
#   ptoVta - SOAP::SOAPInt
#   tipoCbte - SOAP::SOAPInt
class FELastCMPtype
  attr_accessor :ptoVta
  attr_accessor :tipoCbte

  def initialize(ptoVta = nil, tipoCbte = nil)
    @ptoVta = ptoVta
    @tipoCbte = tipoCbte
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaLastCMPResponse
#   cbte_nro - SOAP::SOAPInt
#   rError - VError
class FERecuperaLastCMPResponse
  attr_accessor :cbte_nro
  attr_accessor :rError

  def initialize(cbte_nro = nil, rError = nil)
    @cbte_nro = cbte_nro
    @rError = rError
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEUltNroResponse
#   nro - UltNroResponse
#   rError - VError
class FEUltNroResponse
  attr_accessor :nro
  attr_accessor :rError

  def initialize(nro = nil, rError = nil)
    @nro = nro
    @rError = rError
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}UltNroResponse
#   value - SOAP::SOAPLong
class UltNroResponse
  attr_accessor :value

  def initialize(value = nil)
    @value = value
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERequest
#   fecr - FECabeceraRequest
#   fedr - ArrayOfFEDetalleRequest
class FERequest
  attr_accessor :fecr
  attr_accessor :fedr

  def initialize(fecr = nil, fedr = nil)
    @fecr = fecr
    @fedr = fedr
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FECabeceraRequest
#   id - SOAP::SOAPLong
#   cantidadreg - SOAP::SOAPInt
#   presta_serv - SOAP::SOAPInt
class FECabeceraRequest
  attr_accessor :id
  attr_accessor :cantidadreg
  attr_accessor :presta_serv

  def initialize(id = nil, cantidadreg = nil, presta_serv = nil)
    @id = id
    @cantidadreg = cantidadreg
    @presta_serv = presta_serv
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}ArrayOfFEDetalleRequest
class ArrayOfFEDetalleRequest < ::Array
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEDetalleRequest
#   tipo_doc - SOAP::SOAPInt
#   nro_doc - SOAP::SOAPLong
#   tipo_cbte - SOAP::SOAPInt
#   punto_vta - SOAP::SOAPInt
#   cbt_desde - SOAP::SOAPLong
#   cbt_hasta - SOAP::SOAPLong
#   imp_total - SOAP::SOAPDouble
#   imp_tot_conc - SOAP::SOAPDouble
#   imp_neto - SOAP::SOAPDouble
#   impto_liq - SOAP::SOAPDouble
#   impto_liq_rni - SOAP::SOAPDouble
#   imp_op_ex - SOAP::SOAPDouble
#   fecha_cbte - SOAP::SOAPString
#   fecha_serv_desde - SOAP::SOAPString
#   fecha_serv_hasta - SOAP::SOAPString
#   fecha_venc_pago - SOAP::SOAPString
class FEDetalleRequest
  attr_accessor :tipo_doc
  attr_accessor :nro_doc
  attr_accessor :tipo_cbte
  attr_accessor :punto_vta
  attr_accessor :cbt_desde
  attr_accessor :cbt_hasta
  attr_accessor :imp_total
  attr_accessor :imp_tot_conc
  attr_accessor :imp_neto
  attr_accessor :impto_liq
  attr_accessor :impto_liq_rni
  attr_accessor :imp_op_ex
  attr_accessor :fecha_cbte
  attr_accessor :fecha_serv_desde
  attr_accessor :fecha_serv_hasta
  attr_accessor :fecha_venc_pago

  def initialize(tipo_doc = nil, nro_doc = nil, tipo_cbte = nil, punto_vta = nil, cbt_desde = nil, cbt_hasta = nil, imp_total = nil, imp_tot_conc = nil, imp_neto = nil, impto_liq = nil, impto_liq_rni = nil, imp_op_ex = nil, fecha_cbte = nil, fecha_serv_desde = nil, fecha_serv_hasta = nil, fecha_venc_pago = nil)
    @tipo_doc = tipo_doc
    @nro_doc = nro_doc
    @tipo_cbte = tipo_cbte
    @punto_vta = punto_vta
    @cbt_desde = cbt_desde
    @cbt_hasta = cbt_hasta
    @imp_total = imp_total
    @imp_tot_conc = imp_tot_conc
    @imp_neto = imp_neto
    @impto_liq = impto_liq
    @impto_liq_rni = impto_liq_rni
    @imp_op_ex = imp_op_ex
    @fecha_cbte = fecha_cbte
    @fecha_serv_desde = fecha_serv_desde
    @fecha_serv_hasta = fecha_serv_hasta
    @fecha_venc_pago = fecha_venc_pago
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEResponse
#   fecResp - FECabeceraResponse
#   fedResp - ArrayOfFEDetalleResponse
#   rError - VError
class FEResponse
  attr_accessor :fecResp
  attr_accessor :fedResp
  attr_accessor :rError

  def initialize(fecResp = nil, fedResp = nil, rError = nil)
    @fecResp = fecResp
    @fedResp = fedResp
    @rError = rError
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FECabeceraResponse
#   id - SOAP::SOAPLong
#   cuit - SOAP::SOAPLong
#   fecha_cae - SOAP::SOAPString
#   cantidadreg - SOAP::SOAPInt
#   resultado - SOAP::SOAPString
#   motivo - SOAP::SOAPString
#   reproceso - SOAP::SOAPString
#   presta_serv - SOAP::SOAPInt
class FECabeceraResponse
  attr_accessor :id
  attr_accessor :cuit
  attr_accessor :fecha_cae
  attr_accessor :cantidadreg
  attr_accessor :resultado
  attr_accessor :motivo
  attr_accessor :reproceso
  attr_accessor :presta_serv

  def initialize(id = nil, cuit = nil, fecha_cae = nil, cantidadreg = nil, resultado = nil, motivo = nil, reproceso = nil, presta_serv = nil)
    @id = id
    @cuit = cuit
    @fecha_cae = fecha_cae
    @cantidadreg = cantidadreg
    @resultado = resultado
    @motivo = motivo
    @reproceso = reproceso
    @presta_serv = presta_serv
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}ArrayOfFEDetalleResponse
class ArrayOfFEDetalleResponse < ::Array
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEDetalleResponse
#   tipo_doc - SOAP::SOAPInt
#   nro_doc - SOAP::SOAPLong
#   tipo_cbte - SOAP::SOAPInt
#   punto_vta - SOAP::SOAPInt
#   cbt_desde - SOAP::SOAPLong
#   cbt_hasta - SOAP::SOAPLong
#   imp_total - SOAP::SOAPDouble
#   imp_tot_conc - SOAP::SOAPDouble
#   imp_neto - SOAP::SOAPDouble
#   impto_liq - SOAP::SOAPDouble
#   impto_liq_rni - SOAP::SOAPDouble
#   imp_op_ex - SOAP::SOAPDouble
#   resultado - SOAP::SOAPString
#   cae - SOAP::SOAPString
#   fecha_cbte - SOAP::SOAPString
#   fecha_vto - SOAP::SOAPString
#   motivo - SOAP::SOAPString
#   fecha_serv_desde - SOAP::SOAPString
#   fecha_serv_hasta - SOAP::SOAPString
#   fecha_venc_pago - SOAP::SOAPString
class FEDetalleResponse
  attr_accessor :tipo_doc
  attr_accessor :nro_doc
  attr_accessor :tipo_cbte
  attr_accessor :punto_vta
  attr_accessor :cbt_desde
  attr_accessor :cbt_hasta
  attr_accessor :imp_total
  attr_accessor :imp_tot_conc
  attr_accessor :imp_neto
  attr_accessor :impto_liq
  attr_accessor :impto_liq_rni
  attr_accessor :imp_op_ex
  attr_accessor :resultado
  attr_accessor :cae
  attr_accessor :fecha_cbte
  attr_accessor :fecha_vto
  attr_accessor :motivo
  attr_accessor :fecha_serv_desde
  attr_accessor :fecha_serv_hasta
  attr_accessor :fecha_venc_pago

  def initialize(tipo_doc = nil, nro_doc = nil, tipo_cbte = nil, punto_vta = nil, cbt_desde = nil, cbt_hasta = nil, imp_total = nil, imp_tot_conc = nil, imp_neto = nil, impto_liq = nil, impto_liq_rni = nil, imp_op_ex = nil, resultado = nil, cae = nil, fecha_cbte = nil, fecha_vto = nil, motivo = nil, fecha_serv_desde = nil, fecha_serv_hasta = nil, fecha_venc_pago = nil)
    @tipo_doc = tipo_doc
    @nro_doc = nro_doc
    @tipo_cbte = tipo_cbte
    @punto_vta = punto_vta
    @cbt_desde = cbt_desde
    @cbt_hasta = cbt_hasta
    @imp_total = imp_total
    @imp_tot_conc = imp_tot_conc
    @imp_neto = imp_neto
    @impto_liq = impto_liq
    @impto_liq_rni = impto_liq_rni
    @imp_op_ex = imp_op_ex
    @resultado = resultado
    @cae = cae
    @fecha_cbte = fecha_cbte
    @fecha_vto = fecha_vto
    @motivo = motivo
    @fecha_serv_desde = fecha_serv_desde
    @fecha_serv_hasta = fecha_serv_hasta
    @fecha_venc_pago = fecha_venc_pago
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAEReq
#   cuit_emisor - SOAP::SOAPLong
#   tipo_cbte - SOAP::SOAPInt
#   punto_vta - SOAP::SOAPInt
#   cbt_nro - SOAP::SOAPLong
#   imp_total - SOAP::SOAPDouble
#   cae - SOAP::SOAPString
#   fecha_cbte - SOAP::SOAPString
class FEConsultaCAEReq
  attr_accessor :cuit_emisor
  attr_accessor :tipo_cbte
  attr_accessor :punto_vta
  attr_accessor :cbt_nro
  attr_accessor :imp_total
  attr_accessor :cae
  attr_accessor :fecha_cbte

  def initialize(cuit_emisor = nil, tipo_cbte = nil, punto_vta = nil, cbt_nro = nil, imp_total = nil, cae = nil, fecha_cbte = nil)
    @cuit_emisor = cuit_emisor
    @tipo_cbte = tipo_cbte
    @punto_vta = punto_vta
    @cbt_nro = cbt_nro
    @imp_total = imp_total
    @cae = cae
    @fecha_cbte = fecha_cbte
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAEResponse
#   resultado - SOAP::SOAPInt
#   rError - VError
class FEConsultaCAEResponse
  attr_accessor :resultado
  attr_accessor :rError

  def initialize(resultado = nil, rError = nil)
    @resultado = resultado
    @rError = rError
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTYRequest
#   argAuth - FEAuthRequest
class FERecuperaQTYRequest
  attr_accessor :argAuth

  def initialize(argAuth = nil)
    @argAuth = argAuth
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaQTYRequestResponse
#   fERecuperaQTYRequestResult - FERecuperaQTYResponse
class FERecuperaQTYRequestResponse
  attr_accessor :fERecuperaQTYRequestResult

  def initialize(fERecuperaQTYRequestResult = nil)
    @fERecuperaQTYRequestResult = fERecuperaQTYRequestResult
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEDummy
class FEDummy
  def initialize
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEDummyResponse
#   fEDummyResult - DummyResponse
class FEDummyResponse
  attr_accessor :fEDummyResult

  def initialize(fEDummyResult = nil)
    @fEDummyResult = fEDummyResult
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaLastCMPRequest
#   argAuth - FEAuthRequest
#   argTCMP - FELastCMPtype
class FERecuperaLastCMPRequest
  attr_accessor :argAuth
  attr_accessor :argTCMP

  def initialize(argAuth = nil, argTCMP = nil)
    @argAuth = argAuth
    @argTCMP = argTCMP
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FERecuperaLastCMPRequestResponse
#   fERecuperaLastCMPRequestResult - FERecuperaLastCMPResponse
class FERecuperaLastCMPRequestResponse
  attr_accessor :fERecuperaLastCMPRequestResult

  def initialize(fERecuperaLastCMPRequestResult = nil)
    @fERecuperaLastCMPRequestResult = fERecuperaLastCMPRequestResult
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEUltNroRequest
#   argAuth - FEAuthRequest
class FEUltNroRequest
  attr_accessor :argAuth

  def initialize(argAuth = nil)
    @argAuth = argAuth
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEUltNroRequestResponse
#   fEUltNroRequestResult - FEUltNroResponse
class FEUltNroRequestResponse
  attr_accessor :fEUltNroRequestResult

  def initialize(fEUltNroRequestResult = nil)
    @fEUltNroRequestResult = fEUltNroRequestResult
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEAutRequest
#   argAuth - FEAuthRequest
#   fer - FERequest
class FEAutRequest
  attr_accessor :argAuth
  attr_accessor :fer

  def initialize(argAuth = nil, fer = nil)
    @argAuth = argAuth
    @fer = fer
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEAutRequestResponse
#   fEAutRequestResult - FEResponse
class FEAutRequestResponse
  attr_accessor :fEAutRequestResult

  def initialize(fEAutRequestResult = nil)
    @fEAutRequestResult = fEAutRequestResult
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAERequest
#   argAuth - FEAuthRequest
#   argCAERequest - FEConsultaCAEReq
class FEConsultaCAERequest
  attr_accessor :argAuth
  attr_accessor :argCAERequest

  def initialize(argAuth = nil, argCAERequest = nil)
    @argAuth = argAuth
    @argCAERequest = argCAERequest
  end
end

# {http://ar.gov.afip.dif.facturaelectronica/}FEConsultaCAERequestResponse
#   fEConsultaCAERequestResult - FEConsultaCAEResponse
class FEConsultaCAERequestResponse
  attr_accessor :fEConsultaCAERequestResult

  def initialize(fEConsultaCAERequestResult = nil)
    @fEConsultaCAERequestResult = fEConsultaCAERequestResult
  end
end
