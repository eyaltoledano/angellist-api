module AngellistApi
  class Client
    # Defines methods related to URLs.
    #
    # @see http://angel.co/api/spec/tags
    module Tags
      # Get information on a tag.
      #
      # @requires_authentication No
      # @response_format `json`
      #
      # @param [Integer] id ID of the desired tag.
      #
      # @example Get information on a tag.
      #   AngellistApi.get_tag(1654)
      def get_tag(id)
        get("1/tags/#{id}", :format => :json)
      end

      # Returns children of the given tag. Market and location tags form a
      # Directed Acyclic Graph. Results are paginated and ordered by id
      # descending.
      #
      # @requires_authentication No
      # @response_format `json`
      #
      # @param [Integer] id The id of the desired tag. Currently only works for
      #   tags of type MarketTag or LocationTag.
      #
      # @example Get children of a tag.
      #   AngellistApi.get_tag_children(1654)
      def get_tag_children(id)
        get("1/tags/#{id}/children", :format => :json)
      end

      # Returns parents of the given tag. For more details, see the
      # documentation for GET /tags/:id/children.
      #
      # @requires_authentication No
      # @response_format `json`
      #
      # @param [Integer] id The id of the desired tag. Currently only works for
      #   tags of type MarketTag or LocationTag.
      #
      # @example Get parents of a tag.
      #   AngellistApi.get_tag_parents(1654)
      def get_tag_parents(id)
        get("1/tags/#{id}/parents", :format => :json)
      end

      # Returns startups that are tagged with the given tag or a child of the
      # given tag. Results are paginated and ordered according to the order
      # parameter.
      #
      # @requires_authentication Optional
      # @response_format `json`
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :order May be one of popularity, asc or desc.
      #   Startups will be ordered by number of followers, ascending id or
      #   descending id, respectively. Defaults to desc
      #
      # @example Get startups tagged with tag ID or its children.
      #   AngellistApi.get_tag_startups(1654)
      #
      # @see http://angel.co/api/spec/startups
      def get_tag_startups(id, options = {})
        get("1/tags/#{id}/startups", options, :format => :json)
      end
    end
  end
end

