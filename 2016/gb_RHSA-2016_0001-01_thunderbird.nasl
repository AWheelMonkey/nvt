###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for thunderbird RHSA-2016:0001-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871531");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-01-06 06:22:31 +0100 (Wed, 06 Jan 2016)");
  script_cve_id("CVE-2015-7201", "CVE-2015-7205", "CVE-2015-7212", "CVE-2015-7213",
                "CVE-2015-7214");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for thunderbird RHSA-2016:0001-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'thunderbird'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Mozilla Thunderbird is a standalone mail
and newsgroup client.

Several flaws were found in the processing of malformed web content. A web
page containing malicious content could cause Thunderbird to crash or,
potentially, execute arbitrary code with the privileges of the user running
Thunderbird. (CVE-2015-7201, CVE-2015-7205, CVE-2015-7212, CVE-2015-7213)

A flaw was found in the way Thunderbird handled content using the 'data:'
and 'view-source:' URIs. An attacker could use this flaw to bypass the
same-origin policy and read data from cross-site URLs and local files.
(CVE-2015-7214)

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Andrei Vaida, Jesse Ruderman, Bob Clary, Abhishek
Arya, Ronald Crane, and Tsubasa Iinuma as the original reporters of these
issues.

For technical details regarding these flaws, refer to the Mozilla security
advisories for Thunderbird 38.5.0. You can find a link to the Mozilla
advisories in the References section of this erratum.

All Thunderbird users should upgrade to this updated package, which
contains Thunderbird version 38.5.0, which corrects these issues. After
installing the update, Thunderbird must be restarted for the changes to
take effect.");
  script_tag(name:"affected", value:"thunderbird on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"RHSA", value:"2016:0001-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2016-January/msg00000.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~38.5.0~1.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"thunderbird-debuginfo", rpm:"thunderbird-debuginfo~38.5.0~1.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
