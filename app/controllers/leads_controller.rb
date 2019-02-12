class LeadsController < ApplicationController

  def index
    @leads = Lead.all
    respond_to do |format|
      format.html
      format.csv { send_data Lead.to_csv }
      format.xls
    end
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      flash[:notice] = "Parabéns! Seu e-book será baixado em alguns instantes"
      redirect_to download_pdf_path
    else
      flash[:alert] = "Dados inválidos. Por favor tente novamente"
      redirect_to root_path
    end

  end

  def download_pdf
    send_file(
    "#{Rails.root}/app/assets/files/ebook.pdf",
    filename: "decole_como_mei.pdf",
    type: "application/pdf"
    )
  end

  private

  def lead_params
    params.require(:lead).permit(:email, :nome, :sobrenome, :tipo, :ip)
  end
end
