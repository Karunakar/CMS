class MeetingsController < ApplicationController
 #before_filter :authorize
  # GET /meetings
  # GET /meetings.xml
 layout 'base'

  menu_item :activity, :only => :activity
  menu_item :roadmap, :only => :roadmap
  menu_item :files, :only => [:list_files, :add_file]
  menu_item :settings, :only => :settings
 
  
  #before_filter :find_project, :except => [ :index, :list, :add, :activity ]
  #before_filter :find_optional_project, :only => :activity
  #before_filter :authorize
  #before_filter :require_admin, :only => [ :add, :archive, :unarchive, :destroy ]
  #accept_key_auth :activity
  
  helper :sort
  include SortHelper
  helper :custom_fields
  include CustomFieldsHelper   
  helper :issues
  helper IssuesHelper
  helper :queries
  include QueriesHelper
  helper :repositories
  include RepositoriesHelper
  include ProjectsHelper

  def index
    @meetings = Meeting.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.xml
  def show
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.xml
  def new
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  def assign_users
	@meeting = Meeting.find(params[:id])
  end

	def update_users
		logger.info(params)
		@meeting = Meeting.find(params[:meeting_id])
    		# @courses = (@subjects.collect {|s| s.courses}).flatten 
    		@meeting.meeting_users.each(&:destroy) if params[:meeting].blank?
    		
      			if @meeting.update_attributes(params[:meeting])
			  msg = "Courses have been updated"
      			end
			flash[:notice] = 'Meeting was successfully created.'
        		redirect_to(assign_users_meeting_url@meeting) 

  	end

  # POST /meetings
  # POST /meetings.xml
  def create
    @meeting = Meeting.new(params[:meeting])

    respond_to do |format|
      if @meeting.save
        flash[:notice] = 'Meeting was successfully created.'
        format.html { redirect_to(@meeting) }
        format.xml  { render :xml => @meeting, :status => :created, :location => @meeting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.xml
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        flash[:notice] = 'Meeting was successfully updated.'
        format.html { redirect_to(@meeting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.xml
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to(meetings_url) }
      format.xml  { head :ok }
    end
  end
end
