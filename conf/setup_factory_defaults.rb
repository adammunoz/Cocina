require 'gconf2'
client = GConf::Client.default

client["/apps/cocina/host"] = '192.168.1.11'
client["/apps/cocina/main_port"] = 8888
client["/apps/cocina/query_port"] = 7777
client["/apps/cocina/listen_tables"] = "1"