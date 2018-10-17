##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_os_restrict_crypto.nasl 11532 2018-09-21 19:07:30Z cfischer $
#
# Check value for Configure use of hardware-based encryption for operating
# system drives: Restrict crypto algorithms or cipher suites to the following
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
  script_oid("1.3.6.1.4.1.25623.1.0.109401");
  script_version("$Revision: 11532 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 21:07:30 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-06-26 10:00:51 +0200 (Tue, 26 Jun 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Hardware-based encryption for OS drives (allowed algorithms)');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl");
  script_add_preference(name:"Value", type:"entry", value:"2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Configure use of hardware-based encryption for operating system drives:
Restrict crypto algorithms or cipher suites to the following' on Windows hosts
(at least Windows 8.1).

The setting manages BitLockers use of hardware-based encryption on operating
system drives and specify which encryption algorithms it can use with
hardware-based encryption. Using hardware-based encryption can improve
performance of drive operations that involve frequent reading or writing of
data to the drive.
The option specifies the encryption algorithms and cipher suites used with
hardware-based encryption.");
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
This setting applies to Windows 8.1 or higher versions.');
  exit(0);
}

title = 'Configure use of hardware-based encryption for operating system drives:
Restrict crypto algorithms or cipher suites to the following';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Administrative Templates/Windows Components/
BitLocker Drive Encryption/Operating System Drives/' + title;
type = 'HKLM';
key = 'Software\\Policies\\Microsoft\\FVE';
item = 'OSAllowedHardwareEncryptionAlgorithms';
value = registry_get_sz(key:key, item:item, type:type);
default = script_get_preference('Value');

if(!value){
  value = 'None';
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