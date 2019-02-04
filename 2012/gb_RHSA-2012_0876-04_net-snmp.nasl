###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for net-snmp RHSA-2012:0876-04
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

if(description)
{
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2012-June/msg00031.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870759");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:P");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-06-22 10:25:43 +0530 (Fri, 22 Jun 2012)");
  script_cve_id("CVE-2012-2141");
  script_xref(name:"RHSA", value:"2012:0876-04");
  script_name("RedHat Update for net-snmp RHSA-2012:0876-04");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'net-snmp'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name:"affected", value:"net-snmp on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"The net-snmp packages provide various libraries and tools for the Simple
  Network Management Protocol (SNMP), including an SNMP library, an
  extensible agent, tools for requesting or setting information from SNMP
  agents, tools for generating and handling SNMP traps, a version of the
  netstat command which uses SNMP, and a Tk/Perl Management Information Base
  (MIB) browser.

  An array index error, leading to an out-of-bounds buffer read flaw, was
  found in the way the net-snmp agent looked up entries in the extension
  table. A remote attacker with read privileges to a Management Information
  Base (MIB) subtree handled by the 'extend' directive (in
  '/etc/snmp/snmpd.conf') could use this flaw to crash snmpd via a crafted
  SNMP GET request. (CVE-2012-2141)

  These updated net-snmp packages also include numerous bug fixes. Space
  precludes documenting all of these changes in this advisory. Users are
  directed to the Red Hat Enterprise Linux 6.3 Technical Notes for
  information on the most significant of these changes.

  All users of net-snmp are advised to upgrade to these updated packages,
  which contain backported patches to resolve these issues. After installing
  the update, the snmpd and snmptrapd daemons will be restarted
  automatically.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"net-snmp", rpm:"net-snmp~5.5~41.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-debuginfo", rpm:"net-snmp-debuginfo~5.5~41.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-devel", rpm:"net-snmp-devel~5.5~41.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-libs", rpm:"net-snmp-libs~5.5~41.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-perl", rpm:"net-snmp-perl~5.5~41.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-python", rpm:"net-snmp-python~5.5~41.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-utils", rpm:"net-snmp-utils~5.5~41.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
