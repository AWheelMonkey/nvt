##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_game_rec_broadcast.nasl 11344 2018-09-12 06:57:52Z emoss $
#
# Check value for Enables or disables Windows Game Recording and Broadcasting
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
  script_oid("1.3.6.1.4.1.25623.1.0.109490");
  script_version("$Revision: 11344 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-12 08:57:52 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-06-28 07:53:37 +0200 (Thu, 28 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows 10: Windows Game Recording and Broadcasting');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl", "os_detection.nasl");
  script_add_preference(name:"Value", type:"radio", value:"0;1");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Enables or disables Windows Game Recording and Broadcasting' on Windows hosts
(at least Windows 10).

The setting configure the Windows Game Recording and Broadcasting features.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

HostDetails = get_kb_list("HostDetails");
if("cpe:/o:microsoft:windows_10" >!< HostDetails){
  policy_logging(text:'Host is not a Microsoft Windows 10 system.
This setting applies to Windows 10 systems only.');
  exit(0);
}

title = 'Enables or disables Windows Game Recording and Broadcasting';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Administrative Templates/Windows Components/
Windows Game Recording and Broadcasting/' + title;
type = 'HKLM';
key = 'Software\\Policies\\Microsoft\\Windows\\GameDVR';
item = 'AllowGameDVR';
value = registry_get_dword(key:key, item:item, type:type);
default = script_get_preference('Value');

if(value == ''){
  value = '1';
}

if(int(value) == int(default)){
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