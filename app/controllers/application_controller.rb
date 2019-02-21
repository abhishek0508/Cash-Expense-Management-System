# class for including application level instructions
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
end
