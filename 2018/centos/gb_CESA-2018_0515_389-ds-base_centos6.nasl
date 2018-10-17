###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_0515_389-ds-base_centos6.nasl 9271 2018-03-31 07:25:25Z cfischer $
#
# CentOS Update for 389-ds-base CESA-2018:0515 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882859");
  script_version("$Revision: 9271 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-31 09:25:25 +0200 (Sat, 31 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-15 08:47:16 +0100 (Thu, 15 Mar 2018)");
  script_cve_id("CVE-2017-15135", "CVE-2018-1054");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for 389-ds-base CESA-2018:0515 centos6 ");
  script_tag(name: "summary", value: "Check the version of 389-ds-base");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "389 Directory Server is an LDAP version 3 
(LDAPv3) compliant server. The base packages include the Lightweight Directory 
Access Protocol (LDAP) server and command-line utilities for server administration.

Security Fix(es):

* 389-ds-base: remote Denial of Service (DoS) via search filters in
SetUnicodeStringFromUTF_8 in collate.c (CVE-2018-1054)

* 389-ds-base: Authentication bypass due to lack of size check in
slapi_ct_memcmp function in ch_malloc.c (CVE-2017-15135)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

The CVE-2017-15135 issue was discovered by Martin Poole (Red Hat).
");
  script_tag(name: "affected", value: "389-ds-base on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2018:0515");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2018-March/022797.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.11.15~94.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-devel", rpm:"389-ds-base-devel~1.2.11.15~94.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.11.15~94.el6_9", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
