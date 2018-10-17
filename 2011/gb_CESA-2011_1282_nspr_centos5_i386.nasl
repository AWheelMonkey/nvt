###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nspr CESA-2011:1282 centos5 i386
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

include("revisions-lib.inc");
tag_insight = "Network Security Services (NSS) is a set of libraries designed to support
  the cross-platform development of security-enabled client and server
  applications.

  Netscape Portable Runtime (NSPR) provides platform independence for non-GUI
  operating system facilities.
  
  It was found that a Certificate Authority (CA) issued fraudulent HTTPS
  certificates. This update renders any HTTPS certificates signed by that CA
  as untrusted. This covers all uses of the certificates, including SSL,
  S/MIME, and code signing. (BZ#734316)
  
  Note: This fix only applies to applications using the NSS Builtin Object
  Token. It does not render the certificates untrusted for applications that
  use the NSS library, but do not use the NSS Builtin Object Token.
  
  These updated packages upgrade NSS to version 3.12.10 on Red Hat Enterprise
  Linux 4 and 5. As well, they upgrade NSPR to version 4.8.8 on Red Hat
  Enterprise Linux 4 and 5, as required by the NSS update. The packages for
  Red Hat Enterprise Linux 6 include a backported patch.
  
  All NSS and NSPR users should upgrade to these updated packages, which
  correct this issue. After installing the update, applications using NSS and
  NSPR must be restarted for the changes to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "nspr on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-September/017913.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880984");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name: "CESA", value: "2011:1282");
  script_name("CentOS Update for nspr CESA-2011:1282 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of nspr");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"nspr", rpm:"nspr~4.8.8~1.el5_7", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nspr-devel", rpm:"nspr-devel~4.8.8~1.el5_7", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
