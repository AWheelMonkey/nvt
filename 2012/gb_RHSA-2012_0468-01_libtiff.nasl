###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for libtiff RHSA-2012:0468-01
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
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2012-April/msg00005.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870582");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-04-11 10:59:25 +0530 (Wed, 11 Apr 2012)");
  script_cve_id("CVE-2012-1173");
  script_xref(name:"RHSA", value:"2012:0468-01");
  script_name("RedHat Update for libtiff RHSA-2012:0468-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libtiff'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");
  script_tag(name:"affected", value:"libtiff on Red Hat Enterprise Linux (v. 5 server)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"The libtiff packages contain a library of functions for manipulating Tagged
  Image File Format (TIFF) files.

  Two integer overflow flaws, leading to heap-based buffer overflows, were
  found in the way libtiff attempted to allocate space for a tile in a TIFF
  image file. An attacker could use these flaws to create a specially-crafted
  TIFF file that, when opened, would cause an application linked against
  libtiff to crash or, possibly, execute arbitrary code. (CVE-2012-1173)

  All libtiff users should upgrade to these updated packages, which contain a
  backported patch to resolve these issues. All running applications linked
  against libtiff must be restarted for this update to take effect.");
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

  if ((res = isrpmvuln(pkg:"libtiff", rpm:"libtiff~3.8.2~14.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libtiff-debuginfo", rpm:"libtiff-debuginfo~3.8.2~14.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libtiff-devel", rpm:"libtiff-devel~3.8.2~14.el5_8", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
