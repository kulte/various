module Various
  class Configuration
    attr_accessor :variant_map

    def initialize
      @variant_map = {
        /iPad/i   => :tablet,
        /iPhone/i => :mobile,
      }
    end
  end
end
