class GeoCoordinatesController < ApplicationController
  # GET /geo_coordinates
  # GET /geo_coordinates.xml
  def index
    @geo_coordinates = GeoCoordinate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @geo_coordinates }
    end
  end

  # GET /geo_coordinates/1
  # GET /geo_coordinates/1.xml
  def show
    @geo_coordinate = GeoCoordinate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @geo_coordinate }
    end
  end

  # GET /geo_coordinates/new
  # GET /geo_coordinates/new.xml
  def new
    @geo_coordinate = GeoCoordinate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @geo_coordinate }
    end
  end

  # GET /geo_coordinates/1/edit
  def edit
    @geo_coordinate = GeoCoordinate.find(params[:id])
  end

  # POST /geo_coordinates
  # POST /geo_coordinates.xml
  def create
    @geo_coordinate = GeoCoordinate.new(params[:geo_coordinate])

    respond_to do |format|
      if @geo_coordinate.save
        flash[:notice] = 'GeoCoordinate was successfully created.'
        format.html { redirect_to(@geo_coordinate) }
        format.xml  { render :xml => @geo_coordinate, :status => :created, :location => @geo_coordinate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @geo_coordinate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /geo_coordinates/1
  # PUT /geo_coordinates/1.xml
  def update
    @geo_coordinate = GeoCoordinate.find(params[:id])

    respond_to do |format|
      if @geo_coordinate.update_attributes(params[:geo_coordinate])
        flash[:notice] = 'GeoCoordinate was successfully updated.'
        format.html { redirect_to(@geo_coordinate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @geo_coordinate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /geo_coordinates/1
  # DELETE /geo_coordinates/1.xml
  def destroy
    @geo_coordinate = GeoCoordinate.find(params[:id])
    @geo_coordinate.destroy

    respond_to do |format|
      format.html { redirect_to(geo_coordinates_url) }
      format.xml  { head :ok }
    end
  end
end
