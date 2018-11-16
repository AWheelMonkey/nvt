###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for setroubleshoot and setroubleshoot-plugins RHSA-2016:1293-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871632");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-06-24 05:25:28 +0200 (Fri, 24 Jun 2016)");
  script_cve_id("CVE-2016-4444", "CVE-2016-4446", "CVE-2016-4989");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for setroubleshoot and setroubleshoot-plugins RHSA-2016:1293-01");
  script_tag(name: "summary", value: "Check the version of setroubleshoot and setroubleshoot-plugins");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The setroubleshoot packages provide tools
to help diagnose SELinux problems. When Access Vector Cache (AVC) messages are
returned, an alert can be generated that provides information about the problem
and helps to track its resolution.

The setroubleshoot-plugins package provides a set of analysis plugins for
use with setroubleshoot. Each plugin has the capacity to analyze SELinux
AVC data and system data to provide user friendly reports describing how to
interpret SELinux AVC denials.

Security Fix(es):

* Shell command injection flaws were found in the way the setroubleshoot
executed external commands. A local attacker able to trigger certain
SELinux denials could use these flaws to execute arbitrary code with
privileges of the setroubleshoot user. (CVE-2016-4989)

* Shell command injection flaws were found in the way the setroubleshoot
allow_execmod and allow_execstack plugins executed external commands. A
local attacker able to trigger an execmod or execstack SELinux denial could
use these flaws to execute arbitrary code with privileges of the
setroubleshoot user. (CVE-2016-4444, CVE-2016-4446)

The CVE-2016-4444 and CVE-2016-4446 issues were discovered by Milos Malik
(Red Hat) and the CVE-2016-4989 issue was discovered by Red Hat Product
Security.

Note: On Red Hat Enterprise Linux 7.0 and 7.1, the setroubleshoot is run
with root privileges. Therefore, these issues could allow an attacker to
execute arbitrary code with root privileges.
");
  script_tag(name: "affected", value: "setroubleshoot and setroubleshoot-plugins
  on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2016:1293-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2016-June/msg00023.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"setroubleshoot-plugins", rpm:"setroubleshoot-plugins~3.0.59~2.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"setroubleshoot", rpm:"setroubleshoot~3.2.24~4.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"setroubleshoot-debuginfo", rpm:"setroubleshoot-debuginfo~3.2.24~4.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"setroubleshoot-server", rpm:"setroubleshoot-server~3.2.24~4.el7_2", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
