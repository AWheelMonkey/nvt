###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for cvs RHSA-2012:0321-01
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

tag_insight = "Concurrent Version System (CVS) is a version control system that can record
  the history of your files.

  A heap-based buffer overflow flaw was found in the way the CVS client
  handled responses from HTTP proxies. A malicious HTTP proxy could use this
  flaw to cause the CVS client to crash or, possibly, execute arbitrary code
  with the privileges of the user running the CVS client. (CVE-2012-0804)

  All users of cvs are advised to upgrade to these updated packages, which
  contain a patch to correct this issue.";

tag_affected = "cvs on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-February/msg00061.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870572");
  script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-02-27 11:17:18 +0530 (Mon, 27 Feb 2012)");
  script_cve_id("CVE-2012-0804");
  script_xref(name: "RHSA", value: "2012:0321-01");
  script_name("RedHat Update for cvs RHSA-2012:0321-01");

  script_tag(name: "summary" , value: "Check for the Version of cvs");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"cvs", rpm:"cvs~1.11.22~11.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"cvs-debuginfo", rpm:"cvs-debuginfo~1.11.22~11.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"cvs-inetd", rpm:"cvs-inetd~1.11.22~11.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
