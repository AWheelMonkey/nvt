###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for mod_nss RHSA-2013:1779-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871089");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-12-04 10:07:26 +0530 (Wed, 04 Dec 2013)");
  script_cve_id("CVE-2013-4566");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:N");
  script_name("RedHat Update for mod_nss RHSA-2013:1779-01");


  script_tag(name:"affected", value:"mod_nss on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"insight", value:"The mod_nss module provides strong cryptography for the Apache HTTP Server
via the Secure Sockets Layer (SSL) and Transport Layer Security (TLS)
protocols, using the Network Security Services (NSS) security library.

A flaw was found in the way mod_nss handled the NSSVerifyClient setting for
the per-directory context. When configured to not require a client
certificate for the initial connection and only require it for a specific
directory, mod_nss failed to enforce this requirement and allowed a client
to access the directory when no valid client certificate was provided.
(CVE-2013-4566)

Red Hat would like to thank Albert Smith of OUSD(AT&amp L) for reporting this
issue.

All mod_nss users should upgrade to this updated package, which contains a
backported patch to correct this issue. The httpd service must be restarted
for this update to take effect.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"RHSA", value:"2013:1779-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2013-December/msg00001.html");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'mod_nss'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(6|5)");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"mod_nss", rpm:"mod_nss~1.0.8~19.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mod_nss-debuginfo", rpm:"mod_nss-debuginfo~1.0.8~19.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"mod_nss", rpm:"mod_nss~1.0.8~8.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mod_nss-debuginfo", rpm:"mod_nss-debuginfo~1.0.8~8.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
