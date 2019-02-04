###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for mod_auth_mellon RHSA-2014:1803-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871286");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-11-06 06:18:37 +0100 (Thu, 06 Nov 2014)");
  script_cve_id("CVE-2014-8566", "CVE-2014-8567");
  script_tag(name:"cvss_base", value:"9.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:C/A:C");
  script_name("RedHat Update for mod_auth_mellon RHSA-2014:1803-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'mod_auth_mellon'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"mod_auth_mellon provides a SAML 2.0 authentication module for the Apache
HTTP Server.

An information disclosure flaw was found in mod_auth_mellon's session
handling that could lead to sessions overlapping in memory. A remote
attacker could potentially use this flaw to obtain data from another user's
session. (CVE-2014-8566)

It was found that uninitialized data could be read when processing a user's
logout request. By attempting to log out, a user could possibly cause the
Apache HTTP Server to crash. (CVE-2014-8567)

Red Hat would like to thank the mod_auth_mellon team for reporting these
issues. Upstream acknowledges Matthew Slowe as the original reporter of
CVE-2014-8566.

All users of mod_auth_mellon are advised to upgrade to this updated
package, which contains a backported patch to correct these issues.");
  script_tag(name:"affected", value:"mod_auth_mellon on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"RHSA", value:"2014:1803-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2014-November/msg00013.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"mod_auth_mellon", rpm:"mod_auth_mellon~0.8.0~3.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mod_auth_mellon-debuginfo", rpm:"mod_auth_mellon-debuginfo~0.8.0~3.el6_6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}