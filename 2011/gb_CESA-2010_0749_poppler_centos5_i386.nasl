###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for poppler CESA-2010:0749 centos5 i386
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
tag_insight = "Poppler is a Portable Document Format (PDF) rendering library, used by
  applications such as Evince.

  An uninitialized pointer use flaw was discovered in poppler. An attacker
  could create a malicious PDF file that, when opened, would cause
  applications that use poppler (such as Evince) to crash or, potentially,
  execute arbitrary code. (CVE-2010-3702)
  
  An array index error was found in the way poppler parsed PostScript Type 1
  fonts embedded in PDF documents. An attacker could create a malicious PDF
  file that, when opened, would cause applications that use poppler (such as
  Evince) to crash or, potentially, execute arbitrary code. (CVE-2010-3704)
  
  Users are advised to upgrade to these updated packages, which contain
  backported patches to correct these issues.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "poppler on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2010-October/017056.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880575");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2010:0749");
  script_cve_id("CVE-2010-3702", "CVE-2010-3704");
  script_name("CentOS Update for poppler CESA-2010:0749 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of poppler");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"poppler", rpm:"poppler~0.5.4~4.4.el5_5.14", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"poppler-devel", rpm:"poppler-devel~0.5.4~4.4.el5_5.14", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"poppler-utils", rpm:"poppler-utils~0.5.4~4.4.el5_5.14", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
