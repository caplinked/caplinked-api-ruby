require 'caplinked/rest/activities'
require 'caplinked/rest/downloads'
require 'caplinked/rest/files'
require 'caplinked/rest/folders'
require 'caplinked/rest/groups'
require 'caplinked/rest/organizations'
require 'caplinked/rest/permissions'
require 'caplinked/rest/teams'
require 'caplinked/rest/users'
require 'caplinked/rest/workspaces'

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