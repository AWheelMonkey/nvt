###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_rle_files_reading_bof_vuln_macosx.nasl 11900 2018-10-15 07:44:31Z mmartin $
#
# ImageMagick 'coders/rle.c' Remote Buffer Overflow Vulnerability (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810503");
  script_version("$Revision: 11900 $");
  script_cve_id("CVE-2016-10049");
  script_bugtraq_id(95180);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 09:44:31 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-01-17 15:32:07 +0530 (Tue, 17 Jan 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("ImageMagick 'coders/rle.c' Remote Buffer Overflow Vulnerability (Mac OS X)");

  script_tag(name:"summary", value:"The host is installed with ImageMagick
  and is prone to a buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to a buffer-overflow error
  in the 'coders/rle.c' script.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to execute arbitrary code in context of the application. Failed
  exploits may result in denial-of-service conditions.");

  script_tag(name:"affected", value:"ImageMagick versions before 6.9.4-4
  on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to ImageMagick version
  6.9.4-4 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2016/q4/758");
  script_xref(name:"URL", value:"https://github.com/ImageMagick/ImageMagick/commit/3e9165285eda6e1bb71172031d3048b51bb443a4");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_imagemagick_detect_macosx.nasl");
  script_mandatory_keys("ImageMagick/MacOSX/Version");
  script_xref(name:"URL", value:"http://www.imagemagick.org");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!imVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:imVer, test_version:"6.9.4.4"))
{
  report = report_fixed_ver(installed_version:imVer, fixed_version:'6.9.4-4');
  security_message(data:report);
  exit(0);
}
