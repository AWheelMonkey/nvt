###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_51281.nasl 11855 2018-10-12 07:34:51Z cfischer $
#
# OpenSSL Multiple Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:openssl:openssl";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103394");
  script_bugtraq_id(51281);
  script_cve_id("CVE-2011-4108", "CVE-2011-4109", "CVE-2011-4576", "CVE-2011-4577", "CVE-2011-4619", "CVE-2012-0027");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");
  script_version("$Revision: 11855 $");

  script_name("OpenSSL Multiple Vulnerabilities");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/51281");
  script_xref(name:"URL", value:"http://www.openssl.org");
  script_xref(name:"URL", value:"http://www.openssl.org/news/secadv_20120104.txt");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 09:34:51 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-01-20 11:28:16 +0100 (Fri, 20 Jan 2012)");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
  script_dependencies("gb_openssl_detect.nasl");
  script_mandatory_keys("OpenSSL/installed");
  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");
  script_tag(name:"summary", value:"OpenSSL prone to multiple security vulnerabilities.

An attacker may leverage these issues to obtain sensitive information,
cause a denial-of-service condition and perform unauthorized actions.");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! vers = get_app_version( cpe:CPE ) ) exit(0);
vers = ereg_replace(string:vers, pattern:"([a-z]$)", replace:".\1");

if(vers =~ "1\.0\.") {
  if(version_is_less(version:vers, test_version:"1.0.0.f")) {
    report = 'Installed version: ' + vers + '\n' +
             'Fixed version:     1.0.0.f';

    security_message(port:0, data:report);
    exit(0);
  }
}

if(vers =~ "0\.9\.") {
  if(version_is_less(version:vers, test_version:"0.9.8.s")) {
    report = 'Installed version: ' + vers + '\n' +
             'Fixed version:     0.9.8.s';
    security_message(port:0, data:report);
    exit(0);
  }
}

exit(0);
