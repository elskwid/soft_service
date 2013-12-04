require "soft_service/version"
require "soft_service/callable"
require "soft_service/collaborators"

module SoftService
  def self.included(base)
    base.send(:include, SoftService::Collaborators)
    base.send(:include, SoftService::Callable)
    super
  end
end
