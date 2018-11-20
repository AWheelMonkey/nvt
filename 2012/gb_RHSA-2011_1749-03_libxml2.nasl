###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for libxml2 RHSA-2011:1749-03
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
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2011-December/msg00018.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870741");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:58:40 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2010-4008", "CVE-2010-4494", "CVE-2011-0216",
                "CVE-2011-1944", "CVE-2011-2821", "CVE-2011-2834");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"RHSA", value:"2011:1749-03");
  script_name("RedHat Update for libxml2 RHSA-2011:1749-03");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libxml2'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name:"affected", value:"libxml2 on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"The libxml2 library is a development toolbox providing the implementation
  of various XML standards. One of those standards is the XML Path Language
  (XPath), which is a language for addressing parts of an XML document.

  An off-by-one error, leading to a heap-based buffer overflow, was found in
  the way libxml2 parsed certain XML files. A remote attacker could provide
  a specially-crafted XML file that, when opened in an application linked
  against libxml2, would cause the application to crash or, potentially,
  execute arbitrary code with the privileges of the user running the
  application. (CVE-2011-0216)

  An integer overflow flaw, leading to a heap-based buffer overflow, was
  found in the way libxml2 parsed certain XPath expressions. If an attacker
  were able to supply a specially-crafted XML file to an application using
  libxml2, as well as an XPath expression for that application to run against
  the crafted file, it could cause the application to crash or, possibly,
  execute arbitrary code. (CVE-2011-1944)

  Multiple flaws were found in the way libxml2 parsed certain XPath
  expressions. If an attacker were able to supply a specially-crafted XML
  file to an application using libxml2, as well as an XPath expression for
  that application to run against the crafted file, it could cause the
  application to crash. (CVE-2010-4008, CVE-2010-4494, CVE-2011-2821,
  CVE-2011-2834)

  Note: Red Hat does not ship any applications that use libxml2 in a way that
  would allow the CVE-2011-1944, CVE-2010-4008, CVE-2010-4494, CVE-2011-2821,
  and CVE-2011-2834 flaws to be exploited; however, third-party applications
  may allow XPath expressions to be passed which could trigger these flaws.

  Red Hat would like to thank the Google Security Team for reporting the
  CVE-2010-4008 issue. Upstream acknowledges Bui Quang Minh from Bkis as the
  original reporter of CVE-2010-4008.

  This update also fixes the following bugs:

  * A number of patches have been applied to harden the XPath processing code
  in libxml2, such as fixing memory leaks, rounding errors, XPath numbers
  evaluations, and a potential error in encoding conversion. (BZ#732335)

  All users of libxml2 are advised to upgrade to these updated packages,
  which contain backported patches to correct these issues. The desktop must
  be restarted (log out, then log back in) for this update to take effect.");
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

  if ((res = isrpmvuln(pkg:"libxml2", rpm:"libxml2~2.7.6~4.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-debuginfo", rpm:"libxml2-debuginfo~2.7.6~4.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-devel", rpm:"libxml2-devel~2.7.6~4.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-python", rpm:"libxml2-python~2.7.6~4.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
