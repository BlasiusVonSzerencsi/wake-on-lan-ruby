require 'socket'

require 'wake_on_lan/version'

module WakeOnLan

  autoload :MagicPacket, 'wake_on_lan/magic_packet'

  def self.wake(mac_address, broadcast, port)
    packet = MagicPacket.new(mac_address).assemble_frame

    socket = UDPSocket.open()
    socket.setsockopt Socket::SOL_SOCKET, Socket::SO_BROADCAST, 1

    socket.send packet, 0, broadcast, port
    socket.close
  end

end
