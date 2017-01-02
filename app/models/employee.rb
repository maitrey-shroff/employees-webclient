class Employee

  attr_accessor :first_name, :last_name, :id

  def initialize(input)
    @id = input["id"]
    @first_name = input["first_name"]
    @last_name = input["last_name"]
  end

  def full_name
    @full_name = @first_name + " " + @last_name
  end

  def self.find(id)
    unirest_employee = Unirest.get("#{ENV['API_URL']}/employees/#{id}.json",
    headers: {'Accept' => 'application/json', 'X-User-Email' => "#{ENV['API_USER_EMAIL']}", 'Authorization' => "Token #{ENV['API_KEY']}"}).body

    @employee = Employee.new(unirest_employee)

    return @employee
  end

  def self.all()
    unirest_employees = Unirest.get("#{ENV["API_URL"]}/employees",
    headers: {'Accept' => 'application/json', 'X-User-Email' => 'maitrey89@gmail.com', 'Authorization' => 'Token 123123123'}).body
    employees = []

    unirest_employees.each do |unirest_employee|
      employee = Employee.new(unirest_employee)
      employees << employee
    end
  end

  def destroy
    employee = Unirest.delete("#{ENV["API_URL"]}/delete/#{id}",
    headers: {'Accept' => 'application/json', 'X-User-Email' => 'maitrey89@gmail.com', 'Authorization' => 'Token 123123123'})
  end

end