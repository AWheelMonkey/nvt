###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for nss RHSA-2011:1444-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_insight = "Network Security Services (NSS) is a set of libraries designed to support
  the development of security-enabled client and server applications.

  It was found that the Malaysia-based Digicert Sdn. Bhd. subordinate
  Certificate Authority (CA) issued HTTPS certificates with weak keys. This
  update renders any HTTPS certificates signed by that CA as untrusted. This
  covers all uses of the certificates, including SSL, S/MIME, and code
  signing. Note: Digicert Sdn. Bhd. is not the same company as found at
  digicert.com. (BZ#751366)

  Note: This fix only applies to applications using the NSS Builtin Object
  Token. It does not render the certificates untrusted for applications that
  use the NSS library, but do not use the NSS Builtin Object Token.

  This update also fixes the following bug on Red Hat Enterprise Linux 5:

  * When using mod_nss with the Apache HTTP Server, a bug in NSS on Red Hat
  Enterprise Linux 5 resulted in file descriptors leaking each time the
  Apache HTTP Server was restarted with the &quot;service httpd reload&quot; command.
  This could have prevented the Apache HTTP Server from functioning properly
  if all available file descriptors were consumed. (BZ#743508)

  For Red Hat Enterprise Linux 6, these updated packages upgrade NSS to
  version 3.12.10. As well, they upgrade NSPR (Netscape Portable Runtime) to
  version 4.8.8 and nss-util to version 3.12.10 on Red Hat
  Enterprise Linux 6, as required by the NSS update. (BZ#735972, BZ#736272,
  BZ#735973)

  All NSS users should upgrade to these updated packages, which correct this
  issue. After installing the update, applications using NSS must be
  restarted for the changes to take effect. In addition, on Red Hat
  Enterprise Linux 6, applications using NSPR and nss-util must also be
  restarted.";

tag_affected = "nss on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux AS version 4,
  Red Hat Enterprise Linux ES version 4,
  Red Hat Enterprise Linux WS version 4";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-November/msg00011.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870511");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-11-11 09:53:18 +0530 (Fri, 11 Nov 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2011:1444-01");
  script_name("RedHat Update for nss RHSA-2011:1444-01");

  script_tag(name:"summary", value:"Check for the Version of nss");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(5|4)");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.12.10~7.el5_7", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-debuginfo", rpm:"nss-debuginfo~3.12.10~7.el5_7", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.12.10~7.el5_7", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.12.10~7.el5_7", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.12.10~7.el5_7", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_4")
{

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.12.10~6.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-debuginfo", rpm:"nss-debuginfo~3.12.10~6.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.12.10~6.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.12.10~6.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
