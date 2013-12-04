require "helper"

describe SoftService::Collaborators do
  class CollaboratorsExample
    include SoftService::Collaborators
    collaborators :a, :b, :c
  end

  let(:collaborators) { [:a, :b, :c] }
  let(:service_class) { CollaboratorsExample }
  let(:service) { service_class.new("a", "b", "c") }

  describe "class methods" do
    it "defines .collaborators" do
      service_class.must_respond_to :collaborators
    end

    describe ".collaborators" do
      it "creates the collaborator readers" do
        collaborators.each do |attr|
          service.must_respond_to attr
        end
      end

      it "stores the collaborators" do
        service.collaborators.must_equal collaborators
      end
    end
  end

  describe "instance methods" do
    describe "#initialize" do
      it "rasies an error when missing arguments" do
        -> { service_class.new }.must_raise ArgumentError
        -> { service_class.new(1) }.must_raise ArgumentError
        -> { service_class.new(1,2) }.must_raise ArgumentError
      end
    end

    describe "#collaborators" do
      it "defines #collaborators" do
        service.must_respond_to :collaborators
      end

      it "returns the collaborators" do
        service.collaborators.must_equal collaborators
      end
    end
  end
end
