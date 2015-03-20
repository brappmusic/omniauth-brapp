require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Brapp < OmniAuth::Strategies::OAuth2
      option :name, :brapp

      option :client_options, {
        :site => 'https://api.brappmusic.com',
        :authorize_url => '/oauth/authorize'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { raw_info['data']['id'].to_s }

      info do
        {
          'name' => raw_info['data']['full_name'],
          'email' => raw_info['data']['email'],
          'full_name' => raw_info['data']['full_name'],
          'nickname' => raw_info['data']['username']
        }
      end

      extra do
        {
          'admin' => raw_info['data']['admin']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/me.json').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'github', 'Brapp'
