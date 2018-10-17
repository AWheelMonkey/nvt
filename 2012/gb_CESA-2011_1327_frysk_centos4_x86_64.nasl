###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for frysk CESA-2011:1327 centos4 x86_64
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
tag_insight = "frysk is an execution-analysis technology implemented using native Java and
  C++. It provides developers and system administrators with the ability to
  examine and analyze multi-host, multi-process, and multithreaded systems
  while they are running. frysk is released as a Technology Preview for Red
  Hat Enterprise Linux 4.

  A buffer overflow flaw was found in HarfBuzz, an OpenType text shaping
  engine used in the embedded Pango library. If a frysk application were used
  to debug or trace a process that uses HarfBuzz while it loaded a
  specially-crafted font file, it could cause the application to crash or,
  possibly, execute arbitrary code with the privileges of the user running
  the application. (CVE-2011-3193)
  
  Users of frysk are advised to upgrade to this updated package, which
  contains a backported patch to correct this issue. All running frysk
  applications must be restarted for this update to take effect.";

tag_affected = "frysk on CentOS 4";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-September/018073.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881297");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:19:36 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-3193");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:1327");
  script_name("CentOS Update for frysk CESA-2011:1327 centos4 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of frysk");
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

  if ((res = isrpmvuln(pkg:"frysk", rpm:"frysk~0.0.1.2007.08.03~8.el4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
