class User < ApplicationRecord

    #esse método irá criar um hash da senha
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    #validates é um método que permite fazer validações
    validates :name, presence: true, length: {maximum: 50}
    validates :password, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: true}

    #usuário vai ter vários contatos
    has_many :contacts

end
