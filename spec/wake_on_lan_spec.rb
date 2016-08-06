require 'spec_helper'

describe WakeOnLan do

  it 'has a version number' do
    expect(WakeOnLan::VERSION).not_to be nil
  end


  describe '.wake' do

    it 'should send the WOL frame via an UDP socket' do
      packet = instance_double(WakeOnLan::MagicPacket)
      allow(WakeOnLan::MagicPacket).to receive(:new).and_return packet
      allow(packet).to receive(:assemble_frame).and_return 'assembled frame'

      socket = instance_double(UDPSocket).as_null_object
      allow(UDPSocket).to receive(:open).and_return socket

      expect(socket).to receive(:send).with 'assembled frame', 0, '255.255.255.255', 9

      described_class.wake '00:11:22:33:44:55', '255.255.255.255', 9
    end

  end

end
