module Wink
  module CLI
    class Base < Thor
      private

      def client
        @client ||= Wink::Client.new
      end

      def response(&block)
        builder = Builder::XmlMarkup.new
        builder.instruct! :xml, :version => "1.0"
        builder.items(&block)
        puts builder.target!
      end
    end
  end
end
