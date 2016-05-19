require 'spec_helper'
require 'fakefs/spec_helpers'

describe BuildInteger do
  include FakeFS::SpecHelpers

  describe "#find" do
    context "when the file exists" do
      it "should return the current build number" do
        File.write ".build-number", "5"
        expect(BuildInteger.find).to eq(5)
      end
    end
    context "when the file doesn't exist" do
      it "should create the file" do
        BuildInteger.find
        expect(File.exists? ".build-number").to eq(true)
      end
      it "should return the build number as 0" do
        BuildInteger.find
        expect(File.exists? ".build-number").to eq(true)
      end
    end
  end

  describe "#increment" do
    it "should increment the build number by 1" do
      File.write ".build-number", "5"
      BuildInteger.find
      expect(BuildInteger.increment).to eq 6
    end

    it "should write the result to the file" do
      File.write ".build-number", "5"
      BuildInteger.find
      BuildInteger.increment
      expect(File.read(".build-number").to_i).to eq 6
    end
  end

  describe "#decrement" do
    it "should decrease the build number by 1" do
      File.write ".build-number", "5"
      BuildInteger.find
      expect(BuildInteger.decrement).to eq 4
    end

    it "should write the result to the file" do
      File.write ".build-number", "5"
      BuildInteger.find
      BuildInteger.decrement
      expect(File.read(".build-number").to_i).to eq 4
    end
  end

  describe "#set_build_number" do
    it "should set the build number to one specified" do
      File.write ".build-number", "5"
      BuildInteger.find
      expect(BuildInteger.set_build_number 1).to eq 1
    end

    it "should write the result to the file" do
      File.write ".build-number", "5"
      BuildInteger.find
      BuildInteger.set_build_number 1
      expect(File.read(".build-number").to_i).to eq 1
    end
  end

  describe "#reset" do
    it "should set the build number to 0" do
      File.write ".build-number", "5"
      BuildInteger.find
      expect(BuildInteger.reset).to eq 0
    end

    it "should write the result to the file" do
      File.write ".build-number", "5"
      BuildInteger.find
      BuildInteger.reset
      expect(File.read(".build-number").to_i).to eq 0
    end
  end

  describe "#current" do
    it "should return the current build number" do
      File.write ".build-number", "5"
      BuildInteger.find
      expect(BuildInteger.current).to eq 5
    end
  end

end
