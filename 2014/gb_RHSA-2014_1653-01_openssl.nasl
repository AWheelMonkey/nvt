###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for openssl RHSA-2014:1653-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871275");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-10-17 05:58:25 +0200 (Fri, 17 Oct 2014)");
  script_cve_id("CVE-2014-3566");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_name("RedHat Update for openssl RHSA-2014:1653-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'openssl'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"OpenSSL is a toolkit that implements the Secure Sockets Layer (SSL),
Transport Layer Security (TLS), and Datagram Transport Layer Security
(DTLS) protocols, as well as a full-strength, general purpose cryptography
library.

This update adds support for the TLS Fallback Signaling Cipher Suite Value
(TLS_FALLBACK_SCSV), which can be used to prevent protocol downgrade
attacks against applications which re-connect using a lower SSL/TLS
protocol version when the initial connection indicating the highest
supported protocol version fails.

This can prevent a forceful downgrade of the communication to SSL 3.0.
The SSL 3.0 protocol was found to be vulnerable to the padding oracle
attack when using block cipher suites in cipher block chaining (CBC) mode.
This issue is identified as CVE-2014-3566, and also known under the alias
POODLE. This SSL 3.0 protocol flaw will not be addressed in a future
update  it is recommended that users configure their applications to
require at least TLS protocol version 1.0 for secure communication.

For additional information about this flaw, see the referenced Knowledgebase article.

All OpenSSL users are advised to upgrade to these updated packages, which
contain a backported patch to mitigate the CVE-2014-3566 issue. For the
update to take effect, all services linked to the OpenSSL library (such as
httpd and other SSL-enabled services) must be restarted or the system
rebooted.");
  script_tag(name:"affected", value:"openssl on Red Hat Enterprise Linux (v. 5 server)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"RHSA", value:"2014:1653-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2014-October/msg00031.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");

  script_xref(name:"URL", value:"https://access.redhat.com/articles/1232123");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~0.9.8e~31.el5_11", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-debuginfo", rpm:"openssl-debuginfo~0.9.8e~31.el5_11", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-devel", rpm:"openssl-devel~0.9.8e~31.el5_11", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-perl", rpm:"openssl-perl~0.9.8e~31.el5_11", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
