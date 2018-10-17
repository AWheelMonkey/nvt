##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_ie_defender_smartscreen.nasl 10989 2018-08-15 14:57:51Z emoss $
#
# Check value for Configure Windows Defender SmartScreen
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
  script_oid("1.3.6.1.4.1.25623.1.0.109486");
  script_version("$Revision: 10989 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 16:57:51 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-06-27 15:29:37 +0200 (Wed, 27 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Windows Defender SmartScreen (Explorer)');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_add_preference(name:"Value", type:"radio", value:"Warn;Block");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Configure Windows Defender SmartScreen' on Windows hosts (at least Windows 8.1).

The setting configures the Windows Defender SmartScreen. SmartScreen helps
protect PCs by warning users before running potentially malicious programs
downloaded from the Internet. The warning is presented as an interstitial dialog
shown before running an app that has been downloaded from the Internet and is
unrecognized or known to be malicious.");
  exit(0);
}

include("smb_nt.inc");
include("policy_functions.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  policy_logging(text:'Host is no Microsoft Windows System or it is not possible
to query the registry.');
  exit(0);
}

if(get_kb_item("SMB/WindowsVersion") < "6.3"){
  policy_logging(text:'Host is not at least a Microsoft Windows 8.1 system.
This setting applies to Windows 8.1 or higher versions only.');
  exit(0);
}

title = 'Configure Windows Defender SmartScreen';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Administrative Templates/Windows Components/
Windows Defender SmartScreen/Explorer/' + title;
type = 'HKLM';
key = 'Software\\Policies\\Microsoft\\Windows\\System';
item = 'ShellSmartScreenLevel';
value = registry_get_sz(key:key, item:item, type:type);
default = script_get_preference('Value');

if(!value){
  value = 'Disabled';
}

if(value == default){
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