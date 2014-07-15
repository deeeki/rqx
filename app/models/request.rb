class Request < ActiveRecord::Base
  ATTRIBUTES = %i[ignore_accept_header auth_type gateway_interface path_translated remote_host remote_ident remote_user remote_addr server_name server_protocol accept accept_charset accept_encoding accept_language cache_control from negotiate pragma request_method request_method_symbol method method_symbol headers original_fullpath fullpath original_url media_type content_length ip remote_ip uuid server_software raw_post body body_stream query_parameters request_parameters authorization cookie_jar flash referer referrer tld_length url protocol raw_host_with_port host host_with_port port standard_port optional_port port_string server_port domain subdomains subdomain filtered_parameters filtered_env filtered_path parameter_filter env_filter filtered_query_string parameters params symbolized_path_parameters path_parameters reset_parameters variant content_mime_type content_type accepts format formats valid_accept_header use_accept_header if_modified_since if_none_match if_none_match_etags env script_name path_info query_string session session_options logger media_type_params content_charset scheme].freeze

  serialize :data, Hash

  class << self
    def new_from_http_request http_requet
      new(data: ATTRIBUTES.inject({}){|data, attr| data[attr] = http_requet.__send__(attr).to_s; data })
    end
  end
end
