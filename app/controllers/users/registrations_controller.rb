# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # Inheritance of the OG new & create
    super
    create_user_associations if @user.persisted?
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def create_user_associations
    create_user_genres
    create_user_actors
    create_user_directors
  end

  def create_user_genres
    chosen_genres = params[:user][:genre_ids]
    chosen_genres.each do |genre_id|
      UserGenre.create!(genre_id: genre_id.to_i, user_id: User.last.id)
    end if chosen_genres
  end

  def create_user_actors
    chosen_actors = params[:user][:actor_ids]
    chosen_actors.each do |actor_id|
      UserActor.create!(actor_id: actor_id.to_i, user_id: User.last.id)
    end if chosen_actors
  end

  def create_user_directors
    chosen_directors = params[:user][:director_ids]
    chosen_directors.each do |director_id|
      UserDirector.create!(director_id: director_id.to_i, user_id: User.last.id)
    end if chosen_directors
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, genre_ids: [], director_ids: [], actor_ids: []])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
