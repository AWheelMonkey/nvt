##############################################################################
# OpenVAS Vulnerability Test
# $Id: defav_days_before_virus_outdated.nasl 11495 2018-09-20 10:06:25Z emoss $
#
# Check value for Windows Defender AV: Define the number of days before virus
# definitions are considered out of date
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
  script_oid("1.3.6.1.4.1.25623.1.0.109201");
  script_version("$Revision: 11495 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-20 12:06:25 +0200 (Thu, 20 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-06-07 16:25:55 +0200 (Thu, 07 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows Defender AV: Number of days before virus definitions are outdated');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_add_preference(name:"Value", type:"entry", value:"14");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Define the number of days before virus definitions are considered out of date'
on Windows hosts (at least Windows 8.1).

The policy setting defines the number of days that must pass before virus
definitions are considered out of date. By default, this value is set to 14 days.
If enabled, virus definitions will be considered out of date after the number of
days specified have passed without an update.
If disabled or not configured, virus definitions will be considered out of date
after the default number of days have passed without an update.");
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
Older versions of Windows do not supported this setting.');
  exit(0);
}

title = 'Define the number of days before virus definitions are considered out of date';
type = 'HKLM';
key = 'Software\\Policies\\Microsoft\\Windows Defender\\Signature Updates';
item = 'AVSignatureDue';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Administrative Templates/Windows Components/Windows Defender Antivirus/Signature
Updates/' + title;
value = registry_get_dword(key:key, item:item, type:type);
default = script_get_preference('Value');

if(value == ''){
  value = '14';
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