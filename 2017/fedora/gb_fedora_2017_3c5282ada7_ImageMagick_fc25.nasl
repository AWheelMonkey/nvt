###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_3c5282ada7_ImageMagick_fc25.nasl 7599 2017-10-30 09:14:28Z santu $
#
# Fedora Update for ImageMagick FEDORA-2017-3c5282ada7
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
  script_oid("1.3.6.1.4.1.25623.1.0.873523");
  script_version("$Revision: 7599 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-30 10:14:28 +0100 (Mon, 30 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-25 15:35:32 +0200 (Wed, 25 Oct 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for ImageMagick FEDORA-2017-3c5282ada7");
  script_tag(name: "summary", value: "Check the version of ImageMagick");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "ImageMagick is an image display and 
manipulation tool for the X Window System. ImageMagick can read and write JPEG, 
TIFF, PNM, GIF, and Photo CD image formats. It can resize, rotate, sharpen, color
reduce, or add special effects to an image, and when finished you can either save 
the completed work in the original format or a different one. ImageMagick also 
includes command line programs for creating animated or transparent .gifs, 
creating composite images, creating thumbnail images, and more.

ImageMagick is one of your choices if you need a program to manipulate
and display images. If you want to develop your own applications
which use ImageMagick code or APIs, you need to install
ImageMagick-devel as well.
");
  script_tag(name: "affected", value: "ImageMagick on Fedora 25");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-3c5282ada7");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3NBNRF42RM5ZTU62K3VRVCDI55CPK3MC");
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

if(release == "FC25")
{

  if ((res = isrpmvuln(pkg:"ImageMagick", rpm:"ImageMagick~6.9.9.19~1.fc25", rls:"FC25")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
