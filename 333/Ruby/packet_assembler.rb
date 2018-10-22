# Description

# When a message is transmitted over the internet, it is split into multiple
# packets, each packet is transferred individually, and the packets are
# reassembled into the original message by the receiver. Because the internet
# exists in the real world, and because the real world can be messy, packets do
# not always arrive in the order in which they are sent. For today's challenge,
# your program must collect packets from stdin, assemble them in the correct
# order, and print the completed messages to stdout.
# The point of reading from stdin is to simulate incoming packets. For the
# purposes of this challenge, assume there is a potentially unlimited number of
# packets. Your program should not depend on knowing how many packets there are
# in total. Simply sorting the input in its entirety would technically work, but
# defeats the purpose of this exercise.

# Input description

# Each line of input represents a single packet. Each line will be formatted as
# X Y Z some_text, where X Y and Z are positive integer and some_text is an
# arbitrary string. X represents the message ID (ie which message this packet is
# a part of). Y represents the packet ID (ie the index of this packet in the
# message) (packets are zero-indexed, so the first packet in a message will have
# Y=0, the last packet in a message will have Y=Z-1). Z represents the total
# number of packets in the message.
# It is guaranteed that there will be no duplicate packets or message IDs.

### Both the example input and the challenge input are working. ###

# Simple class that defines the attributes of a packet
class Packet
  attr_reader :message_id, :packet_id, :total_packets, :text

  def initialize(message_id, packet_id, total_packets, text)
    @message_id = message_id
    @packet_id = packet_id
    @total_packets = total_packets
    @text = text
  end
end

# Method that receives a packet and uses sort_by to order its contents first
# by message_id and then by packet_id
def sort_packet(packet)
  packet.sort_by { |p| [p.message_id, p.packet_id] }
end

# Method that receives a packet and prints its text content as it is
def print_packet(packet)
  packet.each do |p|
    puts p.text
  end
end

# Reads from a file and loads it into input variable
input = File.read('challenge_input.txt')
# Gets each_line from the input and maps it to a packet, an array of Packet
# objects. Since .map returns an array, we can select its positions with
# a range [x..y]. The .to_i is there to ensure we get an integer and not
# some '1 ' broken string (altough it is ugly)
packet = input.each_line.map do |line|
  Packet.new(line[0..3], line[8..9].to_i, line[12..13], line[16..-1])
end

organized_packet = sort_packet(packet)
print_packet(organized_packet)
