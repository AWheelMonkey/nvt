###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_mult_dos_vuln_jan17_win.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# ImageMagick Multiple Denial of Service Vulnerabilities Jan17 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810275");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2016-10053", "CVE-2016-10054", "CVE-2016-10055", "CVE-2016-10056",
                "CVE-2016-10057");
  script_bugtraq_id(95179, 95191, 95193, 95190, 95192);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-01-13 15:10:00 +0530 (Fri, 13 Jan 2017)");
  script_tag(name:"qod_type", value:"registry");
  script_name("ImageMagick Multiple Denial of Service Vulnerabilities Jan17 (Windows)");

  script_tag(name:"summary", value:"The host is installed with ImageMagick
  and is prone to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to multiple buffer overflow
  errors in files 'coders/map.c', 'coders/pdb.c', 'coders/sixel.c' and
  'coders/tiff.c' and an unspecified error.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to cause denial-of-service condition.");

  script_tag(name:"affected", value:"ImageMagick versions before 6.9.5-8
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to ImageMagick version
  6.9.5-8 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2016/q4/758");
  script_xref(name:"URL", value:"https://github.com/ImageMagick/ImageMagick/commit/f983dcdf9c178e0cbc49608a78713c5669aa1bb5");
  script_xref(name:"URL", value:"https://github.com/ImageMagick/ImageMagick/commit/10b3823a7619ed22d42764733eb052c4159bc8c1");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
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

if(version_is_less(version:imVer, test_version:"6.9.5.8"))
{
  report = report_fixed_ver(installed_version:imVer, fixed_version:'6.9.5-8');
  security_message(data:report);
  exit(0);
}
