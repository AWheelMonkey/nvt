###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for t1lib RHSA-2012:0062-01
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

tag_insight = "The t1lib library allows you to rasterize bitmaps from PostScript Type 1
  fonts.

  Two heap-based buffer overflow flaws were found in the way t1lib processed
  Adobe Font Metrics (AFM) files. If a specially-crafted font file was opened
  by an application linked against t1lib, it could cause the application to
  crash or, potentially, execute arbitrary code with the privileges of the
  user running the application. (CVE-2010-2642, CVE-2011-0433)

  An invalid pointer dereference flaw was found in t1lib. A specially-crafted
  font file could, when opened, cause an application linked against t1lib to
  crash or, potentially, execute arbitrary code with the privileges of the
  user running the application. (CVE-2011-0764)

  A use-after-free flaw was found in t1lib. A specially-crafted font file
  could, when opened, cause an application linked against t1lib to crash or,
  potentially, execute arbitrary code with the privileges of the user
  running the application. (CVE-2011-1553)

  An off-by-one flaw was found in t1lib. A specially-crafted font file could,
  when opened, cause an application linked against t1lib to crash or,
  potentially, execute arbitrary code with the privileges of the user running
  the application. (CVE-2011-1554)

  An out-of-bounds memory read flaw was found in t1lib. A specially-crafted
  font file could, when opened, cause an application linked against t1lib to
  crash. (CVE-2011-1552)

  Red Hat would like to thank the Evince development team for reporting
  CVE-2010-2642. Upstream acknowledges Jon Larimer of IBM X-Force as the
  original reporter of CVE-2010-2642.

  All users of t1lib are advised to upgrade to these updated packages, which
  contain backported patches to correct these issues. All applications linked
  against t1lib must be restarted for this update to take effect.";

tag_affected = "t1lib on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-January/msg00024.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870644");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:39:02 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2010-2642", "CVE-2011-0433", "CVE-2011-0764",
                "CVE-2011-1552", "CVE-2011-1553", "CVE-2011-1554");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2012:0062-01");
  script_name("RedHat Update for t1lib RHSA-2012:0062-01");

  script_tag(name: "summary" , value: "Check for the Version of t1lib");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"t1lib", rpm:"t1lib~5.1.2~6.el6_2.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"t1lib-debuginfo", rpm:"t1lib-debuginfo~5.1.2~6.el6_2.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
