###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for openjpeg MDVSA-2012:157 (openjpeg)
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
tag_insight = "A security issue was identified and fixed in openjpeg:

  A heap-based buffer overflow was found in the way OpenJPEG, an
  open-source JPEG 2000 codec written in C language, performed parsing
  of JPEG2000 image files. A remote attacker could provide a specially
  crafted JPEG 2000 file, which when opened in an application linked
  against openjpeg would lead to that application crash, or, potentially
  arbitrary code execution with the privileges of the user running the
  application (CVE-2012-3535).

  The updated packages have been patched to correct this issue.";

tag_affected = "openjpeg on Mandriva Linux 2011.0";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://www.mandriva.com/en/support/security/advisories/?name=MDVSA-2012:157");
  script_oid("1.3.6.1.4.1.25623.1.0.831740");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-10-05 09:46:28 +0530 (Fri, 05 Oct 2012)");
  script_cve_id("CVE-2012-3535");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "MDVSA", value: "2012:157");
  script_name("Mandriva Update for openjpeg MDVSA-2012:157 (openjpeg)");

  script_tag(name: "summary" , value: "Check for the Version of openjpeg");
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

  if ((res = isrpmvuln(pkg:"libopenjpeg2", rpm:"libopenjpeg2~1.3~8.2", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenjpeg-devel", rpm:"libopenjpeg-devel~1.3~8.2", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64openjpeg2", rpm:"lib64openjpeg2~1.3~8.2", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64openjpeg-devel", rpm:"lib64openjpeg-devel~1.3~8.2", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
