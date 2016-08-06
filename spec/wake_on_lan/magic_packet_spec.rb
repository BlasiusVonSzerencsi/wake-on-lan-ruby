require 'spec_helper'

describe WakeOnLan::MagicPacket do

  describe '#mac_address' do

    it 'should return the MAC address' do
      subject = described_class.new '00:11:22:33:44:55:66:77'

      expect(subject.mac_address).to eq '00:11:22:33:44:55:66:77'
    end


    it 'should return the MAC address separated by colons' do
      subject = described_class.new '00-11-22-33-44-55-66-77'

      expect(subject.mac_address).to eq '00:11:22:33:44:55:66:77'
    end

  end

end
