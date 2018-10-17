###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_apr_util_dos_vuln.nasl 11553 2018-09-22 14:22:01Z cfischer $
#
# Apache APR-util 'buckets/apr_brigade.c' Denial Of Service Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801521");
  script_version("$Revision: 11553 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 16:22:01 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-10-07 09:42:58 +0200 (Thu, 07 Oct 2010)");
  script_cve_id("CVE-2010-1623");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_bugtraq_id(43673);
  script_name("Apache APR-util 'buckets/apr_brigade.c' Denial Of Service Vulnerability");

  script_xref(name:"URL", value:"http://secunia.com/advisories/41701");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2010/2556");
  script_xref(name:"URL", value:"http://security-tracker.debian.org/tracker/CVE-2010-1623");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_apache_apr-utils_detect.nasl");
  script_mandatory_keys("Apache/APR-Utils/Ver");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to cause a denial of service
  (memory consumption) via unspecified vectors.");
  script_tag(name:"affected", value:"Apache APR-Utils version prior 1.3.10");
  script_tag(name:"insight", value:"The flaw is due to an error in 'apr_brigade_split_line()' function in
  'buckets/apr_brigade.c', which allows an attacker to cause a denial of
  service (memory consumption).");
  script_tag(name:"summary", value:"The host is installed with Apache APR-Util and is prone to
  denial of service vulnerability.");
  script_tag(name:"solution", value:"Upgrade to APR-util version 1.3.10
  For updates refer to http://apr.apache.org/download.cgi

  or
  Apply patch for versions 1.3.x
  http://svn.apache.org/viewvc?view=revision&revision=1003494

  Apply patch for versions 0.9.x
  http://svn.apache.org/viewvc?view=revision&revision=1003495

  *****
  NOTE: Ignore this warning if above mentioned patch is already applied.
  *****");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");

apruVer = get_kb_item("Apache/APR-Utils/Ver");

# Apache APR-util
if(apruVer != NULL)
{
  if(version_is_less(version:apruVer, test_version:"1.3.10")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}
