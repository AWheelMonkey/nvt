###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for frysk RHSA-2011:1327-01
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

if(description)
{
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2011-September/msg00039.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870488");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_xref(name:"RHSA", value:"2011:1327-01");
  script_cve_id("CVE-2011-3193");
  script_name("RedHat Update for frysk RHSA-2011:1327-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'frysk'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_4");
  script_tag(name:"affected", value:"frysk on Red Hat Enterprise Linux AS version 4,
  Red Hat Enterprise Linux ES version 4,
  Red Hat Enterprise Linux WS version 4");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"frysk is an execution-analysis technology implemented using native Java and
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
  applications must be restarted for this update to take effect.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_4")
{

  if ((res = isrpmvuln(pkg:"frysk", rpm:"frysk~0.0.1.2007.08.03~8.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"frysk-debuginfo", rpm:"frysk-debuginfo~0.0.1.2007.08.03~8.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
