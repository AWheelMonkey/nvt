###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for realmd RHSA-2015:2184-07
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
  script_oid("1.3.6.1.4.1.25623.1.0.871476");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-11-20 06:19:47 +0100 (Fri, 20 Nov 2015)");
  script_cve_id("CVE-2015-2704");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for realmd RHSA-2015:2184-07");
  script_tag(name: "summary", value: "Check the version of realmd");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The realmd DBus system service manages
discovery of and enrollment in realms and domains, such as Active Directory or
Identity Management (IdM). The realmd service detects available domains,
automatically configures the system, and joins it as an account to a domain.

A flaw was found in the way realmd parsed certain input when writing
configuration into the sssd.conf or smb.conf file. A remote attacker could
use this flaw to inject arbitrary configurations into these files via a
newline character in an LDAP response. (CVE-2015-2704)

It was found that the realm client would try to automatically join an
active directory domain without authentication, which could potentially
lead to privilege escalation within a specified domain. (BZ#1205751)

The realmd packages have been upgraded to upstream version 0.16.1, which
provides a number of bug fixes and enhancements over the previous version.
(BZ#1174911)

This update also fixes the following bugs:

* Joining a Red Hat Enterprise Linux machine to a domain using the realm
utility creates /home/domainname/[username]/ directories for domain users.
Previously, SELinux labeled the domain users' directories incorrectly. As a
consequence, the domain users sometimes experienced problems with SELinux
policy. This update modifies the realmd service default behavior so that
the domain users' directories are compatible with the standard SELinux
policy. (BZ#1241832)

* Previously, the realm utility was unable to join or discover domains with
domain names containing underscore (_). The realmd service has been
modified to process underscores in domain names correctly, which fixes the
described bug. (BZ#1243771)

In addition, this update adds the following enhancement:

* The realmd utility now allows the user to disable automatic ID mapping
from the command line. To disable the mapping, pass the
'--automatic-id-mapping=no' option to the realmd utility. (BZ#1230941)

All realmd users are advised to upgrade to these updated packages, which
correct these issues and add these enhancements.
");
  script_tag(name: "affected", value: "realmd on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "RHSA", value: "2015:2184-07");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2015-November/msg00030.html");
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

  if ((res = isrpmvuln(pkg:"realmd", rpm:"realmd~0.16.1~5.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"realmd-debuginfo", rpm:"realmd-debuginfo~0.16.1~5.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
