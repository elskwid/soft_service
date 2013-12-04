require "helper"

describe SoftService do
  class ExampleService
    include SoftService
    collaborators :a, :b, :c
  end

  let(:service_class) { ExampleService }
  let(:service) { service_class.new("a", "b", "c") }

  describe "includes Collaborators" do
    specify { service_class.must_respond_to :collaborators }
    specify { service.must_respond_to :collaborators  }
  end

  describe "includes Callable" do
    specify { service_class.must_respond_to :call }
    specify { service.must_respond_to :call }
  end
end
