###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_oracle_java_mult_unspecified_vuln_win.nasl 10144 2018-06-08 14:06:26Z asteins $
#
# Oracle Java SE Multiple Unspecified Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902347");
  script_version("$Revision: 10144 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 16:06:26 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2011-02-28 11:12:07 +0100 (Mon, 28 Feb 2011)");
  script_cve_id("CVE-2010-4422", "CVE-2010-4451", "CVE-2010-4452", "CVE-2010-4470",
                "CVE-2010-4472", "CVE-2010-4474");
  script_bugtraq_id(46402, 46405, 46388, 46387, 46404, 46407);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Oracle Java SE Multiple Unspecified Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/javacpufeb2011-304611.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_portable_win.nasl");
  script_mandatory_keys("Sun/Java/JDK_or_JRE/Win/installed");
  script_tag(name : "impact" , value : "Successful attacks will allow attackers to affect confidentiality, integrity,
  and availability via unknown vectors and execute arbitrary code in the context
  of the user running the affected application.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Oracle Java SE 6 Update 23 and prior.");
  script_tag(name : "insight" , value : "Multiple flaws are due to
  - Error in 'Java Runtime Environment (JRE)', which allows remote attackers to
    affect confidentiality, integrity, and availability via unknown vectors
    related to Deployment.
  - Error in 'Java Runtime Environment (JRE)', when using Java Update.
  - Error in 'Java Runtime Environment (JRE)' which allows remote attackers to
    affect availability via unknown vectors related to JAXP and unspecified APIs.
  - Error in 'Java Runtime Environment (JRE)', allows remote attackers to affect
    availability, related to XML Digital Signature and unspecified APIs.
  - Error in 'Java DB component', which allows local users to affect
    confidentiality via unknown vectors related to Security.");
  script_tag(name : "solution" , value : "Upgrade to Oracle Java SE 6 Update 24 or later
  For updates refer to http://java.com/en/download/index.jsp");
  script_tag(name : "summary" , value : "This host is installed with Sun Java SE and is prone to multiple
  unspecified vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");

jreVer = get_kb_item("Sun/Java/JRE/Win/Ver");
if(jreVer)
{

  if(version_in_range(version:jreVer, test_version:"1.6", test_version2:"1.6.0.23"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

jdkVer = get_kb_item("Sun/Java/JDK/Win/Ver");
if(jdkVer)
{
  if(version_in_range(version:jdkVer, test_version:"1.6", test_version2:"1.6.0.23")){
     security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}

