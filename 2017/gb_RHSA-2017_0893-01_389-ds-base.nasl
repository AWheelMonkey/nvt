###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for 389-ds-base RHSA-2017:0893-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871793");
  script_version("$Revision: 11151 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-29 05:47:27 +0200 (Wed, 29 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-04-12 06:32:20 +0200 (Wed, 12 Apr 2017)");
  script_cve_id("CVE-2017-2668");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for 389-ds-base RHSA-2017:0893-01");
  script_tag(name: "summary", value: "Check the version of 389-ds-base");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "389 Directory Server is an LDAP version 3
  (LDAPv3) compliant server. The base packages include the Lightweight Directory
  Access Protocol (LDAP) server and command-line utilities for server
  administration.

Security Fix(es):

* An invalid pointer dereference flaw was found in the way 389-ds-base
handled LDAP bind requests. A remote unauthenticated attacker could use
this flaw to make ns-slapd crash via a specially crafted LDAP bind request,
resulting in denial of service. (CVE-2017-2668)

Red Hat would like to thank Joachim Jabs (F24) for reporting this issue.

Bug Fix(es):

* Previously, the 'deref' plug-in failed to dereference attributes that use
distinguished name (DN) syntax, such as 'uniqueMember'. With this patch,
the 'deref' plug-in can dereference such attributes and additionally 'Name
and Optional UID' syntax. As a result, the 'deref' plug-in now supports any
syntax. (BZ#1435365)
");
  script_tag(name: "affected", value: "389-ds-base on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:0893-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-April/msg00015.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.11.15~91.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-debuginfo", rpm:"389-ds-base-debuginfo~1.2.11.15~91.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.11.15~91.el6_9", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
