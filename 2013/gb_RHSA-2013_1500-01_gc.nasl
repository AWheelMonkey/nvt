###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for gc RHSA-2013:1500-01
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871068");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-11-08 10:42:36 +0530 (Fri, 08 Nov 2013)");
  script_cve_id("CVE-2012-2673");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_name("RedHat Update for gc RHSA-2013:1500-01");


  script_tag(name:"affected", value:"gc on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"insight", value:"gc is a Boehm-Demers-Weiser conservative garbage collector for C and C++.

It was discovered that gc's implementation of the malloc() and calloc()
routines did not properly perform parameter sanitization when allocating
memory. If an application using gc did not implement application-level
validity checks for the malloc() and calloc() routines, a remote attacker
could provide specially crafted application-specific input, which, when
processed by the application, could lead to an application crash or,
potentially, arbitrary code execution with the privileges of the user
running the application. (CVE-2012-2673)

Users of gc are advised to upgrade to these updated packages, which contain
backported patches to correct this issue. Applications using gc must be
restarted for the update to take effect.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"RHSA", value:"2013:1500-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2013-November/msg00000.html");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'gc'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"gc", rpm:"gc~7.1~12.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gc-debuginfo", rpm:"gc-debuginfo~7.1~12.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
