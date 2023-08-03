# frozen_string_literal: true

class PartnersController < ApplicationController
  def show
    @partner = Partner.find(params[:id])
  end

end
