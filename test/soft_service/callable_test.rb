require "helper"

describe SoftService::Callable do
  class CallableExample
    include SoftService::Callable
  end

  let(:service_class) { CallableExample }
  let(:service) { service_class.new }

  describe "class methods" do
    it "defines .call" do
      service_class.must_respond_to :call
    end
  end

  describe "instance methods" do
    it "defines #call" do
      service.must_respond_to :call
    end
  end
end
