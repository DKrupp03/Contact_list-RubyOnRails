class UsersController < ApplicationController

    before_action :require_logged_in_user, only: [:edit, :update]

    def new
        #cria nova instancia de user -> do model
        @user = User.new
    end

    def create
        #cria instancia passando os dados que user_params aceita
        @user = User.new(user_params)

        #tenta salvar -> chama as varidações do model
        if @user.save
            #mensagem de sucesso
            flash[:success] = "Usuário foi cadastrado com sucesso!"
            #redireciona pra root
            redirect_to root_url
        else
            #se não, renderiza a página novamente
            render 'new'
        end
    end

    def Editar
    end

    def update
        if current_user.update(user_params)
            flash[:success] = 'Dados atualizados com sucesso'
            redirect_to contacts_url
        else
            render 'edit'
        end
    end


    private
    def user_params
        #permite que só seja criada instancia se o form passar require user[com os atributos do permit]
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

end
