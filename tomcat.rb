if node['Java']['base_version'].to_i == 7	
  if platform_family?('rhel') and node[:platform_version].to_i < 7	
    include_recipe 'java.rb'	
  end
 end
 
 
 
 remote_file "#{Chef::Config[:file_cache_path]}/apache-tomcat-7.0.57.tar.gz" do
 source "http://apache.mivzakim.net/tomcat/tomcat-7/v7.0.57/bin/apache-tomcat-7.0.57.tar.gz"
 end
 
 
 execute 'extract_some_tar' do									
 command 'tar xzvf apache-tomcat-7.0.57.tar.gz'				
  cwd '/usr/share'
  not_if { File.exists?("/usr/share") }
end
  
  
  
 bash 'install_something' do
  user 'root'
 
  
  # vi tomcat

 #!/bin/bash

# description: Tomcat Start Stop Restart

# processname: tomcat

#  chkconfig: 234 20 80

JAVA_HOME=/usr/java/jdk1.7.0_09

export JAVA_HOME

PATH=$JAVA_HOME/bin:$PATH

export PATH

CATALINA_HOME=/usr/share/apache-tomcat-7.0.32

 case $1 in

start)

sh $CATALINA_HOME/bin/startup.sh

;;

sh $CATALINA_HOME/bin/shutdown.sh

;;

restart)

sh $CATALINA_HOME/bin/shutdown.sh

sh $CATALINA_HOME/bin/startup.sh

;;

esac

exit 0

# cd  /etc/init.d

#  chmod 755 tomcat

# chkconfig --add  tomcat

# chkconfig  --level 35  tomcat on



# /etc/init.d/tomcat start
  
  EOH
end