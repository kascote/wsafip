require 'xsd/qname'
require 'soap/rpc/driver'

class LoginCmsWs < ::SOAP::RPC::Driver
  DefaultEndpointUrl = 'https://wsaahomo.afip.gov.ar/ws/services/LoginCms'
  MappingRegistry = ::SOAP::Mapping::Registry.new

  Methods = [
    [ XSD::QName.new("http://services.authws.sua.dvadac.desein.afip.gov", "loginCms"),
      "",
      "loginCms",
      [ ["in", "request", ["::SOAP::SOAPString"]],
        ["retval", "loginCmsReturn", ["::SOAP::SOAPString"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = MappingRegistry
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

