###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for ImageMagick FEDORA-2012-11746
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "ImageMagick is an image display and manipulation tool for the X
  Window System. ImageMagick can read and write JPEG, TIFF, PNM, GIF,
  and Photo CD image formats. It can resize, rotate, sharpen, color
  reduce, or add special effects to an image, and when finished you can
  either save the completed work in the original format or a different
  one. ImageMagick also includes command line programs for creating
  animated or transparent .gifs, creating composite images, creating
  thumbnail images, and more.

  ImageMagick is one of your choices if you need a program to manipulate
  and display images. If you want to develop your own applications
  which use ImageMagick code or APIs, you need to install
  ImageMagick-devel as well.";

tag_affected = "ImageMagick on Fedora 16";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-August/085670.html");
  script_oid("1.3.6.1.4.1.25623.1.0.864655");
  script_version("$Revision: 8649 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-03 13:16:43 +0100 (Sat, 03 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-08-30 10:24:23 +0530 (Thu, 30 Aug 2012)");
  script_cve_id("CVE-2012-3437", "CVE-2012-0259", "CVE-2012-1620");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_xref(name: "FEDORA", value: "2012-11746");
  script_name("Fedora Update for ImageMagick FEDORA-2012-11746");

  script_tag(name: "summary" , value: "Check for the Version of ImageMagick");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"ImageMagick", rpm:"ImageMagick~6.7.0.10~6.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
