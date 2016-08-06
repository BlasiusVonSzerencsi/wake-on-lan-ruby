class WakeOnLan::MagicPacket

  attr_reader :mac_address

  def initialize(mac_address)
    @mac_address = colon_separated mac_address
  end


  private

  def colon_separated(mac_address)
    hex_array = mac_address.scan /[0-9a-fA-F]{2}/
    hex_array.join ':'
  end

end
