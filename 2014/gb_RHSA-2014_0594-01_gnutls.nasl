###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for gnutls RHSA-2014:0594-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871173");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-06-09 15:57:33 +0530 (Mon, 09 Jun 2014)");
  script_cve_id("CVE-2014-3466", "CVE-2014-3467", "CVE-2014-3468", "CVE-2014-3469");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for gnutls RHSA-2014:0594-01");

  tag_insight = "The GnuTLS library provides support for cryptographic algorithms and for
protocols such as Transport Layer Security (TLS). The gnutls packages also
include the libtasn1 library, which provides Abstract Syntax Notation One
(ASN.1) parsing and structures management, and Distinguished Encoding Rules
(DER) encoding and decoding functions.

A flaw was found in the way GnuTLS parsed session IDs from ServerHello
messages of the TLS/SSL handshake. A malicious server could use this flaw
to send an excessively long session ID value, which would trigger a buffer
overflow in a connecting TLS/SSL client application using GnuTLS, causing
the client application to crash or, possibly, execute arbitrary code.
(CVE-2014-3466)

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
Upstream acknowledges Joonas Kuorilehto of Codenomicon as the original
reporter of CVE-2014-3466.

Users of GnuTLS are advised to upgrade to these updated packages, which
correct these issues. For the update to take effect, all applications
linked to the GnuTLS or libtasn1 library must be restarted.
";

  tag_affected = "gnutls on Red Hat Enterprise Linux (v. 5 server)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:0594-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-June/msg00003.html");
  script_tag(name:"summary", value:"Check for the Version of gnutls");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"gnutls", rpm:"gnutls~1.4.1~16.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnutls-debuginfo", rpm:"gnutls-debuginfo~1.4.1~16.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnutls-devel", rpm:"gnutls-devel~1.4.1~16.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnutls-utils", rpm:"gnutls-utils~1.4.1~16.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}