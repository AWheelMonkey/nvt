###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for freetype2 MDVSA-2011:120 (freetype2)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "A vulnerability was discovered and corrected in freetype2:

  Integer signedness error in psaux/t1decode.c in FreeType before 2.4.6,
  allows remote attackers to execute arbitrary code or cause a denial
  of service (memory corruption and application crash) via a crafted
  Type 1 font in a PDF document, as exploited in the wild in July 2011
  (CVE-2011-0226).
  
  Packages for 2009.0 are provided as of the Extended Maintenance
  Program. Please visit this link to learn more:
  http://store.mandriva.com/product_info.php?cPath=149&amp;amp;products_id=490
  
  The updated packages have been patched to correct this issue.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "freetype2 on Mandriva Linux 2009.0,
  Mandriva Linux 2009.0/X86_64,
  Mandriva Linux 2010.1,
  Mandriva Linux 2010.1/X86_64,
  Mandriva Enterprise Server 5,
  Mandriva Enterprise Server 5/X86_64";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.mandriva.com/security-announce/2011-07/msg00009.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831432");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-02 09:08:31 +0200 (Tue, 02 Aug 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "MDVSA", value: "2011:120");
  script_cve_id("CVE-2011-0226");
  script_name("Mandriva Update for freetype2 MDVSA-2011:120 (freetype2)");

  script_tag(name:"summary", value:"Check for the Version of freetype2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "MNDK_mes5")
{

  if ((res = isrpmvuln(pkg:"libfreetype6", rpm:"libfreetype6~2.3.7~1.7mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreetype6-devel", rpm:"libfreetype6-devel~2.3.7~1.7mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreetype6-static-devel", rpm:"libfreetype6-static-devel~2.3.7~1.7mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freetype2", rpm:"freetype2~2.3.7~1.7mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6", rpm:"lib64freetype6~2.3.7~1.7mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6-devel", rpm:"lib64freetype6-devel~2.3.7~1.7mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6-static-devel", rpm:"lib64freetype6-static-devel~2.3.7~1.7mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "MNDK_2010.1")
{

  if ((res = isrpmvuln(pkg:"libfreetype6", rpm:"libfreetype6~2.3.12~1.6mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreetype6-devel", rpm:"libfreetype6-devel~2.3.12~1.6mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreetype6-static-devel", rpm:"libfreetype6-static-devel~2.3.12~1.6mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freetype2", rpm:"freetype2~2.3.12~1.6mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6", rpm:"lib64freetype6~2.3.12~1.6mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6-devel", rpm:"lib64freetype6-devel~2.3.12~1.6mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6-static-devel", rpm:"lib64freetype6-static-devel~2.3.12~1.6mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "MNDK_2009.0")
{

  if ((res = isrpmvuln(pkg:"libfreetype6", rpm:"libfreetype6~2.3.7~1.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreetype6-devel", rpm:"libfreetype6-devel~2.3.7~1.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreetype6-static-devel", rpm:"libfreetype6-static-devel~2.3.7~1.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freetype2", rpm:"freetype2~2.3.7~1.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6", rpm:"lib64freetype6~2.3.7~1.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6-devel", rpm:"lib64freetype6-devel~2.3.7~1.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64freetype6-static-devel", rpm:"lib64freetype6-static-devel~2.3.7~1.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
