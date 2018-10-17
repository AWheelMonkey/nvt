###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_0322_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for gnutls SUSE-SU-2014:0322-1 (gnutls)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850991");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 16:15:41 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2009-5138", "CVE-2013-1619", "CVE-2013-2116", "CVE-2014-0092");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for gnutls SUSE-SU-2014:0322-1 (gnutls)");
  script_tag(name: "summary", value: "Check the version of gnutls");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  The GnuTLS library received a critical security fix and
  other updates:

  * CVE-2014-0092: The X.509 certificate verification had
  incorrect error handling, which could lead to broken
  certificates marked as being valid.
  * CVE-2009-5138: A verification problem in handling V1
  certificates could also lead to V1 certificates incorrectly
  being handled.
  * CVE-2013-2116: The _gnutls_ciphertext2compressed
  function in lib/gnutls_cipher.c in GnuTLS allowed remote
  attackers to cause a denial of service (buffer over-read
  and crash) via a crafted padding length.
  * CVE-2013-1619: Timing attacks against hashing of
  padding was fixed which might have allowed disclosure of
  keys. (Lucky13 attack).

  Also the following non-security bugs have been fixed:

  * gnutls doesn't like root CAs without Basic
  Constraints. Permit V1 Certificate Authorities properly
  (bnc#760265)
  * memory leak in PSK authentication (bnc#835760)

  Security Issue references:

  * CVE-2014-0092
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0092
   
  * CVE-2009-5138
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-5138
   
  * CVE-2013-2116
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-2116
   
  * CVE-2013-1619
  http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-1619");
  script_tag(name: "affected", value: "gnutls on SUSE Linux Enterprise Server 11 SP1 LTSS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2014:0322_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLES11.0SP1")
{

  if ((res = isrpmvuln(pkg:"gnutls", rpm:"gnutls~2.4.1~24.39.49.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgnutls-extra26", rpm:"libgnutls-extra26~2.4.1~24.39.49.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgnutls26", rpm:"libgnutls26~2.4.1~24.39.49.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgnutls26-32bit", rpm:"libgnutls26-32bit~2.4.1~24.39.49.1", rls:"SLES11.0SP1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
