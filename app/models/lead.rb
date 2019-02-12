class Lead < ApplicationRecord
  before_save :set_data_hora
  require 'csv'

  validates :nome, presence: true
  validates :sobrenome, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp, message: "Email invalido" }
  validates :ip, presence: true

  def self.to_csv
    attributes = %w{email nome ip tipo data_hora}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      self.all.each do |lead|
        csv << [lead.email, lead.fullname, lead.ip, lead.tipo, lead.data_hora]
      end
    end
  end

  def fullname
    "#{self.nome} #{self.sobrenome}"
  end

  private

  def set_data_hora
    self.data_hora = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end


end
