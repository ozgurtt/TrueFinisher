class UserdailydataController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show] 
helper_method :sort_column, :sort_direction
include ApplicationHelper

##Need to have this be the data of the specific user##
def index
  respond_to do |format|
    format.html
    format.json { render json: UserdailydataDatatable.new(view_context) }
  end
  #@userdailydata = Userdailydata.all
end

def new
	@userdailydata=Userdailydata.new
end

def create
	@userdailydata=Userdailydata.new
	@userdailydata.save
end

end