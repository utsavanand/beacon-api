class ApiController < ApplicationController
  
  #To add a new beacon
  def addBeacon
    if params[:type].present? && params[:beacon_uid].present?
      if params[:type]=="addBeacon"
        @beacon = Beacon.new
        @beacon.uid = params[:beacon_uid]
        if @beacon.save
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
  
  #To add an item to a beacon
  def addBeaconItem
    if params[:type].present? && params[:beacon_id].present? && params[:item_name].present? && params[:item_image].present? && params[:item_description].present? && params[:item_template].present? && params[:item_category].present?
       if params[:type]=="addBeaconItem"
        @beacon = Beacon.find(params[:beacon_id])
        @item = Item.new
        @item.name = params[:item_name]
        @item.image = params[:item_image]
        @item.description = params[:item_description]
        @item.template = params[:item_template]
        @item.category = params[:item_category]
        @item.beacon = @beacon
        if @item.save
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
  
  #To add an item to a beacon
  def addBeaconItemNote
    if params[:type].present? && params[:item_id].present? && params[:note_title].present? && params[:note_type].present? && params[:note_image].present? && params[:note_thumbnail].present? && params[:note_summary].present?
       if params[:type]=="addBeaconItemNote"
         @item = Item.find(params[:item_id])
         @note = Note.new
         @note.title = params[:note_title]
         @note.noteType = params[:note_type]
         @note.image = params[:note_image]
         @note.summary = params[:note_summary]
         @note.thumbnail_image = params[:note_thumbnail]
         @note.item = @item
        if @note.save
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
    if params[:type].present?
      if params[:type]=="getUser"
        @user = User.all
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
  
  def test
  end
  
end
