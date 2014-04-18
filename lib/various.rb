require "various/version"
require "various/configuration"
require "various/controller"

begin
  require "pry"
rescue LoadError
end

module Various
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
