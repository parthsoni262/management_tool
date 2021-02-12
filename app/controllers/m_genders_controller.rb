class MGendersController < ApplicationController
  def index
    @mgender = MGender.all
  end

  def new
    @mgender = MGender.new
  end
  def show
    
  end

  def create
    @mgender = MGender.new(m_gender_params)
    respond_to do |format|
      if @mgender.save
        format.html { redirect_to m_genders_path , notice: 'Data was successfully saved.' }
      else
        format.html { render :new }
      end  
    end
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @mgender.update(m_gender_params)
        format.html { redirect_to @mgender, notice: 'Data was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @mgender.destroy
    respond_to do |format|
      format.html { redirect_to m_genders_path , notice: 'Data was successfully deleted.' }
    end
  end

  private
  def m_gender_params
    params.require(:m_gender).permit(:gender_cd,
                                     :gender_name
                                    )  
  end
end
