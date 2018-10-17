###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for mod_nss CESA-2013:1779 centos6 
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881829");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-12-04 10:11:34 +0530 (Wed, 04 Dec 2013)");
  script_cve_id("CVE-2013-4566");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:N");
  script_name("CentOS Update for mod_nss CESA-2013:1779 centos6 ");

  tag_insight = "The mod_nss module provides strong cryptography for the Apache HTTP Server
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
for this update to take effect.
";

  tag_affected = "mod_nss on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2013:1779");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-December/020033.html");
  script_tag(name: "summary" , value: "Check for the Version of mod_nss");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"mod_nss", rpm:"mod_nss~1.0.8~19.el6_5", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
