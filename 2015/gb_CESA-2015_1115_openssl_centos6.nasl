###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for openssl CESA-2015:1115 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882198");
  script_version("$Revision: 6657 $");
  script_cve_id("CVE-2014-8176", "CVE-2015-1789", "CVE-2015-1790",
                "CVE-2015-1791", "CVE-2015-1792", "CVE-2015-3216");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:50:44 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-06-16 06:13:40 +0200 (Tue, 16 Jun 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for openssl CESA-2015:1115 centos6 ");
  script_tag(name: "summary", value: "Check the version of openssl");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "OpenSSL is a toolkit that implements the
  Secure Sockets Layer (SSL v2/v3)
and Transport Layer Security (TLS v1) protocols, as well as a
full-strength, general purpose cryptography library.

An invalid free flaw was found in the way OpenSSL handled certain DTLS
handshake messages. A malicious DTLS client or server could cause a DTLS
server or client using OpenSSL to crash or, potentially, execute arbitrary
code. (CVE-2014-8176)

A flaw was found in the way the OpenSSL packages shipped with Red Hat
Enterprise Linux 6 and 7 performed locking in the ssleay_rand_bytes()
function. This issue could possibly cause a multi-threaded application
using OpenSSL to perform an out-of-bounds read and crash. (CVE-2015-3216)

An out-of-bounds read flaw was found in the X509_cmp_time() function of
OpenSSL. A specially crafted X.509 certificate or a Certificate Revocation
List (CRL) could possibly cause a TLS/SSL server or client using OpenSSL
to crash. (CVE-2015-1789)

A race condition was found in the session handling code of OpenSSL. This
issue could possibly cause a multi-threaded TLS/SSL client using OpenSSL
to double free session ticket data and crash. (CVE-2015-1791)

A flaw was found in the way OpenSSL handled Cryptographic Message Syntax
(CMS) messages. A CMS message with an unknown hash function identifier
could cause an application using OpenSSL to enter an infinite loop. 
(CVE-2015-1792)

A NULL pointer dereference was found in the way OpenSSL handled certain
PKCS#7 inputs. A specially crafted PKCS#7 input with missing
EncryptedContent data could cause an application using OpenSSL to crash.
(CVE-2015-1790)

Red Hat would like to thank the OpenSSL project for reporting
CVE-2014-8176, CVE-2015-1789, CVE-2015-1790, CVE-2015-1791 and
CVE-2015-1792 flaws. Upstream acknowledges Praveen Kariyanahalli and Ivan
Fratric as the original reporters of CVE-2014-8176, Robert Swiecki and
Hanno Bck as the original reporters of CVE-2015-1789, Michal Zalewski as
the original reporter of CVE-2015-1790, Emilia Ksper as the original
report of  CVE-2015-1791 and Johannes Bauer as the original reporter of
CVE-2015-1792.

All openssl users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues. For the update to take
effect, all services linked to the OpenSSL library must be restarted, or
the system rebooted.
");
  script_tag(name: "affected", value: "openssl on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "CESA", value: "2015:1115");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2015-June/021173.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~1.0.1e~30.el6.11", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-devel", rpm:"openssl-devel~1.0.1e~30.el6.11", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-perl", rpm:"openssl-perl~1.0.1e~30.el6.11", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-static", rpm:"openssl-static~1.0.1e~30.el6.11", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
