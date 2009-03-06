#--------------------------------------------------------------
# Generador de Solicitud de Certificados X509 
#
# Desarrollo para ser utilizado para la solicitu de certificados
# ante la AFIP para el sistema de Factura Electronica
#
# por Nelson Fernandez (c) 2009 - nelson@netflux.com.ar
# http://netflux.com.ar
#
# Una vez generada la solicitud se puede mirar el contenido de la misma usando el siguiente comando
# openssl req -inform PEM -in request.req -text
#
# Una version instalable del OpenSSL para Windows puede ser descargada desde el siguiente enlace
# http://www.slproweb.com/products/Win32OpenSSL.html
#--------------------------------------------------------------
require 'rubygems'
require 'openssl'
require 'highline/import'

class SSLRequest

  def initialize
    @options = Hash.new
  end

  def request_data
    do_validate = lambda {|p| !p.strip.empty?}
    say "Generador de Solicitud de Certificados"
    say "======================================"
    @options[:o]  = ask("Empresa:            ") {|q| q.validate = do_validate;q.responses[:not_valid] = 'Se deben completar los datos'}
    @options[:cn] = ask("Responsable:        ") {|q| q.validate = do_validate;q.responses[:not_valid] = 'Se deben completar los datos'}
    @options[:e]  = ask("Correo Electronico: ") do |q| 
    @options[:s]  = ask("Localidad:          ") {|q| q.default = 'Ciudad Autonoma de Buenos Aires'}
      q.case = :down
      q.validate = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
      q.responses[:not_valid] = 'No es un email valido'
    end
    @options[:serial] = ask("Cuit:               ") do |q| 
      q.validate = /\A\d{11}\Z/
      q.responses[:not_valid] = 'Debe ingresar numeros consecutivos sin guiones o espacios. Completar con 0 a la izquierda los numero de documento menores a 8 digitos'
    end
  end

  def gen_request
    @req = OpenSSL::X509::Request.new
    @req.version = 0
    @req.subject = OpenSSL::X509::Name.parse "/serialNumber=CUIT #{@options[:serial]}/emailAddress=#{@options[:e]}/CN=#{@options[:cn]}/O=#{@options[:o]}/ST=#{@options[:s]}/C=AR"
    @req.public_key = @pkey.public_key
    @req.sign @pkey, OpenSSL::Digest::SHA1.new
  end

  def save_data
    File.open("private.key", "w+") {|w| w.write @pkey.to_pem}
    File.open("request.req", "w+") {|w| w.write @req.to_pem}
  end

  def do_request
    request_data
    @pkey = OpenSSL::PKey::RSA.new(1024)
    gen_request
    save_data
  end

end

if $0 == __FILE__
  if File.exists?('private.key')
    puts "Ya existe un archivo 'private.key'. Debe borrarlo o renombrarlo para continuar"
    exit 1
  end
  req = SSLRequest.new
  req.do_request
  say "Se generaron los los archivos 'request.req' y 'private.key'. Almacenelos en un lugar seguro"
end

