###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ruby_on_rails_action_pack_remote_code_exec_vuln_win.nasl 12455 2018-11-21 09:17:27Z cfischer $
#
# Ruby on Rails Action Pack Remote Code Execution Vulnerability (Windows)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = 'cpe:/a:rubyonrails:ruby_on_rails';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809352");
  script_version("$Revision: 12455 $");
  script_cve_id("CVE-2016-2098");
  script_bugtraq_id(83725);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 10:17:27 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-10-14 18:40:26 +0530 (Fri, 14 Oct 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Ruby on Rails Action Pack Remote Code Execution Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Ruby on Rails and is
  prone to remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an improper sanitization of
  user supplied inputs to the 'render' method in a controller or view by
  'Action Pack'.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to control the arguments of the render method in a controller or a view,
  resulting in the possibility of executing arbitrary ruby code.");

  script_tag(name:"affected", value:"Ruby on Rails before 3.2.22.2,
  Ruby on Rails 4.x before 4.1.14.2 and
  Ruby on Rails 4.2.x before 4.2.5.2 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Ruby on Rails 3.2.22.2 or 4.1.14.2 or
  4.2.5.2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.debian.org/security/2016/dsa-3509");
  script_xref(name:"URL", value:"https://groups.google.com/forum/message/raw?msg=rubyonrails-security/ly-IH-fxr_Q/WLoOhcMZIAAJ");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_ruby_rails_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("RubyOnRails/installed", "Host/runs_windows");
  script_require_ports("Services/www", 3000);
  script_xref(name:"URL", value:"http://rubyonrails.org");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!RubyonRailPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!RubyonRailVer = get_app_version(cpe:CPE, port:RubyonRailPort)){
  exit(0);
}

if(version_is_less(version:RubyonRailVer, test_version:"3.2.22.2"))
{
  fix = "3.2.22.2";
  VULN = TRUE;
}

else if(RubyonRailVer =~ "^(4\.1)")
{
  if(version_is_less(version:RubyonRailVer, test_version:"4.1.14.2"))
  {
    fix = "4.1.14.2";
    VULN = TRUE;
  }
}

else if(RubyonRailVer =~ "^(4\.2)")
{
  if(version_is_less(version:RubyonRailVer, test_version:"4.2.5.2"))
  {
    fix = "4.2.5.2";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:RubyonRailVer, fixed_version:fix);
  security_message(port:RubyonRailPort, data:report);
  exit(0);
}
