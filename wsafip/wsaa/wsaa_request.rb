require 'time'
require 'openssl'

class WSAARequest
  attr_reader :request, :source, :signed_request

  TRA_REQUEST = '<?xml version="1.0" encoding="UTF-8"?><loginTicketRequest version="1.0"><header><source>%s</source><destination>%s</destination><uniqueId>%s</uniqueId><generationTime>%s</generationTime><expirationTime>%s</expirationTime></header><service>%s</service></loginTicketRequest>'

  def generate_request
    to = @options[:timeout].nil? ? 600 : @options[:timeout]
    actual_time = Time.now.xmlschema
    expire_time = (Time.now+to).xmlschema
    @request = sprintf( TRA_REQUEST, build_dn, @options[:destination], Time.now.to_i, actual_time, expire_time, @options[:service] )
    #puts @request.inspect
  end

  def destination
    @options[:destination]
  end

  def sign_request
    cert = OpenSSL::X509::Certificate.new( File.read( @options[:certificate] ) )
    key = OpenSSL::PKey::RSA.new( File.read( @options[:private_key] ), @options[:pk_password] )
    @signed_request = OpenSSL::PKCS7.sign(cert, key, @request, [], OpenSSL::PKCS7::BINARY).to_pem
    @signed_request.sub!('-----BEGIN PKCS7-----','')
    @signed_request.sub!('-----END PKCS7-----','').strip!
  end

  def initialize(options = {})
    @options = options
    generate_request
    sign_request
    return self
  end

  private

  def build_dn
    cert = OpenSSL::X509::Certificate.new(File.read(@options[:certificate]))
    @source = (cert.subject.to_a.reverse.map {|k,v| "#{k}=#{v}"}).join(", ")
  end

end

