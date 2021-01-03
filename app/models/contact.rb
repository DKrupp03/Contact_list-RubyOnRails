class Contact < ApplicationRecord

    #validação para nome e telefone
    validates :name, presence: true, length: {maximum: 50}
    validates :phone, presence: true

    #contato vai ser de apenas um usuário
    belongs_to :user


end
