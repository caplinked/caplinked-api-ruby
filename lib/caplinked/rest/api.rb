module Caplinked
  module REST
    module API
      include Caplinked::REST::Activities
      include Caplinked::REST::Downloads
      include Caplinked::REST::Files
      include Caplinked::REST::Folders
      include Caplinked::REST::Groups
      include Caplinked::REST::Organizations
      include Caplinked::REST::Permissions
      include Caplinked::REST::Teams
      include Caplinked::REST::Users
      include Caplinked::REST::Workspaces
    end
  end
end