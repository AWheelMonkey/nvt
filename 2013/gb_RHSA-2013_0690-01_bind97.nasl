###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for bind97 RHSA-2013:0690-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_insight = "The Berkeley Internet Name Domain (BIND) is an implementation of the
  Domain Name System (DNS) protocols. BIND includes a DNS server (named); a
  resolver library (routines for applications to use when interfacing with
  DNS); and tools for verifying that the DNS server is operating correctly.

  A denial of service flaw was found in the libdns library. A remote attacker
  could use this flaw to send a specially-crafted DNS query to named that,
  when processed, would cause named to use an excessive amount of memory, or
  possibly crash. (CVE-2013-2266)

  Note: This update disables the syntax checking of NAPTR (Naming Authority
  Pointer) resource records.

  All bind97 users are advised to upgrade to these updated packages, which
  contain a patch to correct this issue. After installing the update, the
  BIND daemon (named) will be restarted automatically.";


tag_solution = "Please Install the Updated Packages.";
tag_affected = "bind97 on Red Hat Enterprise Linux (v. 5 server)";




if(description)
{
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2013-March/msg00075.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870973");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-04-02 12:26:22 +0530 (Tue, 02 Apr 2013)");
  script_cve_id("CVE-2013-2266");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2013:0690-01");
  script_name("RedHat Update for bind97 RHSA-2013:0690-01");

  script_tag(name: "summary" , value: "Check for the Version of bind97");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"bind97", rpm:"bind97~9.7.0~17.P2.el5_9.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-chroot", rpm:"bind97-chroot~9.7.0~17.P2.el5_9.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-debuginfo", rpm:"bind97-debuginfo~9.7.0~17.P2.el5_9.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-devel", rpm:"bind97-devel~9.7.0~17.P2.el5_9.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-libs", rpm:"bind97-libs~9.7.0~17.P2.el5_9.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bind97-utils", rpm:"bind97-utils~9.7.0~17.P2.el5_9.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
