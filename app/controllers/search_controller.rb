class SearchController < ApplicationController
  before_filter :deliver_results
  
  def index
    respond_to do |wants| 
      wants.html
      wants.js
      wants.fbml
    end
  end
  
  def search
    @query = params[:q]
    @results = ["1", "2", "3"]
    render :partial => "results"
  end
  
  protected
  
  def deliver_results
    if present?(params[:query])
      @query = session[:last_search] = params[:query]
      @users = User.paginate(:all, :conditions => User.conditions_by_like(@query,['users.display_name','users.login','users.bio','users.city','users.country']), :include => :pic, :per_page => 15, :page => params[:page])
      @assets = Asset.paginate(:all, :conditions => Asset.conditions_by_like(@query,['assets.title', 'assets.description', 'assets.filename']), :include => [:user => :pic], :per_page => 15, :page => params[:page])
      @page_title = "Artists and Songs that match '#{(@query)}'"
    else
      @page_title = "Search artists and uploads"
      flash[:error] = 'Please enter an artist name, a song name, or something to search for'
    end
  rescue       
  end
end