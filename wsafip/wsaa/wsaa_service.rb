# WSAA
# Implementacion del webservice de auteticacion de la AFIP
# 
# Algunos ejemplos de uso:
#
# Obtiene un ticket para el servicio de factura electronica para conectarse a homologacion
# tck = WSAA::WSAAService.request_ticket( :service => 'wsfe', 
#                                         :certificate => 'certificado.pem', 
#                                         :private_key => 'private.key' )
#
# Obtiene un ticket para el servicio de factura electronica para conectarse a produccion
# tck = WSAA::WSAAService.request_ticket( :service => 'wsfe', 
#                                         :server => :prod,
#                                         :certificate => 'certificado.pem', 
#                                         :private_key => 'private.key',
#                                         :pk_password => 'secret' )
#
# Para obtener la especificacion tecnica del servicio se puede bajarla de:
#    http://www.afip.gov.ar/fe/documentos/EspTecnicaWSAA.pdf
#
# Para datos sobre Factura Electronica
#    http://www.afip.gov.ar/fe/
#
# Nelson Fernandez - netFlux
# http://netflux.com.ar
# http://nelson.netflux.com.ar
# nelson@netflux.com.ar
# 
require 'wsaa/wsaa_driver.rb'
require 'wsaa/wsaa_request'
require 'xmlsimple'
require 'time'

module WSAA

  #
  # Objeto devuelto a la solicitud de un ticket de acceso mediante el WSAAService.request_ticket
  #
  # Metodos de instancia:
  #
  #   * token : token devuelto por el webservice
  #   * sign : firma devuelta por el webservice
  #   * response: estructura hash con la respuesta del servicio
  #
  # En caso de producirse un error al solicitar el ticket, se puede consultar la variable de instancia 
  # *error* que contiene el mensaje de error de la operación.
  #
  class WSAATicket
    attr_reader :token, :sign
    attr_accessor :response, :error 

    # Inicializa el objeto recibiendo como parametro el request utilizado para la solicitud
    def initialize(request)
      @request = request
    end

    # Asigna el resultado de la solicitud del ticket
    def response=(response)
      @response = XmlSimple.xml_in(response, {'ForceArray' => false})
      @token = @response["credentials"]["token"]
      @sign  = @response["credentials"]["sign"]
    end

    # Valida que los datos del ticket sean consistentes
    # TODO: mejorar esta rutina
    def verify
      return false if @response.nil?
      # - que el campo 'source' del ticket se corresponda con el DN del WSAA
      a = @response['header']['source'].upcase == @request.destination.upcase
      # - que el campo 'destination' del ticket se corresponda con el DN del CEE
      b = @response['header']['destination'].upcase == @request.source.upcase
      # - que el ticket no haya expirado
      c = Time.xmlschema(@response['header']['expirationTime']) > Time.now
      # - que el ticket no tenga una fecha de generacion posterior a la actual
      d = Time.xmlschema(@response['header']['generationTime']) < Time.now
      # - que el ticket tenga los campos token y sign de tipo string
      a && b && c && d
    end
  end

  # Implementacion de la llamada al webservice de autenticacion
  #
  # Como parametros de llamada recibe un hash que puede tener las siguientes opciones
  #
  #   :server           :homo o :prod indicando si se va a conectar a homologacion o produccion. De no especificarse se utiliza homologacion
  #   :timeout          tiempo de validez que va a tener el ticket. El valor por defecto son 600 segundos (5 minutos)
  #   :certificate      path al archivo que contiene el certificado X509 para el acceso al webservice. Debe estar en formato PEM (ascii)
  #   :private_key      path al archivo que contiene la clave privada correspondiente al certificado X509. Debe estar en formato PEM (ascii)
  #   :pk_password      si la clave privada esta protegida con contraseña, se debe especificar la misma
  #   :service          servicio para el que se solicita el ticket, por ejemplo "wsfe" para factura electronica
  #
  class WSAAService
    
    HOMO_URL = 'https://wsaahomo.afip.gov.ar/ws/services/LoginCms'
    PROD_URL = 'https://wsaa.afip.gov.ar/ws/services/LoginCms'
    DN_HOMO  = 'CN=wsaahomo, O=AFIP, C=AR, SERIALNUMBER=CUIT 33693450239'
    DN_PROD  = 'CN=wsaa, O=AFIP, C=AR, SERIALNUMBER=CUIT 33693450239'

    def self.request_ticket(options = {})
      options[:server]      = (options[:server] == :prod) ? :prod : :homo 
      options[:destination] = (options[:server] == :prod) ? DN_PROD : DN_HOMO

      obj = LoginCmsWs.new(options[:server] == :prod ? PROD_URL : HOMO_URL)
      obj.streamhandler.client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
      obj.wiredump_dev = STDERR if $DEBUG
      request = WSAARequest.new(options)
      tck = WSAATicket.new(request)
      tck.response = obj.loginCms(request.signed_request)
      return tck
    rescue SOAP::FaultError => ex
      tck.error = "#{ex.message} (#{ex.faultcode})"
      return tck
    end

  end

end

