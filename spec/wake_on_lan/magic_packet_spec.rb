require 'spec_helper'

describe WakeOnLan::MagicPacket do

  describe '#mac_address' do

    it 'should return the MAC address' do
      subject = described_class.new '00:11:22:33:44:55'

      expect(subject.mac_address).to eq '00:11:22:33:44:55'
    end


    it 'should return the MAC address separated by colons' do
      subject = described_class.new '00-11-22-33-44-55'

      expect(subject.mac_address).to eq '00:11:22:33:44:55'
    end

  end


  describe '#assemble_frame' do

    subject { described_class.new '00:11:22:33:44:55' }

    it 'should assemble a frame starting with six times 255' do
      expect(subject.assemble_frame).to start_with 0xff.chr * 6
    end


    it 'should assemble a frame ending with sixteen repetitions of the MAC address' do
      bin = [0x00, 0x11, 0x22, 0x33, 0x44, 0x55].map &:chr

      expect(subject.assemble_frame).to end_with bin.join * 16
    end


    it 'should be 102 bytes long' do
      expect(subject.assemble_frame.bytesize).to eq 102
    end

  end

end
