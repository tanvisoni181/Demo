# frozen_string_literal: true

class PartnersController < ApplicationController
  def show
    @partner = Partner.find(params[:id])
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :email, :phone_no, :address)
  end
end
