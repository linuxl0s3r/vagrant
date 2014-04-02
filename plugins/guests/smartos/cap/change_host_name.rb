module VagrantPlugins
  module GuestSmartos
    module Cap
      class ChangeHostName
        def self.change_host_name(machine, name)
          su_cmd = machine.config.smartos.suexec_cmd

          # Only do this if the hostname is not already set
          if !machine.communicate.test("hostname | grep '#{name}'")
            machine.communicate.execute("#{su_cmd} sh -c \"echo '#{name}' > /etc/nodename\"")
            machine.communicate.execute("#{su_cmd} hostname #{name}")
          end
        end
      end
    end
  end
end