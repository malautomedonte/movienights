class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # POST /resource
  def create
    super
    create_user_associations if resource.persisted?
  end

  # GET /resource/edit
  def edit
    @user = current_user
    @my_events = current_user.events
    @attended_events = current_user.event_users
    super
  end

  # PUT /resource
  def update
    super do
      if resource.errors.empty?
        update_user_associations
      end
    end
        if params[:user][:photo].blank?
      params[:user].delete(:photo)
    end
  end

  protected

  def create_user_associations
    create_user_genres
    create_user_actors
    create_user_directors
  end

  def create_user_genres
    genre_ids = params[:user][:genre_ids] || []
    genre_ids.each do |genre_id|
      next if genre_id.blank?
      UserGenre.create!(genre_id: genre_id.to_i, user: resource)
    end
  end

  def create_user_actors
    actor_ids = params[:user][:actor_ids] || []
    actor_ids.each do |actor_id|
      next if actor_id.blank?
      UserActor.create!(actor_id: actor_id.to_i, user: resource)
    end
  end

  def create_user_directors
    director_ids = params[:user][:director_ids] || []
    director_ids.each do |director_id|
      next if director_id.blank?
      UserDirector.create!(director_id: director_id.to_i, user: resource)
    end
  end

  def update_user_associations
    update_user_genres
    update_user_actors
    update_user_directors
  end

  def update_user_genres
    genre_ids = params[:user][:genre_ids] || []
    current_user.genres = Genre.where(id: genre_ids)
  end

  def update_user_actors
    actor_ids = params[:user][:actor_ids] || []
    current_user.actors = Actor.where(id: actor_ids)
  end

  def update_user_directors
    director_ids = params[:user][:director_ids] || []
    current_user.directors = Director.where(id: director_ids)
  end

  def after_update_path_for(resource)
    flash[:notice] = "Account successfully updated"
    pages_user_profile_path(resource)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :photo, genre_ids: [], director_ids: [], actor_ids: []])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :photo, genre_ids: [], director_ids: [], actor_ids: []])
  end
end
