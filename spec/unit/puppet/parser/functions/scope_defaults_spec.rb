#!/usr/bin/env rspec
require 'spec_helper'

describe "the scope defaults function" do
  before :all do
    Puppet::Parser::Functions.autoloader.loadall
  end

  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should exist" do
    Puppet::Parser::Functions.function("scope_defaults").should == "function_scope_defaults"
  end

  it "should raise a ParseError if there is less than 2 arguments" do
    lambda { @scope.function_scope_defaults([]) }.should( raise_error(Puppet::ParseError))
  end

  it "should raise a ParseError if there is more than 2 arguments" do
    lambda { @scope.function_scope_defaults(['exec', 'path', 'error']) }.should( raise_error(Puppet::ParseError))
  end

  it "should return false for invalid resource" do
    result = @scope.function_scope_defaults(['foo', 'path'])
    result.should(eq(false))
  end

  it "should return false for resource without default attributes" do
    @scope.setdefaults('Exec', Puppet::Parser::Resource::Param.new(:name => :path, :value => "/bin"))
    result = @scope.function_scope_defaults(['Exec', 'foo'])
    result.should(eq(false))
  end

  it "should return true for resource with default attributes" do
    @scope.setdefaults('Exec', Puppet::Parser::Resource::Param.new(:name => :path, :value => "/bin"))
    result = @scope.function_scope_defaults(['Exec', 'path'])
    result.should(eq(true))
  end
end
