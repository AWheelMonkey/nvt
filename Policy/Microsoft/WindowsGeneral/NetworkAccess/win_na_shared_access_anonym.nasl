##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_na_shared_access_anonym.nasl 11098 2018-08-23 14:32:47Z emoss $
#
# Check value for Network access: Shares that can be accessed anonymously
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
  script_oid("1.3.6.1.4.1.25623.1.0.109227");
  script_version("$Revision: 11098 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-23 16:32:47 +0200 (Thu, 23 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-06-11 14:53:35 +0200 (Mon, 11 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Network access: Shares that can be accessed anonymously');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_add_preference(name:"Value", type:"entry", value:"None");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Network access: Shares that can be accessed anonymously' on Windows hosts (at
least Windows 7).

The policy setting determines which shared folders can be accessed by anonymous
users.");
  exit(0);
default = script_get_preference('Value');
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

title = 'Network access: Shares that can be accessed anonymously';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Windows Settings/Security Settings/Local Policies/Security Options/' + title;
type = 'HKLM';
key = 'System\\CurrentControlSet\\Services\\LanManServer\\Parameters';
item = 'NullSessionShares';
default = script_get_preference('Value');
value = registry_get_sz(key:key, item:item, type:type);
if(!value || value == ''){
  val = 'None';
}else{
# item is MULTI_SZ, which are multiple lines. Could not find another way to replace the "newline" char.
  for(i = 0; i<strlen(value)-1; i++){
    if( hexstr(value[i]) == '00'){
      val += ', ';
    }else{
      val += value[i];
    }
  }
}

if(val == default){
  compliant = 'yes';
}else{
  compliant = 'no';
}

policy_logging(text:'"' + title + '" is set to: ' + val);
policy_add_oid();
policy_set_dval(dval:default);
policy_fixtext(fixtext:fixtext);
policy_control_name(title:title);
policy_set_kb(val:val);
policy_set_compliance(compliant:compliant);

exit(0);