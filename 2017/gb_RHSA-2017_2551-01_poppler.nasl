###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_2551-01_poppler.nasl 12370 2018-11-16 07:56:29Z cfischer $
#
# RedHat Update for poppler RHSA-2017:2551-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.811723");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-08-31 07:45:16 +0200 (Thu, 31 Aug 2017)");
  script_cve_id("CVE-2017-9775", "CVE-2017-9776");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for poppler RHSA-2017:2551-01");
  script_tag(name: "summary", value: "Check the version of poppler");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Poppler is a Portable Document Format (PDF)
rendering library, used by applications such as Evince.

Security Fix(es):

* A stack-based buffer overflow was found in the poppler library. An
attacker could create a malicious PDF file that would cause applications
that use poppler (such as Evince) to crash, or potentially execute
arbitrary code when opened. (CVE-2017-9775)

* An integer overflow leading to heap-based buffer overflow was found in
the poppler library. An attacker could create a malicious PDF file that
would cause applications that use poppler (such as Evince) to crash, or
potentially execute arbitrary code when opened. (CVE-2017-9776)
");
  script_tag(name: "affected", value: "poppler on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:2551-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-August/msg00083.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"poppler", rpm:"poppler~0.26.5~17.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"poppler-debuginfo", rpm:"poppler-debuginfo~0.26.5~17.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"poppler-glib", rpm:"poppler-glib~0.26.5~17.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"poppler-qt", rpm:"poppler-qt~0.26.5~17.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"poppler-utils", rpm:"poppler-utils~0.26.5~17.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
