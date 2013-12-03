require 'helper'
require 'soft_service'

class TestSoftService < Minitest::Test

  def test_version
    version = SoftService.const_get('VERSION')

    assert(!version.empty?, 'should have a VERSION constant')
  end

end
