set :application, 'exchequer-server'
ip = "exchequer"
server ip, user: 'deployer', roles: %w{web app db}
