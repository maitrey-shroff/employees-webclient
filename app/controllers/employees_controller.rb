class EmployeesController < ApplicationController

  def show
    @employee = Unirest.get("localhost:3000/api/v2/employees/#{params[:id]}.json").body
  end

  def new


  end

  def create
    input_first_name = params[:first_name]
    input_last_name = params[:last_name]

    Unirest.post("localhost:3000/api/v1/create", parameters: {first_name: input_first_name, last_name: input_last_name}, 
      headers: {"Accept" => "application/json"})

    redirect_to "/employees/7"
  end

  def edit

  end

  def update

  end

  def destroy
    @employee = Unirest.delete("localhost:3000/api/v1/delete/#{params[:id]}")
  end


end
