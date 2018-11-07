###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for fetchmail MDVSA-2012:149 (fetchmail)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://www.mandriva.com/en/support/security/advisories/?name=MDVSA-2012:149");
  script_oid("1.3.6.1.4.1.25623.1.0.831731");
  script_version("$Revision: 11985 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:24:37 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-09-04 11:39:57 +0530 (Tue, 04 Sep 2012)");
  script_cve_id("CVE-2011-3389", "CVE-2012-3482");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_xref(name:"MDVSA", value:"2012:149");
  script_name("Mandriva Update for fetchmail MDVSA-2012:149 (fetchmail)");

  script_tag(name:"summary", value:"Check for the Version of fetchmail");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release", re:"ssh/login/release=MNDK_(2011\.0|mes5\.2)");
  script_tag(name:"affected", value:"fetchmail on Mandriva Linux 2011.0,
  Mandriva Enterprise Server 5.2");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Multiple vulnerabilities has been found and corrected in fetchmail:

  Fetchmail version 6.3.9 enabled all SSL workarounds (SSL_OP_ALL) which
  contains a switch to disable a countermeasure against certain attacks
  against block ciphers that permit guessing the initialization vectors,
  providing that an attacker can make the application (fetchmail) encrypt
  some data for him -- which is not easily the case (aka a BEAST attack)
  (CVE-2011-3389).

  A denial of service flaw was found in the way Fetchmail, a remote mail
  retrieval and forwarding utility, performed base64 decoding of certain
  NTLM server responses. Upon sending the NTLM authentication request,
  Fetchmail did not check if the received response was actually part
  of NTLM protocol exchange, or server-side error message and session
  abort. A rogue NTML server could use this flaw to cause fetchmail
  executable crash (CVE-2012-3482).

  This advisory provides the latest version of fetchmail (6.3.22)
  which is not vulnerable to these issues.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "MNDK_2011.0")
{

  if ((res = isrpmvuln(pkg:"fetchmail", rpm:"fetchmail~6.3.22~0.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fetchmailconf", rpm:"fetchmailconf~6.3.22~0.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fetchmail-daemon", rpm:"fetchmail-daemon~6.3.22~0.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_mes5.2")
{

  if ((res = isrpmvuln(pkg:"fetchmail", rpm:"fetchmail~6.3.22~0.1mdvmes5.2", rls:"MNDK_mes5.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fetchmailconf", rpm:"fetchmailconf~6.3.22~0.1mdvmes5.2", rls:"MNDK_mes5.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fetchmail-daemon", rpm:"fetchmail-daemon~6.3.22~0.1mdvmes5.2", rls:"MNDK_mes5.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
