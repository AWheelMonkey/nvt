##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_getsimple_cms_info_disc_vuln.nasl 5611 2017-03-20 08:56:36Z cfi $
#
# GetSimple CMS Administrative Credentials Disclosure Vulnerability
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

CPE = "cpe:/a:getsimple:getsimple";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801551");
  script_version("$Revision: 5611 $");
  script_tag(name:"last_modification", value:"$Date: 2017-03-20 09:56:36 +0100 (Mon, 20 Mar 2017) $");
  script_tag(name:"creation_date", value:"2010-11-30 12:42:12 +0100 (Tue, 30 Nov 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("GetSimple CMS Administrative Credentials Disclosure Vulnerability");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_getsimple_cms_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("GetSimple_cms/installed");

  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/15605/");

  tag_impact = "Successful exploitation will allow remote attackers to obtain sensitive
  information.

  Impact Level: Application.";

  tag_affected = "GetSimple CMS 2.01 and 2.02";

  tag_insight = "GetSimple does not use a SQL Database. Instead it uses a '.xml' files located
  at  '/GetSimple/data'. The administrators username and password hash can be
  obtained by navigating to the '/data/other/user.xml' xml file.";

  tag_solution = "Apply the patch or upagrade to GetSimple CMS 2.03 or later,
  For updates refer to http://get-simple.info/download/";

  tag_summary = "This host is running GetSimple CMS and is prone to administrative
  credentials disclosure vulnerability.";

  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

if( dir == "/" ) dir = "";

url = dir + "/data/other/user.xml";

## Try attack and check the response to confirm vulnerability.
if( http_vuln_check( port:port, url:url, pattern:"(<PWD>.*</PWD>)" ) ) {
  report = report_vuln_url( port:port, url:url );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );