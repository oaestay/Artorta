class CompaniesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all.order("popularity desc").paginate(page: params[:page], per_page: 24)
  end

  def show
    @company.popularity += 1
    @company.save
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :popularity, :image)
    end
end
