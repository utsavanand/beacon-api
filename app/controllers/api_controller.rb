class ApiController < ApplicationController
  def addUser #POST
    if params[:type].present? && params[:name].present? && params[:email].present? && params[:age].present? && params[:gender].present?
      if params[:type]=="addUser"
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.age = params[:age]
        @user.gender = params[:gender]
        if @user.save
          # Success Message
          print "Sucess!"
          render :json => { :status => :ok, :message => "Success!"}
        else
          # Fail-Save Error
          print "Fail!"
          render :json => { :status => :ok, :message => "Fail!"}
        end
      else
        # Wrong Type Error
        print "Wrong Type!"
        
      end
    else
      # Missing Attribute Error
      print "Missing Attribute!"
    end
  end
  
  def getUser #GET
    if params[:type].present? && params[:userid].present?
      if params[:type]=="getUser"
        @user = User.find(params[:userid])
        render :json => @user
      else
        print "Wrong Type"
      end
    else
      print "Missing Attribute"
    end
  end
end
