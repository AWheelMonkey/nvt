###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for exif MDVSA-2012:107 (exif)
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
tag_insight = "A vulnerability has been discovered and corrected in exif:

  An integer overflow in the function jpeg_data_load_data in the exif
  program could cause a data read beyond the end of a buffer, causing
  an application crash or leakage of potentially sensitive information
  when parsing a crafted JPEG file (CVE-2012-2845).

  The updated packages have been upgraded to the 0.6.21 version which
  is not vulnerable to this issue.";

tag_affected = "exif on Mandriva Linux 2011.0,
  Mandriva Enterprise Server 5.2";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://www.mandriva.com/en/support/security/advisories/?name=MDVSA-2012:107");
  script_oid("1.3.6.1.4.1.25623.1.0.831697");
  script_version("$Revision: 8649 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-03 13:16:43 +0100 (Sat, 03 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-07-16 11:57:53 +0530 (Mon, 16 Jul 2012)");
  script_cve_id("CVE-2012-2845");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_xref(name: "MDVSA", value: "2012:107");
  script_name("Mandriva Update for exif MDVSA-2012:107 (exif)");

  script_tag(name: "summary" , value: "Check for the Version of exif");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release");
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

if(release == "MNDK_2011.0")
{

  if ((res = isrpmvuln(pkg:"exif", rpm:"exif~0.6.21~0.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "MNDK_mes5.2")
{

  if ((res = isrpmvuln(pkg:"exif", rpm:"exif~0.6.21~0.1mdvmes5.2", rls:"MNDK_mes5.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
