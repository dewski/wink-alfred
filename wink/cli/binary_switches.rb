module Wink
  module CLI
    class BinarySwitches < Base
      default_task :list

      desc "list", "list all binary switches"
      def list
        response do |builder|
          client.binary_switches.each do |switch|
            builder.item(uid: switch.device_id, autocomplete: " #{switch.device_id}", valid: "NO") do |item|
              item.title switch.name
              item.subtitle subtitle_for(switch)
            end
          end
        end
      end

      desc "actions BINARY_SWITCH_ID", "list actions for binary switch"
      def actions(binary_switch_id)
        response do |builder|
          builder.item(uid: 0, arg: "on #{binary_switch_id}") do |item|
            item.title "Power on"
          end
          builder.item(uid: 1, arg: "off #{binary_switch_id}") do |item|
            item.title "Power off"
          end
        end
      end

      desc "off BINARY_SWITCH_ID", "turn off switch"
      def off(binary_switch_id)
        switch = client.binary_switch(binary_switch_id)
        switch.off
        puts "#{switch.name} turned off"
      end

      desc "on BINARY_SWITCH_ID", "turn on switch"
      def on(binary_switch_id)
        switch = client.binary_switch(binary_switch_id)
        switch.on
        puts "#{switch.name} turned on"
      end

      private

      def subtitle_for(switch)
        if switch.on?
          "On"
        else
          "Off"
        end
      end
    end
  end
end
