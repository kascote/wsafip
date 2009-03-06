require 'wsfe/wsfe_driver'
require 'wsfe/wsfe_classes'
require 'soap/mapping'

module DefaultMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsArGovAfipDifFacturaelectronica = "http://ar.gov.afip.dif.facturaelectronica/"

  EncodedRegistry.register(
    :class => FEAuthRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEAuthRequest"),
    :schema_element => [
      ["token", ["SOAP::SOAPString", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Token")], [0, 1]],
      ["sign", ["SOAP::SOAPString", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Sign")], [0, 1]],
      ["cuit", "SOAP::SOAPLong"]
    ]
  )

  EncodedRegistry.register(
    :class => FERecuperaQTYResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaQTYResponse"),
    :schema_element => [
      ["qty", "FERecuperaQTY", [0, 1]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FERecuperaQTY,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaQTY"),
    :schema_element => [
      ["value", "SOAP::SOAPInt"]
    ]
  )

  EncodedRegistry.register(
    :class => VError,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "vError"),
    :schema_element => [
      ["percode", "SOAP::SOAPInt"],
      ["perrmsg", "SOAP::SOAPString", [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => DummyResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "DummyResponse"),
    :schema_element => [
      ["appserver", "SOAP::SOAPString", [0, 1]],
      ["dbserver", "SOAP::SOAPString", [0, 1]],
      ["authserver", "SOAP::SOAPString", [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FELastCMPtype,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FELastCMPtype"),
    :schema_element => [
      ["ptoVta", ["SOAP::SOAPInt", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "PtoVta")]],
      ["tipoCbte", ["SOAP::SOAPInt", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "TipoCbte")]]
    ]
  )

  EncodedRegistry.register(
    :class => FERecuperaLastCMPResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaLastCMPResponse"),
    :schema_element => [
      ["cbte_nro", "SOAP::SOAPInt"],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FEUltNroResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEUltNroResponse"),
    :schema_element => [
      ["nro", "UltNroResponse", [0, 1]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => UltNroResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "UltNroResponse"),
    :schema_element => [
      ["value", "SOAP::SOAPLong"]
    ]
  )

  EncodedRegistry.register(
    :class => FERequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERequest"),
    :schema_element => [
      ["fecr", ["FECabeceraRequest", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Fecr")], [0, 1]],
      ["fedr", ["ArrayOfFEDetalleRequest", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Fedr")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FECabeceraRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FECabeceraRequest"),
    :schema_element => [
      ["id", "SOAP::SOAPLong"],
      ["cantidadreg", "SOAP::SOAPInt"],
      ["presta_serv", "SOAP::SOAPInt"]
    ]
  )

  EncodedRegistry.register(
    :class => ArrayOfFEDetalleRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "ArrayOfFEDetalleRequest"),
    :schema_element => [
      ["fEDetalleRequest", ["FEDetalleRequest[]", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleRequest")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => FEDetalleRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleRequest"),
    :schema_element => [
      ["tipo_doc", "SOAP::SOAPInt"],
      ["nro_doc", "SOAP::SOAPLong"],
      ["tipo_cbte", "SOAP::SOAPInt"],
      ["punto_vta", "SOAP::SOAPInt"],
      ["cbt_desde", "SOAP::SOAPLong"],
      ["cbt_hasta", "SOAP::SOAPLong"],
      ["imp_total", "SOAP::SOAPDouble"],
      ["imp_tot_conc", "SOAP::SOAPDouble"],
      ["imp_neto", "SOAP::SOAPDouble"],
      ["impto_liq", "SOAP::SOAPDouble"],
      ["impto_liq_rni", "SOAP::SOAPDouble"],
      ["imp_op_ex", "SOAP::SOAPDouble"],
      ["fecha_cbte", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_desde", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_hasta", "SOAP::SOAPString", [0, 1]],
      ["fecha_venc_pago", "SOAP::SOAPString", [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FEResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEResponse"),
    :schema_element => [
      ["fecResp", ["FECabeceraResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FecResp")], [0, 1]],
      ["fedResp", ["ArrayOfFEDetalleResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FedResp")], [0, 1]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FECabeceraResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FECabeceraResponse"),
    :schema_element => [
      ["id", "SOAP::SOAPLong"],
      ["cuit", "SOAP::SOAPLong"],
      ["fecha_cae", "SOAP::SOAPString", [0, 1]],
      ["cantidadreg", "SOAP::SOAPInt"],
      ["resultado", "SOAP::SOAPString", [0, 1]],
      ["motivo", "SOAP::SOAPString", [0, 1]],
      ["reproceso", "SOAP::SOAPString", [0, 1]],
      ["presta_serv", "SOAP::SOAPInt"]
    ]
  )

  EncodedRegistry.register(
    :class => ArrayOfFEDetalleResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "ArrayOfFEDetalleResponse"),
    :schema_element => [
      ["fEDetalleResponse", ["FEDetalleResponse[]", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleResponse")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => FEDetalleResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleResponse"),
    :schema_element => [
      ["tipo_doc", "SOAP::SOAPInt"],
      ["nro_doc", "SOAP::SOAPLong"],
      ["tipo_cbte", "SOAP::SOAPInt"],
      ["punto_vta", "SOAP::SOAPInt"],
      ["cbt_desde", "SOAP::SOAPLong"],
      ["cbt_hasta", "SOAP::SOAPLong"],
      ["imp_total", "SOAP::SOAPDouble"],
      ["imp_tot_conc", "SOAP::SOAPDouble"],
      ["imp_neto", "SOAP::SOAPDouble"],
      ["impto_liq", "SOAP::SOAPDouble"],
      ["impto_liq_rni", "SOAP::SOAPDouble"],
      ["imp_op_ex", "SOAP::SOAPDouble"],
      ["resultado", "SOAP::SOAPString", [0, 1]],
      ["cae", "SOAP::SOAPString", [0, 1]],
      ["fecha_cbte", "SOAP::SOAPString", [0, 1]],
      ["fecha_vto", "SOAP::SOAPString", [0, 1]],
      ["motivo", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_desde", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_hasta", "SOAP::SOAPString", [0, 1]],
      ["fecha_venc_pago", "SOAP::SOAPString", [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FEConsultaCAEReq,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEConsultaCAEReq"),
    :schema_element => [
      ["cuit_emisor", "SOAP::SOAPLong"],
      ["tipo_cbte", "SOAP::SOAPInt"],
      ["punto_vta", "SOAP::SOAPInt"],
      ["cbt_nro", "SOAP::SOAPLong"],
      ["imp_total", "SOAP::SOAPDouble"],
      ["cae", "SOAP::SOAPString", [0, 1]],
      ["fecha_cbte", "SOAP::SOAPString", [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => FEConsultaCAEResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEConsultaCAEResponse"),
    :schema_element => [
      ["resultado", ["SOAP::SOAPInt", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Resultado")]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEAuthRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEAuthRequest"),
    :schema_element => [
      ["token", ["SOAP::SOAPString", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Token")], [0, 1]],
      ["sign", ["SOAP::SOAPString", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Sign")], [0, 1]],
      ["cuit", "SOAP::SOAPLong"]
    ]
  )

  LiteralRegistry.register(
    :class => FERecuperaQTYResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaQTYResponse"),
    :schema_element => [
      ["qty", "FERecuperaQTY", [0, 1]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FERecuperaQTY,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaQTY"),
    :schema_element => [
      ["value", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => VError,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "vError"),
    :schema_element => [
      ["percode", "SOAP::SOAPInt"],
      ["perrmsg", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => DummyResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "DummyResponse"),
    :schema_element => [
      ["appserver", "SOAP::SOAPString", [0, 1]],
      ["dbserver", "SOAP::SOAPString", [0, 1]],
      ["authserver", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FELastCMPtype,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FELastCMPtype"),
    :schema_element => [
      ["ptoVta", ["SOAP::SOAPInt", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "PtoVta")]],
      ["tipoCbte", ["SOAP::SOAPInt", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "TipoCbte")]]
    ]
  )

  LiteralRegistry.register(
    :class => FERecuperaLastCMPResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaLastCMPResponse"),
    :schema_element => [
      ["cbte_nro", "SOAP::SOAPInt"],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEUltNroResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEUltNroResponse"),
    :schema_element => [
      ["nro", "UltNroResponse", [0, 1]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => UltNroResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "UltNroResponse"),
    :schema_element => [
      ["value", "SOAP::SOAPLong"]
    ]
  )

  LiteralRegistry.register(
    :class => FERequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERequest"),
    :schema_element => [
      ["fecr", ["FECabeceraRequest", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Fecr")], [0, 1]],
      ["fedr", ["ArrayOfFEDetalleRequest", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Fedr")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FECabeceraRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FECabeceraRequest"),
    :schema_element => [
      ["id", "SOAP::SOAPLong"],
      ["cantidadreg", "SOAP::SOAPInt"],
      ["presta_serv", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => ArrayOfFEDetalleRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "ArrayOfFEDetalleRequest"),
    :schema_element => [
      ["fEDetalleRequest", ["FEDetalleRequest[]", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleRequest")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => FEDetalleRequest,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleRequest"),
    :schema_element => [
      ["tipo_doc", "SOAP::SOAPInt"],
      ["nro_doc", "SOAP::SOAPLong"],
      ["tipo_cbte", "SOAP::SOAPInt"],
      ["punto_vta", "SOAP::SOAPInt"],
      ["cbt_desde", "SOAP::SOAPLong"],
      ["cbt_hasta", "SOAP::SOAPLong"],
      ["imp_total", "SOAP::SOAPDouble"],
      ["imp_tot_conc", "SOAP::SOAPDouble"],
      ["imp_neto", "SOAP::SOAPDouble"],
      ["impto_liq", "SOAP::SOAPDouble"],
      ["impto_liq_rni", "SOAP::SOAPDouble"],
      ["imp_op_ex", "SOAP::SOAPDouble"],
      ["fecha_cbte", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_desde", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_hasta", "SOAP::SOAPString", [0, 1]],
      ["fecha_venc_pago", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEResponse"),
    :schema_element => [
      ["fecResp", ["FECabeceraResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FecResp")], [0, 1]],
      ["fedResp", ["ArrayOfFEDetalleResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FedResp")], [0, 1]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FECabeceraResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FECabeceraResponse"),
    :schema_element => [
      ["id", "SOAP::SOAPLong"],
      ["cuit", "SOAP::SOAPLong"],
      ["fecha_cae", "SOAP::SOAPString", [0, 1]],
      ["cantidadreg", "SOAP::SOAPInt"],
      ["resultado", "SOAP::SOAPString", [0, 1]],
      ["motivo", "SOAP::SOAPString", [0, 1]],
      ["reproceso", "SOAP::SOAPString", [0, 1]],
      ["presta_serv", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => ArrayOfFEDetalleResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "ArrayOfFEDetalleResponse"),
    :schema_element => [
      ["fEDetalleResponse", ["FEDetalleResponse[]", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleResponse")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => FEDetalleResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDetalleResponse"),
    :schema_element => [
      ["tipo_doc", "SOAP::SOAPInt"],
      ["nro_doc", "SOAP::SOAPLong"],
      ["tipo_cbte", "SOAP::SOAPInt"],
      ["punto_vta", "SOAP::SOAPInt"],
      ["cbt_desde", "SOAP::SOAPLong"],
      ["cbt_hasta", "SOAP::SOAPLong"],
      ["imp_total", "SOAP::SOAPDouble"],
      ["imp_tot_conc", "SOAP::SOAPDouble"],
      ["imp_neto", "SOAP::SOAPDouble"],
      ["impto_liq", "SOAP::SOAPDouble"],
      ["impto_liq_rni", "SOAP::SOAPDouble"],
      ["imp_op_ex", "SOAP::SOAPDouble"],
      ["resultado", "SOAP::SOAPString", [0, 1]],
      ["cae", "SOAP::SOAPString", [0, 1]],
      ["fecha_cbte", "SOAP::SOAPString", [0, 1]],
      ["fecha_vto", "SOAP::SOAPString", [0, 1]],
      ["motivo", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_desde", "SOAP::SOAPString", [0, 1]],
      ["fecha_serv_hasta", "SOAP::SOAPString", [0, 1]],
      ["fecha_venc_pago", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEConsultaCAEReq,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEConsultaCAEReq"),
    :schema_element => [
      ["cuit_emisor", "SOAP::SOAPLong"],
      ["tipo_cbte", "SOAP::SOAPInt"],
      ["punto_vta", "SOAP::SOAPInt"],
      ["cbt_nro", "SOAP::SOAPLong"],
      ["imp_total", "SOAP::SOAPDouble"],
      ["cae", "SOAP::SOAPString", [0, 1]],
      ["fecha_cbte", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEConsultaCAEResponse,
    :schema_type => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEConsultaCAEResponse"),
    :schema_element => [
      ["resultado", ["SOAP::SOAPInt", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Resultado")]],
      ["rError", ["VError", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "RError")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FERecuperaQTYRequest,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaQTYRequest"),
    :schema_element => [
      ["argAuth", "FEAuthRequest", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FERecuperaQTYRequestResponse,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaQTYRequestResponse"),
    :schema_element => [
      ["fERecuperaQTYRequestResult", ["FERecuperaQTYResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaQTYRequestResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEDummy,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDummy"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => FEDummyResponse,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDummyResponse"),
    :schema_element => [
      ["fEDummyResult", ["DummyResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEDummyResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FERecuperaLastCMPRequest,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaLastCMPRequest"),
    :schema_element => [
      ["argAuth", "FEAuthRequest", [0, 1]],
      ["argTCMP", "FELastCMPtype", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FERecuperaLastCMPRequestResponse,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaLastCMPRequestResponse"),
    :schema_element => [
      ["fERecuperaLastCMPRequestResult", ["FERecuperaLastCMPResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FERecuperaLastCMPRequestResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEUltNroRequest,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEUltNroRequest"),
    :schema_element => [
      ["argAuth", "FEAuthRequest", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEUltNroRequestResponse,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEUltNroRequestResponse"),
    :schema_element => [
      ["fEUltNroRequestResult", ["FEUltNroResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEUltNroRequestResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEAutRequest,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEAutRequest"),
    :schema_element => [
      ["argAuth", "FEAuthRequest", [0, 1]],
      ["fer", ["FERequest", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "Fer")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEAutRequestResponse,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEAutRequestResponse"),
    :schema_element => [
      ["fEAutRequestResult", ["FEResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEAutRequestResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEConsultaCAERequest,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEConsultaCAERequest"),
    :schema_element => [
      ["argAuth", "FEAuthRequest", [0, 1]],
      ["argCAERequest", "FEConsultaCAEReq", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FEConsultaCAERequestResponse,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEConsultaCAERequestResponse"),
    :schema_element => [
      ["fEConsultaCAERequestResult", ["FEConsultaCAEResponse", XSD::QName.new(NsArGovAfipDifFacturaelectronica, "FEConsultaCAERequestResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => DummyResponse,
    :schema_name => XSD::QName.new(NsArGovAfipDifFacturaelectronica, "DummyResponse"),
    :schema_element => [
      ["appserver", "SOAP::SOAPString", [0, 1]],
      ["dbserver", "SOAP::SOAPString", [0, 1]],
      ["authserver", "SOAP::SOAPString", [0, 1]]
    ]
  )
end
