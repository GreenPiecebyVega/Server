class Api::ApiController < ActionController::Base
	before_action :jwt_auth

	private
		def jwt_auth
			
			begin request.headers['Authorization'].present?
			rescue
				return render json: { error: 'Unauthorized.' }, status: :unauthorized
			end

			jwt = request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
			
			begin
				config = YAML::load_file(Rails.root.join('app', 'controllers', 'api', 'config.yml'))
				decoded = JWT.decode(jwt, config['gp']['secret'], 'HS256')
			rescue 
				decoded = nil
			end
			
			if !decoded.present?
				return render json: { error: 'Unauthorized.' }, status: :unauthorized
			end

			begin
				id = decoded.first["id"].split(';').first
				@user = User.find_by(id: id, jwt_api: jwt)
			rescue
				@user = {}
			end

			if !@user
				return render json: { error: 'Unauthorized.' }, status: :unauthorized
			end

			if request.remote_ip !== 127.0.0.1 #teste
				return render json: { error: 'IP Not Allowed.' }, status: :forbidden
			end
		end
end
