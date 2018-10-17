###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_otrs_email_multiple_vuln.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# OTRS Email Multiple Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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
CPE = "cpe:/a:otrs:otrs";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803915");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2008-7280", "CVE-2008-7281");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-17 16:43:34 +0530 (Tue, 17 Sep 2013)");
  script_name("OTRS Email Multiple Vulnerability");


  script_tag(name:"summary", value:"This host is installed with OTRS (Open Ticket Request System) and is prone to
multiple vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade to OTRS (Open Ticket Request System) version 2.2.7 or later.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"insight", value:"-An error exists in Kernel/System/EmailParser.pm in PostmasterPOP3.pl which
does not properly handle e-mail messages containing malformed UTF-8 characters

  - An error exists in otrs-email.pm, which sends e-mail containing a Bcc header
field that lists the Blind Carbon Copy recipients");
  script_tag(name:"affected", value:"OTRS (Open Ticket Request System) version before 2.2.7");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to obtain potentially
sensitive e-mail address information or cause the application to crash by
creating a denial of service condition.");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("secpod_otrs_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("OTRS/installed");
  script_xref(name:"URL", value:"http://www.otrs.com/en/");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE)){
  exit(0);
}

if(vers = get_app_version(cpe:CPE, port:port))
{
  if(version_is_less(version: vers, test_version: "2.2.7"))
  {
      security_message(port:port);
      exit(0);
  }

}
