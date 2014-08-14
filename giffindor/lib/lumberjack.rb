require 'json'

module Lumberjack
  def self.log label, details = nil
    hash = {label: label, details: details}
    hash.delete_if { |k, v| v.nil? }

    msg = hash.to_json
    conn = Bunny.new
    conn.start

    channel = conn.create_channel
    queue = channel.queue("logs")

    channel.default_exchange.publish(msg, routing_key: queue.name)

    conn.close
  end
end
