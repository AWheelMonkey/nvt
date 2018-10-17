###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_44bfb0f3e5_potrace_fc26.nasl 6959 2017-08-18 07:24:59Z asteins $
#
# Fedora Update for potrace FEDORA-2017-44bfb0f3e5
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.873259");
  script_version("$Revision: 6959 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-18 09:24:59 +0200 (Fri, 18 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-13 07:41:24 +0200 (Sun, 13 Aug 2017)");
  script_cve_id("CVE-2017-12067", "CVE-2016-8685", "CVE-2016-8686", "CVE-2016-8694", 
                "CVE-2016-8695", "CVE-2016-8696", "CVE-2016-8697", "CVE-2016-8698", 
                "CVE-2016-8699", "CVE-2016-8700", "CVE-2016-8701", "CVE-2016-8702", 
                "CVE-2016-8703", "CVE-2017-7263");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for potrace FEDORA-2017-44bfb0f3e5");
  script_tag(name: "summary", value: "Check the version of potrace");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Potrace is a utility for tracing a bitmap, 
which means, transforming a bitmap into a smooth, scalable image. The input is 
a bitmap (PBM, PGM, PPM, or BMP format), and the default output is an 
encapsulated PostScript file (EPS). A typical use is to create EPS files from 
scanned data, such as company or university logos, handwritten notes, etc. 
The resulting image is not 'jaggy' like a bitmap, but smooth. It can then be 
rendered at any resolution.

Potrace can currently produce the following output formats: EPS, PostScript,
PDF, SVG (scalable vector graphics), Xfig, Gimppath, and PGM (for easy
antialiasing). Additional backends might be added in the future.

Mkbitmap is a program distributed with Potrace which can be used to pre-process
the input for better tracing behavior on greyscale and color images.
");
  script_tag(name: "affected", value: "potrace on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-44bfb0f3e5");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PG4MCYIFDHYLJGKJFKDL3GEYN52V5EOM");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"potrace", rpm:"potrace~1.15~1.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}