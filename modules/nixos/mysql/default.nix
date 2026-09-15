#
# mysql.nix — MySQL / MariaDB (dev)
#
# Throwaway MariaDB container bound to localhost only (XAMPP-style local DB).
# Starts at boot alongside Docker. Credentials are default/dev values —
# not intended for anything exposed.
#
{
  config,
  lib,
  namespace,
  ...
}:

let
  cfg = config.${namespace}.mysql;
in
{
  options.${namespace}.mysql.enable =
    lib.mkEnableOption "throwaway MariaDB 11 dev container (XAMPP-style)";

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers.containers.mysql = {
      image = "mariadb:11";
      autoStart = true;

      ports = [ "127.0.0.1:3306:3306" ];

      environment = {
        MYSQL_ROOT_PASSWORD = "mysql";
        MYSQL_DATABASE = "app";
        MYSQL_USER = "mysql";
        MYSQL_PASSWORD = "mysql";
      };

      volumes = [ "mysql-data:/var/lib/mysql" ];
    };
  };
}
