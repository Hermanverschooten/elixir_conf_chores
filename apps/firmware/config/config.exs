# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"

config :nerves, :firmware,
  rootfs_additions: "config/rootfs-additions"

config :user_interface, UserInterface.Endpoint,
  http: [port: 8080],
  url: [host: "localhost", port: 8080],
  secret_key_base: "LOQ9556hzfXeJ75BJ35g2/oF6bXfyzr+6liQGaB53fJkSSuXjqw/ksdx7/ct+elw",
  root: Path.dirname(__DIR__),
  check_origin: false,
  server: true,
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: UserInterface.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :the_internet, TheInternet.Endpoint,
 http: [port: 80],
 url: [host: "localhost", port: 80],
 secret_key_base: "nnFXcslVM2UVJDsOvLmeptBLF1SWlHZ5M3PNp2BQPsc6w4Sdt+ROm40O2sLeAlZ4",
 root: Path.dirname(__DIR__),
 check_origin: false,
 server: true,
 render_errors: [accepts: ~w(html json)]

config :logger, level: :debug

config :chore_repository, :config,
  file: "/root/chore_repository"

config :router_controls, system_client: System
config :router_controls, admin_mac: "#{System.get_env("ADMIN_MAC")}"
