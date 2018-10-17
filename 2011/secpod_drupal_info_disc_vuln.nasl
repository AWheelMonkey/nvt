###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_drupal_info_disc_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Drupal Information Disclosure Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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

tag_impact = "Successful exploitation will allow attacker to obtain sensitive
information that could aid in further attacks.

Impact Level: Application";

tag_affected = "Drupal Version 7.0";

tag_insight = "The flaw is due to insufficient error checking, allows remote
attackers to obtain sensitive information via a direct request to a .php
file, which reveals the installation path in an error message.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running Drupal and is prone to information disclosure
vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902574");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-09-30 15:58:03 +0200 (Fri, 30 Sep 2011)");
  script_cve_id("CVE-2011-3730");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Drupal Information Disclosure Vulnerability");


  script_tag(name:"qod_type", value:"remote_active");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("drupal_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name : "URL" , value : "http://code.google.com/p/inspathx/source/browse/trunk/paths_vuln/!_README");
  script_xref(name : "URL" , value : "http://code.google.com/p/inspathx/source/browse/trunk/paths_vuln/drupal-7.0");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);
if(!port){
  exit(0);
}

## Check Host Supports PHP
if(!can_host_php(port:port)) {
  exit(0);
}

if(dir = get_dir_from_kb(port:port,app:"drupal"))
{
  ## Construct attack request
  url = dir + "/modules/simpletest/tests/upgrade/drupal-6.upload.database.php";

  ## Try Attack and check the response to confirm vulnerability
  if(http_vuln_check(port:port, url:url, check_header: TRUE,
     pattern:"<b>Fatal error</b>:  Call to undefined function  db_insert\(\)" +
             " in .*drupal-6.upload.database.php")) {
    security_message(port);
  }
}
