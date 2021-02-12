class MRolesController < ApplicationController
  def index
    @mrole = MRole.all
  end

  def new
    @mrole = MRole.new
  end
  def show
    
  end

  def create
    @mrole = MRole.new(m_role_params)
    respond_to do |format|
      if @mrole.save
        format.html { redirect_to m_roles_path , notice: 'Data was successfully saved.' }
      else
        format.html { render :new }
      end  
    end
  end

  def edit
    
  end
  
  def update
    respond_to do |format|
      if @mrole.update(m_role_params)
        format.html { redirect_to @mrole, notice: 'Data was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @mrole.destroy
    respond_to do |format|
      format.html { redirect_to m_roles_path , notice: 'Data was successfully deleted.' }
    end
  end

  private
  def m_role_params
    params.require(:m_role).permit(:role_name)  
  end
end
