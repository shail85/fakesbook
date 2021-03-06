class FriendshipsController < ApplicationController

  def req
	@user = current_user.id
	@friend_row = User.find_by_username(params[:id])
	@friend = @friend_row.id
	if Friendship.request(@user, @friend)
		redirect_to(:controller => 'users', :action => 'index')
	end
  end

  def accept

	@friend_id = params[:id]
	@friendship1 = Friendship.find_by_user_id_and_friend_id(current_user.id, @friend_id )
	@friendship2 = Friendship.find_by_user_id_and_friend_id(@friend_id, current_user.id)

	@friendship1.update_attributes(:status => 'accepted')
	@friendship2.update_attributes(:status => 'accepted')
	redirect_to(:controller => 'users', :action => 'index')
  end

  def reject
	@friend_id = params[:id]
	@friendship1 = Friendship.find_by_user_id_and_friend_id(current_user.id, @friend_id )
	@friendship2 = Friendship.find_by_user_id_and_friend_id(@friend_id, current_user.id)
	@friendship1.destroy
	@friendship2.destroy
	redirect_to(:controller => 'users', :action => 'index')
  end

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @friendships }
    end
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @friendship }
    end
  end

  # GET /friendships/new
  # GET /friendships/new.json
  def new
    @friendship = Friendship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @friendship }
    end
  end

  # GET /friendships/1/edit
  def edit
    @friendship = Friendship.find(params[:id])
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.new(params[:friendship])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, :notice => 'Friendship was successfully created.' }
        format.json { render :json => @friendship, :status => :created, :location => @friendship }
      else
        format.html { render :action => "new" }
        format.json { render :json => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friendships/1
  # PUT /friendships/1.json
  def update
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      if @friendship.update_attributes(params[:friendship])
        format.html { redirect_to @friendship, :notice => 'Friendship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json

  def delete
    @friendship = params[:id]
    @friendship1 = Friendship.find_by_user_id_and_friend_id(current_user.id,  @friendship)

@friendship2 = Friendship.find_by_user_id_and_friend_id(@friendship, current_user.id)
    @friendship1.destroy
    @friendship2.destroy
    redirect_to(:controller => :users, :action => :index)
  end


end
