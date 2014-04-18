module Various
  class Configuration
    attr_accessor :variant_map

    def initialize
      @variant_map = {
        /iPad/   => :tablet,
        /iPhone/ => :mobile,
      }
    end
  end
end
