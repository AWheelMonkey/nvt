##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_deny_sbp2_thunderbolt.nasl 11532 2018-09-21 19:07:30Z cfischer $
#
# Check value for Block SBP-2 Driver and Thunderbolt controllers
#
# Authors:
# Emanuel Moss <emanuel.moss@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.109343");
  script_version("$Revision: 11532 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 21:07:30 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-06-25 08:48:11 +0200 (Mon, 25 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Block SBP-2 Driver and Thunderbolt controllers');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_add_preference(name:"Value", type:"entry", value:"PCI\CC_0C0A");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Block SBP-2 Driver and Thunderbolt controllers' on Windows hosts (at least
Windows 7).

A BitLocker-protected computer may be vulnerable to Direct Memory Access (DMA)
attacks when the computer is turned on or is in the Standby power state,
including locked desktop.
BitLocker with TPM-only authentication lets a computer to enter the power-on
state without any pre-boot authentication, leaving an attacker able to perform
DMA attacks.
In these configurations, an attacker may be able to search for BitLocker
encryption keys in system memory by spoofing the SBP-2 hardware ID by using an
attacking device that is plugged into a 1394 port. Alternatively, an active
Thunderbolt port also provides access to system memory to perform an attack.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

if(get_kb_item("SMB/WindowsVersion") < "6.1"){
  policy_logging(text:'Host is not at least a Microsoft Windows 7 system.
Older versions of Windows are not supported any more. Please update the
Operating System.');
  exit(0);
}

title = 'Prevent installation of devices that match any of these device IDs';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Administrative Templates/System/Device Installation/Device Installation Restrictions/' + title;
type = 'HKLM';
key = 'Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Restrictions\\DenyDeviceIDs';
item = '1';
default = script_get_preference('Value');
value = registry_get_sz(key:key, item:item, type:type);

if(!value){
  value = 'none';
}

if(default >< value){
  compliant = 'yes';
}else{
  compliant = 'no';
}

policy_logging(text:'"' + title + '" is set to: ' + value);
policy_add_oid();
policy_set_dval(dval:default);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);
policy_set_kb(val:value);
policy_set_compliance(compliant:compliant);

exit(0);