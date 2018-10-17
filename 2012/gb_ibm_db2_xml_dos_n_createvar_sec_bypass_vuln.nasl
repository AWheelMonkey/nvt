###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_db2_xml_dos_n_createvar_sec_bypass_vuln.nasl 11549 2018-09-22 12:11:10Z cfischer $
#
# IBM DB2 XML Feature DoS and CREATE VARIABLE Security Bypass Vulnerabilities
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802730");
  script_version("$Revision: 11549 $");
  script_cve_id("CVE-2012-0712", "CVE-2012-0709");
  script_bugtraq_id(52326);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 14:11:10 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2012-04-03 10:41:54 +0530 (Tue, 03 Apr 2012)");
  script_name("IBM DB2 XML Feature DoS and CREATE VARIABLE Security Bypass Vulnerabilities");
  script_xref(name:"URL", value:"http://secunia.com/advisories/48279/");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/52326");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/73496");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21588098");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg1IC81379");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl");
  script_mandatory_keys("IBM-DB2/Remote/ver");
  script_tag(name:"impact", value:"Successful exploitation allows remote users to cause denial of
service, disclose sensitive information and bypass security restrictions.");
  script_tag(name:"affected", value:"IBM DB2 version 9.5 before FP9 and IBM DB2 version 9.7 before
FP5");
  script_tag(name:"insight", value:"The flaws are due to an,

  - Improper checks on variables, An attacker could exploit this vulnerability
using a specially crafted SQL statement to bypass table restrictions and
obtain sensitive information.

  - Error in the XML feature allows remote authenticated users to cause a
denial of service by calling the XMLPARSE function with a crafted string
expression.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"The host is running IBM DB2 and is prone to denial of service
and security bypass vulnerabilities.");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

ibmVer = get_kb_item("IBM-DB2/Remote/ver");
if(!ibmVer){
  exit(0);
}

if(ibmVer =~ "^0907\.*")
{
  # IBM DB2 9.7 FP 5 => 09075
  if(version_is_less_equal(version:ibmVer, test_version:"09075"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

if(ibmVer =~ "^0905\.*")
{
  # IBM DB2 9.5 FP 9 => 09059
  if(version_is_less(version:ibmVer, test_version:"09059")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
