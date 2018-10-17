###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_kaspersky_prdts_priv_escalation_vuln_jan10.nasl 8314 2018-01-08 08:01:01Z teissa $
#
# Kaspersky Products Privilege Escalation Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Local attackers can exploit this issue to replace some files (.kdl files)
  by malicious file (corrupted .dll files) and execute arbitrary code with
  SYSTEM privileges.
  Impact Level: System/Application";
tag_affected = "Kaspersky Anti-Virus 7, 2009, 2009 prior to 9.0.0.736
  Kaspersky Internet Security 7, 2009, 2009 prior to 9.0.0.736
  Kaspersky Anti-Virus 5.0, 6.0 for Windows Workstations prior to 6.0.4.1212
  Kaspersky Anti-Virus 6.0 for Windows File Servers prior to 6.0.4.1212";
tag_insight = "This flaw occurs due to insecure permissions (Everyone/Full Control)
  applied on the BASES folder which contains configuration files,
  antivirus bases and executable modules.";
tag_solution = "Upgrade to latest version of appropriate product,
  Kaspersky Anti-Virus/Internet Security 2009 (9.0.0.736)
  Kaspersky Anti-Virus for Windows Workstations/File Servers 6.0 (6.0.4.1212)
  For Updates, Refer http://www.kaspersky.com/productupdates";
tag_summary = "This host is installed with Kaspersky Products and is prone
  to Privilege Escalation vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800979");
  script_version("$Revision: 8314 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-08 09:01:01 +0100 (Mon, 08 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-01-09 13:17:56 +0100 (Sat, 09 Jan 2010)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:C/I:C/A:C");
  script_cve_id("CVE-2009-4452");
  script_bugtraq_id(37354);
  script_name("Kaspersky Products Privilege Escalation Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37398");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/3573");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/508508/100/0/threaded");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Privilege escalation");
  script_dependencies("gb_kaspersky_av_detect.nasl");
  script_mandatory_keys("Kaspersky/products/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

# For Kaspersky AntiVirus
kavVer = get_kb_item("Kaspersky/AV/Ver");
if(kavVer != NULL)
{
  if(version_is_less(version:kavVer, test_version:"9.0.0.736"))
  {
    security_message(0);
    exit(0);
  }
}

# For Kaspersky Internet Security
kisVer = get_kb_item("Kaspersky/IntNetSec/Ver");
if(kisVer != NULL)
{
  if(version_is_less(version:kisVer, test_version:"9.0.0.736"))
  {
    security_message(0);
    exit(0);
  }
}

# For Kaspersky Anti-Virus for Windows Workstations
kavwVer = get_kb_item("Kaspersky/AV-Workstation/Ver");
if(kavwVer != NULL)
{
  if(version_is_less(version:kavwVer, test_version:"6.0.4.1212"))
  {
    security_message(0);
    exit(0);
  }
}

# For Kaspersky Anti-Virus for Windows File Servers
kavfsVer = get_kb_item("Kaspersky/AV-FileServer/Ver");
if(kavfsVer != NULL)
{
  if(version_is_less(version:kavfsVer, test_version:"6.0.4.1212"))
  {
    security_message(0);
    exit(0);
  }
}
