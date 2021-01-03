class SessionsController < ApplicationController

  #método de entrada da página
  def new
    #caso já estiver logado, ir para página de usuário
    redirect_to user_path(current_user) if user_signed_in?
  end

  #loga
  def create
    #procura registro no banco com o email
    #lembrando que: o :session é o objeto repassado la no form no html, ou seja, tá acessando session.email ou o campo email do form
    user = User.find_by(email: params[:session][:email].downcase)

    #se user true e authenticate (método vindo do has_secure_password) true
    if user && user.authenticate(params[:session][:password])
      #cria session com método do helper
      sign_in(user)
      #vai para a página de contatos
      redirect_to contacts_path
    else
      #exibe mensagem de erro
      # o now usa-se quando não vai renderizar nova página, vai continuar na mesma, se não usar ele vai mostrar em todas as páginas que o usuário for
      flash.now[:danger] = "Dados repassados inválidos!"
      render 'new' # renderiza a mesma página
    end
  end

  #desloga
  def destroy
    #destrói session com método do helper
    sign_out
    #como vai renderizar outra página, não usa now
    flash[:success] = "Deslogado com sucesso!"
    redirect_to entrar_path
  end


end
