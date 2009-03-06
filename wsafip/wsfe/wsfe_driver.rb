require 'wsfe/wsfe_classes'
require 'wsfe/wsfe_soap'
require 'soap/rpc/driver'

class ServiceSoap < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://wswhomo.afip.gov.ar/wsfe/service.asmx"

  Methods = [
    [ "http://ar.gov.afip.dif.facturaelectronica/FERecuperaQTYRequest",
      "fERecuperaQTYRequest",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FERecuperaQTYRequest"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FERecuperaQTYRequestResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://ar.gov.afip.dif.facturaelectronica/FEDummy",
      "fEDummy",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEDummy"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEDummyResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://ar.gov.afip.dif.facturaelectronica/FERecuperaLastCMPRequest",
      "fERecuperaLastCMPRequest",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FERecuperaLastCMPRequest"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FERecuperaLastCMPRequestResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://ar.gov.afip.dif.facturaelectronica/FEUltNroRequest",
      "fEUltNroRequest",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEUltNroRequest"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEUltNroRequestResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://ar.gov.afip.dif.facturaelectronica/FEAutRequest",
      "fEAutRequest",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEAutRequest"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEAutRequestResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://ar.gov.afip.dif.facturaelectronica/FEConsultaCAERequest",
      "fEConsultaCAERequest",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEConsultaCAERequest"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ar.gov.afip.dif.facturaelectronica/", "FEConsultaCAERequestResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end



