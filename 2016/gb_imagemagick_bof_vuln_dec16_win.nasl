###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_bof_vuln_dec16_win.nasl 12313 2018-11-12 08:53:51Z asteins $
#
# ImageMagick 'Get8BIMProperty' Buffer Overflow Vulnerability (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:imagemagick:imagemagick";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810249");
  script_version("$Revision: 12313 $");
  script_cve_id("CVE-2016-6491");
  script_bugtraq_id(92186);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-12 09:53:51 +0100 (Mon, 12 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-06-06 18:38:55 +0530 (Mon, 06 Jun 2016)");
  script_tag(name:"qod_type", value:"registry");
  script_name("ImageMagick 'Get8BIMProperty' Buffer Overflow Vulnerability (Windows)");

  script_tag(name:"summary", value:"The host is installed with ImageMagick
  and is prone to a buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to a buffer overflow error
  in the Get8BIMProperty function in 'MagickCore/property.c' script.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service.");

  script_tag(name:"affected", value:"ImageMagick versions before 6.9.5-4 and 7.x
  before 7.0.2-6 on Windows.");

  script_tag(name:"solution", value:"Upgrade to ImageMagick version
  6.9.5-4 or 7.0.2-6 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1036501");
  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2016/q3/192");
  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2016/07/28/13");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Buffer overflow");
  script_dependencies("secpod_imagemagick_detect_win.nasl");
  script_mandatory_keys("ImageMagick/Win/Installed");
  script_xref(name:"URL", value:"http://www.imagemagick.org");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!imVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:imVer, test_version:"6.9.5.4"))
{
  fix = "6.9.5-4";
  VULN = TRUE;
}

else if(imVer =~ "7\.")
{
  if(version_is_less(version:imVer, test_version:"7.0.2.6"))
  {
    fix = "7.0.2-6";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:imVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}

