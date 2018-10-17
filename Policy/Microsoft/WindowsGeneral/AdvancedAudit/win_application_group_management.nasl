##############################################################################
# OpenVAS Vulnerability Test
# $Id: win_application_group_management.nasl 11068 2018-08-21 11:51:41Z emoss $
#
# Check value for Audit Application Group Management
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
  script_oid("1.3.6.1.4.1.25623.1.0.109577");
  script_version("$Revision: 11068 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-21 13:51:41 +0200 (Tue, 21 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-20 10:10:59 +0200 (Mon, 20 Aug 2018)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:S/C:N/I:N/A:N");
  script_tag(name:"qod", value:"97");
  script_name('Microsoft Windows: Audit Application Group Management');
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH");
  script_family("Policy");
  script_dependencies("smb_reg_service_pack.nasl", "Policy/Microsoft/WindowsGeneral/win_AdvancedPolicySettings.nasl");
  script_add_preference(name:"Value", type:"radio", value:"Success and Failure;Success;Failure;No Auditing");
  script_mandatory_keys("Compliance/Launch");
  script_tag(name:"summary", value:"This test checks the setting for policy
'Audit Application Group Management' on Windows hosts (at least Windows 7).

The policy setting generates events for actions related to application groups, such as group
creation, modification, addition or removal of group member and some other actions.");
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

title = 'Audit Application Group Management';
fixtext = 'Set following UI path accordingly:
Computer Configuration/Windows Settings/Security Settings/Advanced Audit Policy Configuration/Audit
Policies/Account Management/' + title;
key = "WMI/AdvancedPolicy/ApplicationGroupManagement";
value = get_kb_item(key);
default = script_get_preference('Value');

if(!value){
  value = 'No Auditing';
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