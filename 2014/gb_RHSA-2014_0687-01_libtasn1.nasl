###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for libtasn1 RHSA-2014:0687-01
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871190");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-07-04 16:48:47 +0530 (Fri, 04 Jul 2014)");
  script_cve_id("CVE-2014-3467", "CVE-2014-3468", "CVE-2014-3469");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for libtasn1 RHSA-2014:0687-01");

  tag_insight = "The libtasn1 library provides Abstract Syntax Notation One (ASN.1) parsing
and structures management, and Distinguished Encoding Rules (DER) encoding
and decoding functions.

It was discovered that the asn1_get_bit_der() function of the libtasn1
library incorrectly reported the length of ASN.1-encoded data. Specially
crafted ASN.1 input could cause an application using libtasn1 to perform
an out-of-bounds access operation, causing the application to crash or,
possibly, execute arbitrary code. (CVE-2014-3468)

Multiple incorrect buffer boundary check issues were discovered in
libtasn1. Specially crafted ASN.1 input could cause an application using
libtasn1 to crash. (CVE-2014-3467)

Multiple NULL pointer dereference flaws were found in libtasn1's
asn1_read_value() function. Specially crafted ASN.1 input could cause an
application using libtasn1 to crash, if the application used the
aforementioned function in a certain way. (CVE-2014-3469)

Red Hat would like to thank GnuTLS upstream for reporting these issues.

All libtasn1 users are advised to upgrade to these updated packages, which
correct these issues. For the update to take effect, all applications
linked to the libtasn1 library must be restarted.
";

  tag_affected = "libtasn1 on Red Hat Enterprise Linux Server (v. 7)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:0687-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-June/msg00025.html");
  script_tag(name:"summary", value:"Check for the Version of libtasn1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"libtasn1", rpm:"libtasn1~3.3~5.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libtasn1-debuginfo", rpm:"libtasn1-debuginfo~3.3~5.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libtasn1-devel", rpm:"libtasn1-devel~3.3~5.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
