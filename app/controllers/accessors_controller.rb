class AccessorsController < ApplicationController

  def new
    @accessor = Accessor.new(accessor_params)
  end

  def create
    @accessor = Accessor.new(accessor_params)
    @accessor.generate
    @accessor.save
  end

  private

  def accessor_params
    params.require(:accessor).permit(:name, :api_key)
  end

end
