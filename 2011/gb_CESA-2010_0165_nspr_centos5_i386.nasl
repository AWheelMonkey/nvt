###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nspr CESA-2010:0165 centos5 i386
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
  applications. Applications built with NSS can support SSLv2, SSLv3, TLS,
  and other security standards.

  Netscape Portable Runtime (NSPR) provides platform independence for non-GUI
  operating system facilities. These facilities include threads, thread
  synchronization, normal file and network I/O, interval timing, calendar
  time, basic memory management (malloc and free), and shared library
  linking.
  
  A flaw was found in the way the TLS/SSL (Transport Layer Security/Secure
  Sockets Layer) protocols handled session renegotiation. A man-in-the-middle
  attacker could use this flaw to prefix arbitrary plain text to a client's
  session (for example, an HTTPS connection to a website). This could force
  the server to process an attacker's request as if authenticated using the
  victim's credentials. This update addresses this flaw by implementing the
  TLS Renegotiation Indication Extension, as defined in RFC 5746.
  (CVE-2009-3555)
  
  Refer to the following Knowledgebase article for additional details about
  this flaw: http://kbase.redhat.com/faq/docs/DOC-20491
  
  Users of Red Hat Certificate System 7.3 and 8.0 should review the following
  Knowledgebase article before installing this update:
  http://kbase.redhat.com/faq/docs/DOC-28439
  
  All users of NSS are advised to upgrade to these updated packages, which
  update NSS to version 3.12.6. This erratum also updates the NSPR packages
  to the version required by NSS 3.12.6. All running applications using the
  NSS library must be restarted for this update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "nspr on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2010-March/016602.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880611");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_xref(name: "CESA", value: "2010:0165");
  script_cve_id("CVE-2009-3555");
  script_name("CentOS Update for nspr CESA-2010:0165 centos5 i386");

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

  if ((res = isrpmvuln(pkg:"nspr", rpm:"nspr~4.8.4~1.el5_4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nspr-devel", rpm:"nspr-devel~4.8.4~1.el5_4", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.12.6~1.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.12.6~1.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.12.6~1.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.12.6~1.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
