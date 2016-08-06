class WakeOnLan::MagicPacket

  attr_reader :mac_address

  def initialize(mac_address)
    @mac_address = colon_separated mac_address
  end


  def assemble_frame
    six_times_255 = 0xff.chr * 6
    binary_mac = mac_address.split(':').reduce('') { |binary, hex| binary << hex.to_i(16).chr }

    six_times_255 + binary_mac * 16
  end


  private

  def colon_separated(mac_address)
    hex_array = mac_address.scan /[0-9a-fA-F]{2}/
    hex_array.join ':'
  end

end
