###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_connector_net_ssl_cert_sec_bypass_vuln.nasl 8469 2018-01-19 07:58:21Z teissa $
#
# MySQL Connector/Net SSL Certificate Validation Security Bypass Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_impact = "Successful exploitation will allow attackers to perform man-in-the-middle
  attacks, which will aid in further attacks.
  Impact Level: Application";
tag_affected = "MySQL Connector/Net 6.0.3 and prior.";
tag_insight = "The flaw is caused by improper verification of certificates when using SSL
  connections that allow remote attackers to conduct spoofing attacks.";
tag_solution = "Upgrade to the latest version of MySQL Connector/Net 6.0.4 or later,
  For updates refer to http://dev.mysql.com/downloads/connector/net";
tag_summary = "This host is installed with MySQL Connector/Net and is prone to
  security bypass vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801205");
  script_version("$Revision: 8469 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-19 08:58:21 +0100 (Fri, 19 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-05-07 15:36:02 +0200 (Fri, 07 May 2010)");
  script_bugtraq_id(35514);
  script_cve_id("CVE-2009-4833");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_name("MySQL Connector/Net SSL Certificate Validation Security Bypass Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/35604");
  script_xref(name : "URL" , value : "http://bugs.mysql.com/bug.php?id=38700");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/51406");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## COnfirm it's Windows
if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

## Get EnumKeys
key = "SOFTWARE\MySQL AB\";
if(!registry_key_exists(key:key)) {
    exit(0);
}

enumKeys = registry_enum_keys(key:key);

## Exit if no keys exists
if(isnull(enumKeys)){
  exit(0);
}

foreach item (enumKeys)
{
  if("MySQL Connector/Net" >< item)
  {
    ## Get version from Registry
    ver = registry_get_sz(key:key+item, item:"Version");

    ## Check for version before 6.0.4
    if(ver && version_is_less(version: ver, test_version: "6.0.4")){
      security_message(0);
    }
    exit(0);
  }
}
