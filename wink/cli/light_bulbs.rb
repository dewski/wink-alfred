module Wink
  module CLI
    class LightBulbs < Base
      default_task :list

      desc "list", "list all light bulbs"
      def list
        response do |builder|
          client.light_bulbs.each do |bulb|
            builder.item(uid: bulb.device_id, autocomplete: " #{bulb.device_id}", valid: "NO") do |item|
              item.title bulb.name
              item.subtitle subtitle_for(bulb)
            end
          end
        end
      end

      desc "actions LIGHT_BULB_ID", "list actions for light bulb"
      def actions(light_bulb_id)
        response do |builder|
          builder.item(uid: 0, arg: "on #{light_bulb_id}") do |item|
            item.title "Power on"
          end
          builder.item(uid: 1, arg: "off #{light_bulb_id}") do |item|
            item.title "Power off"
          end
        end
      end

      desc "off LIGHT_BULB_ID", "turn off light bulb"
      def off(light_bulb_id)
        bulb = client.light_bulb(light_bulb_id)
        bulb.off
        puts "#{bulb.name} turned off"
      end

      desc "on LIGHT_BULB_ID", "turn on light bulb"
      option :dim
      def on(light_bulb_id)
        bulb = client.light_bulb(light_bulb_id)
        if options[:dim]
          bulb.dim(options[:dim].to_f)
        else
          bulb.on
        end
        puts "#{bulb.name} turned on"
      end

      desc "dim LIGHT_BULB_ID BRIGHTNESS", "dim light bulb"
      def dim(light_bulb_id, brightness)
        bulb = client.light_bulb(light_bulb_id)
        bulb.dim(brightness)
        puts "#{bulb.name} dimmed to #{brightness}"
      end

      private

      def subtitle_for(bulb)
        if bulb.on?
          "On - #{bulb.brightness}"
        else
          "Off"
        end
      end
    end
  end
end
