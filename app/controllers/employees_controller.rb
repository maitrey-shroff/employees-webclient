class EmployeesController < ApplicationController

  def index
    @employees = Unirest.get("#{ENV["API_URL"]}/employees").body
  end

  def show
    @employee = Unirest.get("#{ENV["API_URL"]}/employees/#{params[:id]}.json").body
  end

  def new


  end

  def create
    input_first_name = params[:first_name]
    input_last_name = params[:last_name]

    Unirest.post("#{ENV["API_URL"]}/create", parameters: {first_name: input_first_name, last_name: input_last_name}, 
      headers: {"Accept" => "application/json"})

    redirect_to "/employees"
  end

  def edit
    @employee = Unirest.get("#{ENV["API_URL"]}/employees/#{params[:id]}.json").body
  end

  def update
    @employee = Unirest.patch("#{ENV["API_URL"]}/update/#{params[:id]}", parameters: {first_name: params[:first_name], last_name: params[:last_name]}, 
      headers: {"Accept" => "application/json"}).body
  end

  def destroy
    @employee = Unirest.delete("#{ENV["API_URL"]}/delete/#{params[:id]}")
  end


end
