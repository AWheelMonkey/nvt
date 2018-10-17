###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_acquirequantumpixels_mem_corrupt_vuln_win.nasl 11901 2018-10-15 08:47:18Z mmartin $
#
# ImageMagick 'AcquireQuantumPixels' Memory Corruption Vulnerability (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810557");
  script_version("$Revision: 11901 $");
  script_cve_id("CVE-2016-8677");
  script_bugtraq_id(93598);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 10:47:18 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-20 15:05:25 +0530 (Mon, 20 Feb 2017)");
  script_tag(name:"qod_type", value:"registry");
  script_name("ImageMagick 'AcquireQuantumPixels' Memory Corruption Vulnerability (Windows)");

  script_tag(name:"summary", value:"The host is installed with ImageMagick
  and is prone to memory corruption vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to a memory corruption
  error in 'AcquireQuantumPixels' function in MagickCore/quantum.c script.");

  script_tag(name:"impact", value:"Successful exploitation will allows
  remote attackers to have an unspecified impact via a crafted image file,
  which triggers a memory allocation failure.");

  script_tag(name:"affected", value:"ImageMagick version 7.0.3.0 and prior
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to ImageMagick version 7.0.3.1 or
  later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2016/10/16/1");
  script_xref(name:"URL", value:"https://blogs.gentoo.org/ago/2016/10/07/imagemagick-memory-allocate-failure-in-acquirequantumpixels-quantum-c");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
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

if(version_is_less_equal(version:imVer, test_version:"7.0.3.0"))
{
  report = report_fixed_ver(installed_version:imVer, fixed_version:'7.0.3.1');
  security_message(data:report);
  exit(0);
}
