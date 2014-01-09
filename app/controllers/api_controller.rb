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
          render :json => { :status => :ok, :message => "Success!", :description => "Unable to save"}
        else
          # Fail-Save Error
          print "Fail!"
          render :json => { :status => :ok, :message => "Fail!", :description => "Unable to save"}
        end
      else
        # Wrong Type Error
        render :json => { :status => :ok, :message => "Fail!", :description => "Wrong Type"}
        print "Wrong Type!"
        
      end
    else
      # Missing Attribute Error
      render :json => { :status => :ok, :message => "Fail!", :description => "Missing Attribute"}
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
        render :json => { :status => :ok, :message => "Fail!", :description => "Wrong Type"}
      end
    else
      print "Missing Attribute"
      render :json => { :status => :ok, :message => "Fail!", :description => "Missing Attribute"}
    end
  end
end
