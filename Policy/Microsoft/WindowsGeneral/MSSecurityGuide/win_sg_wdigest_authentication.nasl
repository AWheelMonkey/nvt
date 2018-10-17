##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_sg_wdigest_authentication.nasl 11337 2018-09-11 14:23:53Z emoss $
#
# Check value for WDigest Authentication
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
  script_oid("1.3.6.1.4.1.25623.1.0.109307");
  script_version("$Revision: 11337 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-11 16:23:53 +0200 (Tue, 11 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-06-15 11:51:43 +0200 (Fri, 15 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: MS Security Guide: WDigest Authentication');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_add_preference(name:"Value", type:"radio", value:"0;1");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'WDigest Authenticationr' on Windows hosts (at least Windows 7).

When WDigest authentication is enabled, Lsass.exe retains a copy of the users
plaintext password in memory, where it can be at risk of theft. Microsoft
recommends disabling WDigest authentication unless it is needed.
If this setting is not configured, WDigest authentication is disabled in
Windows 8.1 and in Windows Server 2012 R2; it is enabled by default in earlier
versions of Windows and Windows Server.");
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
Older versions of Microsoft Windows are not supported any more.
Please update the system.');
  exit(0);
}

title = 'WDigest Authentication (disabling may require KB2871997)';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Administrative Templates/MS Security Guide' + title;
type = 'HKLM';
key = 'SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\WDigest';
item = 'UseLogonCredential';
default = script_get_preference('Value');
value = registry_get_dword(key:key, item:item, type:type);
if(value == ''){
  value = '0';
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