class ApiController < ApplicationController
  
  #To add a new user
  
  def addUser #POST
    if params[:type].present? && params[:name].present? && params[:email].present? && params[:dob].present? 
      if params[:type]=="addUser"
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.dob = params[:dob]
        @user.gender = params[:gender]
        @user.fb_token = params[:fb_token]
        @user.fb_id = params[:fb_id]
        @user.token_expiry = params[:token_expiry]
        if @user.save
          # Success Message
          print "Sucess!"
          render :json => { :status => :ok, :message => "Success!", :description => "Saved"}
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
  
  # To get all user details
  
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
  
  #To get all data for a particular beacon
  
  def getDataForBeacon
    if params[:type].present? && params[:beacon_uid].present?
      if params[:type]=="getDataForBeacon"
        @item = Item.where(:beacon_id => Beacon.where(:uid => params[:beacon_uid]))
      else
        render :json => { :status => :ok, :message => "Fail!", :description => "Wrong Type"}
      end
    else
      render :json => { :status => :ok, :message => "Fail!", :description => "Missing Attribute"}
    end
  end
  
  # To get data for a beacon and a particular item associated with it
  
  def getDataForBeaconStore
    if params[:type].present? && params[:beacon_uid].present? && params[:item_id].present?
      if params[:type]=="getDataForBeaconStore"
        #Check is this item is actually associated with the beacon provided
        if(params[:beacon_uid]==Beacon.find(Item.find(params[:item_id]).beacon_id).uid)
          #If Yes, return notes associated with that particular item
          @note = Note.where(:item_id => Item.where(:id => params[:item_id]))
        else
          render :json => { :status => :ok, :message => "Fail!", :description => "Beacon & Item Don't Match"}
        end
      else
        render :json => { :status => :ok, :message => "Fail!", :description => "Wrong Type"}
      end
    else
      render :json => { :status => :ok, :message => "Fail!", :description => "Missing Attribute"}
    end
  end
  
  def getDataForBeaconStoreNote
    if params[:type].present? && params[:beacon_uid].present? && params[:item_id].present? && params[:note_id].present?
      
    else
      render :json => { :status => :ok, :message => "Fail!", :description => "Missing Attribute"}
    end
  end
end
