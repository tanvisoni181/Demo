# frozen_string_literal: true

class PartnersController < ApplicationController
  before_action :authenticate_user!
  def show
    @partner = Partner.find(params[:id])
  end

end
