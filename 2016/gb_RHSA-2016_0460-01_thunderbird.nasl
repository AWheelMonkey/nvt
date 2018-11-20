###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for thunderbird RHSA-2016:0460-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871578");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-03-17 05:09:13 +0100 (Thu, 17 Mar 2016)");
  script_cve_id("CVE-2016-1952", "CVE-2016-1954", "CVE-2016-1957", "CVE-2016-1960",
                "CVE-2016-1961", "CVE-2016-1964", "CVE-2016-1966", "CVE-2016-1974",
                "CVE-2016-1977", "CVE-2016-2790", "CVE-2016-2791", "CVE-2016-2792",
                "CVE-2016-2793", "CVE-2016-2794", "CVE-2016-2795", "CVE-2016-2796",
                "CVE-2016-2797", "CVE-2016-2798", "CVE-2016-2799", "CVE-2016-2800",
                "CVE-2016-2801", "CVE-2016-2802");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for thunderbird RHSA-2016:0460-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'thunderbird'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Mozilla Thunderbird is a standalone mail
and newsgroup client.

Several flaws were found in the processing of malformed web content. A web
page containing malicious content could cause Thunderbird to crash or,
potentially, execute arbitrary code with the privileges of the user running
Thunderbird. (CVE-2016-1952, CVE-2016-1954, CVE-2016-1957, CVE-2016-1960,
CVE-2016-1961, CVE-2016-1974, CVE-2016-1964, CVE-2016-1966)

Multiple security flaws were found in the graphite2 font library shipped
with Thunderbird. A web page containing malicious content could cause
Thunderbird to crash or, potentially, execute arbitrary code with the
privileges of the user running Thunderbird. (CVE-2016-1977, CVE-2016-2790,
CVE-2016-2791, CVE-2016-2792, CVE-2016-2793, CVE-2016-2794, CVE-2016-2795,
CVE-2016-2796, CVE-2016-2797, CVE-2016-2798, CVE-2016-2799, CVE-2016-2800,
CVE-2016-2801, CVE-2016-2802)

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Bob Clary, Christoph Diehl, Christian Holler, Andrew
McCreight, Daniel Holbert, Jesse Ruderman, Randell Jesup, Nicolas
Golubovic, Jose Martinez, Romina Santillan, ca0nguyen, lokihardt, Nicolas
Grgoire, the Communications Electronics Security Group (UK) of the GCHQ,
Holger Fuhrmannek, Ronald Crane, and Tyson Smith as the original reporters
of these issues.

For technical details regarding these flaws, refer to the Mozilla security
advisories for Thunderbird 38.7.0. You can find a link to the Mozilla
advisories in the References section of this erratum.

All Thunderbird users should upgrade to this updated package, which
contains Thunderbird version 38.7.0, which corrects these issues. After
installing the update, Thunderbird must be restarted for the changes to
take effect.");
  script_tag(name:"affected", value:"thunderbird on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2016:0460-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2016-March/msg00051.html");
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

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~38.7.0~1.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"thunderbird-debuginfo", rpm:"thunderbird-debuginfo~38.7.0~1.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
