module Wink
  module CLI
    class GarageDoors < Base
      default_task :list

      desc "list", "list all garage doors"
      def list
        response do |builder|
          client.garage_doors.each do |door|
            builder.item(uid: door.device_id, autocomplete: " #{door.device_id}", valid: "NO") do |item|
              item.title door.name
              item.subtitle subtitle_for(door)
            end
          end
        end
      end

      desc "actions GARAGE_DOOR_ID", "list actions for garage door"
      def actions(garage_door_id)
        response do |builder|
          builder.item(uid: 0, arg: "open #{garage_door_id}") do |item|
            item.title "Open"
          end
          builder.item(uid: 1, arg: "close #{garage_door_id}") do |item|
            item.title "Close"
          end
        end
      end

      desc "off GARAGE_DOOR_ID", "close garage door"
      def close(garage_door_id)
        door = client.garage_door(garage_door_id)
        door.close
        puts "#{door.name} is closing"
      end

      desc "open GARAGE_DOOR_ID", "open garage door"
      def open(garage_door_id)
        door = client.garage_door(garage_door_id)
        door.open
        puts "#{door.name} is opening"
      end

      private

      def subtitle_for(bulb)
        if bulb.open?
          "Open"
        else
          "Closed"
        end
      end
    end
  end
end
