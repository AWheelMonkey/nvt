###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_267f37c544_mupdf_fc26.nasl 7990 2017-12-05 07:08:14Z asteins $
#
# Fedora Update for mupdf FEDORA-2017-267f37c544
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
  script_oid("1.3.6.1.4.1.25623.1.0.873845");
  script_version("$Revision: 7990 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-05 08:08:14 +0100 (Tue, 05 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-04 18:48:28 +0530 (Mon, 04 Dec 2017)");
  script_cve_id("CVE-2017-15369", "CVE-2017-15587", "CVE-2017-9216", "CVE-2017-14685", 
                "CVE-2017-14686", "CVE-2017-14687");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mupdf FEDORA-2017-267f37c544");
  script_tag(name: "summary", value: "Check the version of mupdf");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "MuPDF is a lightweight PDF viewer and 
toolkit written in portable C. The renderer in MuPDF is tailored for high quality 
anti-aliased graphics.  MuPDF renders text with metrics and spacing accurate to
within fractions of a pixel for the highest fidelity in reproducing the look of 
a printed page on screen. MuPDF has a small footprint.  A binary that includes 
the standard Roman fonts is only one megabyte.  A build with full CJK support
(including an Asian font) is approximately five megabytes. MuPDF has support for 
all non-interactive PDF 1.7 features, and the toolkit provides a simple API for 
accessing the internal structures of the PDF document.  Example code for 
navigating interactive links and bookmarks, encrypting PDF files, extracting 
fonts, images, and searchable text, and rendering pages to image files is 
provided.");
  script_tag(name: "affected", value: "mupdf on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-267f37c544");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/AQRFAXR4UENWY7BRI3YVC22A3YRABTNP");
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

  if ((res = isrpmvuln(pkg:"mupdf", rpm:"mupdf~1.11~9.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
