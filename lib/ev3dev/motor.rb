module Ev3dev
  class Motor < Device
    PATH = "/sys/class/tacho-motor"

    def initialize(port)
      Dir.glob("#{PATH}/motor*").each do |path|
        if IO.read("#{path}/address").strip == "ev3-ports:out#{port.to_s.upcase}"
          super path
          return
        end
      end
    end
  end
end
