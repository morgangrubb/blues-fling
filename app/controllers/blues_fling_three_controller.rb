require 'menu_node'

class BluesFlingThreeController < ApplicationController

  def registration
    # TODO: Redirect through to the registration site.
  end

  private

    # If no node has been set specifically we read the state from the request uri.
    #
    # TODO: A better mechanism for selecting the current URL
    def current_menu_node(*args)
      @current_menu_node ||= begin
        request_path = args.first || request.path

        # Find the deepest node in the menu matching that path. If that fails, return the first node.
        #
        # This has not been benchmarked and is purely random access at this point. It may make
        # sense to b-tree the menu and work from that eventually.
        #
        # I skip the first element so that at no point do I consider root. It will always be the
        # fallback node.
        menu_root.flatten[1..-1].find { |n| n.url == request_path } || menu_root
      end
    end
    helper_method :current_menu_node

    # menu_root itself is the root node.
    def menu_root
      @menu_root ||= MenuNode.new do |root|
        root.add 'Home', url: url_for(action: "index")
        root.add 'Schedule', url: url_for(action: "schedule")
        root.add 'Private lessons', url: url_for(action: "private_lessons")
        root.add 'Instructors', url: url_for(action: "instructors")
        root.add 'Register', url: url_for(action: "registration")
      end
    end
    helper_method :menu_root

end
