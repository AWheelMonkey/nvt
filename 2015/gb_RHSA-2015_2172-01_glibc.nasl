###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for glibc RHSA-2015:2172-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871484");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-11-20 06:20:10 +0100 (Fri, 20 Nov 2015)");
  script_cve_id("CVE-2015-5277");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for glibc RHSA-2015:2172-01");
  script_tag(name: "summary", value: "Check the version of glibc");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The glibc packages provide the standard C
libraries (libc), POSIX thread libraries (libpthread), standard math libraries
(libm), and the Name Server Caching Daemon (nscd) used by multiple programs on
the system. Without these libraries, the Linux system cannot function correctly.

It was discovered that the nss_files backend for the Name Service Switch in
glibc would return incorrect data to applications or corrupt the heap
(depending on adjacent heap contents) in certain cases. A local attacker
could potentially use this flaw to escalate their privileges.
(CVE-2015-5277)

This issue was discovered by Sumit Bose and Luk Slebodnk of Red Hat.

All glibc users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue.
");
  script_tag(name: "affected", value: "glibc on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "RHSA", value: "2015:2172-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2015-November/msg00050.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"glibc", rpm:"glibc~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-common", rpm:"glibc-common~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-debuginfo", rpm:"glibc-debuginfo~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-debuginfo-common", rpm:"glibc-debuginfo-common~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-devel", rpm:"glibc-devel~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-headers", rpm:"glibc-headers~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils", rpm:"glibc-utils~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nscd", rpm:"nscd~2.17~106.el7_2.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
