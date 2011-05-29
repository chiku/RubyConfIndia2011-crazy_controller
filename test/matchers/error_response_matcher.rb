module Shoulda
  module ActionController
    module Matchers

      def have_an_error(error)
        ErrorResponseMatcher.new(error)
      end

      class ErrorResponseMatcher
        def initialize(error)
          @expected_error = error
        end

        def matches?(controller)
          @controller    = controller
          @actual_errors = Hash.from_xml(@controller.response.body)['errors']

          @actual_errors.include? @expected_error
        end

        def failure_message
          "Expected '#{@expected_error}' to be present in '#{@actual_errors}' but was not"
        end

        def negative_failure_message
          "Did not expect '#{@expected_error}' to be present in '#{@actual_errors}' but was"
        end

        def description
          "should have an error #{@expected_error}"
        end
      end

    end
  end
end
