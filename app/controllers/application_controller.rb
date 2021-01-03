class ApplicationController < ActionController::Base

    include SessionsHelper

    #para páginas que precisam de login, chamar esse método se não estiver logado
    #nessas páginas, chamar esse método pelo before_action
    private
        def require_logged_in_user
            unless user_signed_in?
                flash[:danger] = "Acesso restrito. Por favor, realize login primeiro."
                redirect_to entrar_path
            end
        end

end
