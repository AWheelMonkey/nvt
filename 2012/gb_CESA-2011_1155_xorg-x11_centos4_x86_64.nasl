###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for xorg-x11 CESA-2011:1155 centos4 x86_64
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
tag_insight = "X.Org is an open source implementation of the X Window System. It provides
  the basic low-level functionality that full-fledged graphical user
  interfaces are designed upon. These xorg-x11 packages also provide the
  X.Org libXfont runtime library.

  A buffer overflow flaw was found in the way the libXfont library, used by
  the X.Org server, handled malformed font files compressed using UNIX
  compress. A malicious, local user could exploit this issue to potentially
  execute arbitrary code with the privileges of the X.Org server.
  (CVE-2011-2895)
  
  Users of xorg-x11 should upgrade to these updated packages, which contain
  a backported patch to resolve this issue. All running X.Org server
  instances must be restarted for the update to take effect.";

tag_affected = "xorg-x11 on CentOS 4";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-August/017662.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881395");
  script_version("$Revision: 8671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-05 17:38:48 +0100 (Mon, 05 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:43:06 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-2895");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:1155");
  script_name("CentOS Update for xorg-x11 CESA-2011:1155 centos4 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of xorg-x11");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"xorg-x11", rpm:"xorg-x11~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-deprecated-libs", rpm:"xorg-x11-deprecated-libs~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-deprecated-libs-devel", rpm:"xorg-x11-deprecated-libs-devel~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-devel", rpm:"xorg-x11-devel~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-doc", rpm:"xorg-x11-doc~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-font-utils", rpm:"xorg-x11-font-utils~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-libs", rpm:"xorg-x11-libs~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-Mesa-libGL", rpm:"xorg-x11-Mesa-libGL~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-Mesa-libGLU", rpm:"xorg-x11-Mesa-libGLU~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-sdk", rpm:"xorg-x11-sdk~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-tools", rpm:"xorg-x11-tools~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-twm", rpm:"xorg-x11-twm~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-xauth", rpm:"xorg-x11-xauth~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-xdm", rpm:"xorg-x11-xdm~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-Xdmx", rpm:"xorg-x11-Xdmx~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-xfs", rpm:"xorg-x11-xfs~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-Xnest", rpm:"xorg-x11-Xnest~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xorg-x11-Xvfb", rpm:"xorg-x11-Xvfb~6.8.2~1.EL.69", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
