module Levelup
  module Endpoints
    # Endpoint holding all functions relating to user addresses.
    class UserAddresses < Base
      # Creates a specified user address. For more information on parameters, see
      # UserAddressRequest.
      def create(user_address_request, user_access_token)
        request = build_request(user_address_request, Requests::CreateAddress)
        request.user_access_token ||= user_access_token
        request.send_to_api(:post, endpoint_path)
      end

      def list(user_access_token)
        Requests::ListAddresses.new(:user_access_token => user_access_token).
          send_to_api(:get, endpoint_path)
      end

      private

      def path
        'user_addresses'
      end
    end
  end
end
