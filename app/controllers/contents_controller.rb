class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]


  def index
    @contents = Content.all
  end

  def show
  end

  def new
    @content = current_user.contents.build
  end

  def edit
  end

  def create
    @content = current_user.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to content_url(@content), notice: "Content was successfully created." }     
      else
        format.html { render :new }  
      end
    end
  end

  def update  
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to content_url(@content), notice: "Content was successfully updated." }
      else
        format.html { render :edit }   
      end
    end
  end

  def destroy
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url, notice: "Content was successfully destroyed." }
    end
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:titolo, :descrizione, :price, :cover, :contenuto)
    end

    def check_user
      if current_user != @content.user
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
