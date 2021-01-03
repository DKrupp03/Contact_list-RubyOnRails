module SessionsHelper

    #login do usuário
    def sign_in(user)
        #session[:nome_da_session] é a maneira como o rails disponibiliza as sessions
        session[:user_id] = user.id
    end

    #deslogar
    def sign_out
        session.delete(:user_id)
    end

    #define usuário ativo caso não haja
    def current_user
        #define uma variável global, ||= significa que caso não haja a variável (nil), executa o que vem a seguir
        @current_user ||= User.find_by(id: session[:user_id])
    end

    #verifica se tá logado
    def user_signed_in?
        !current_user.nil?
    end

end
