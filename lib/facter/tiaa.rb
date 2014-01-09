# tiaa.rb
# to be distributed using pluginsync via puppet.conf on agent and master
require 'facter'
Facter.add("dc") do
  has_weight 100
  setcode do
    Facter.hostname[0..2]
  end
end
Facter.add("location") do
  setcode do
    Facter.dc
  end
end
Facter.add("env") do
  setcode do
    Facter.fqdn[3..4]
  end
end
Facter.add("site") do
  has_weight 80
  setcode do
#    Facter.value('hostname')[5]
     Facter.fqdn[5]
  end
end
Facter.add("tier") do
  has_weight 90
  setcode do
    Facter.fqdn[6]
  end
end
Facter.add("app") do
  setcode do
    Facter.fqdn[7..11]
  end
end
Facter.add(:BUILD) do
  setcode do
    "HAWC"
  end
end
Facter.add("IAM") do
  setcode do
    Facter.dc + Facter.site + Facter.tier
  end
end
Facter.add("sIAM") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('hostname')
    case distid
    when /RedHatEnterprise|CentOS|Fedora/
      "redhat"
    when "ubuntu"
      "debian"
    else
      distid
    end
  end
end
Facter.add("tIAM") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('hostname')
    case distid
    when /RedHatEnterprise|CentOS|Fedora/
      "redhat"
    when "ubuntu"
      "debian"
    else
      distid
    end
  end
end
Facter.add("OS_Vendor") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('osfamily')
    case distid
    when /RedHatEnterprise|CentOS|Fedora/
      "redhat"
    when "ubuntu"
      "debian"
    else
      distid
    end
  end
end
Facter.add("OS_Version") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('operatingsystemrelease')
  end
end
Facter.add("RHEL_Version") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('operatingsystemmajrelease')
  end
end
# @todo convert case to ruby from shell script then use hiera for lookup 
#case $IAM in
#        chaA[1-2])   	KICKSTART_SERVER="10.130.142.28:6080";;
#        chaB[1-2])   	KICKSTART_SERVER="10.136.142.28:6080";;
#        denA[1-2])   	KICKSTART_SERVER="10.216.142.33:6080";;
#        denB[1-2])	KICKSTART_SERVER="10.232.142.37:6080";;
#        chaA3)		KICKSTART_SERVER="chapda3ks01.ops.tiaa-cref.org";;
#        chaB3)		KICKSTART_SERVER="chapdb3ks01.ops.tiaa-cref.org";;
#        denA3)		KICKSTART_SERVER="denpda3ks01.ops.tiaa-cref.org";;
#        denB3)		KICKSTART_SERVER="denpdb3ks01.ops.tiaa-cref.org";;
#esac
Facter.add("KICKSTART_SERVER") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('operatingsystemmajrelease')
    case distid
    when /RedHatEnterprise|CentOS|Fedora/
      "redhat"
    when "ubuntu"
      "debian"
    else
      distid
    end
  end
end
Facter.add("Hardware") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('operatingsystemmajrelease')
    case distid
    when /RedHatEnterprise|CentOS|Fedora/
      "VM"
    when "ubuntu"
      "debian"
    else
      distid
    end
  end
end
Facter.add("HARDWARE_TYPE") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('is_virtual')
    case distid
    when /RedHatEnterprise|CentOS|Fedora/
      "VIRTUAL"
    when "ubuntu"
      "debian"
    else
      distid
    end
  end
end
Facter.add("HARDWARE_VENDOR") do
  confine :kernel => "Linux"
  setcode do
    distid = Facter.value('is_virtual')
    case distid
    when true
      Facter.value('virtual')
    when "ubuntu"
      "debian"
    else
      distid
    end
  end
end