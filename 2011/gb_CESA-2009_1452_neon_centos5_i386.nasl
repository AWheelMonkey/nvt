###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for neon CESA-2009:1452 centos5 i386
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
tag_insight = "neon is an HTTP and WebDAV client library, with a C interface. It provides
  a high-level interface to HTTP and WebDAV methods along with a low-level
  interface for HTTP request handling. neon supports persistent connections,
  proxy servers, basic, digest and Kerberos authentication, and has complete
  SSL support.

  It was discovered that neon is affected by the previously published &quot;null
  prefix attack&quot;, caused by incorrect handling of NULL characters in X.509
  certificates. If an attacker is able to get a carefully-crafted certificate
  signed by a trusted Certificate Authority, the attacker could use the
  certificate during a man-in-the-middle attack and potentially confuse an
  application using the neon library into accepting it by mistake.
  (CVE-2009-2474)
  
  A denial of service flaw was found in the neon Extensible Markup Language
  (XML) parser. A remote attacker (malicious DAV server) could provide a
  specially-crafted XML document that would cause excessive memory and CPU
  consumption if an application using the neon XML parser was tricked into
  processing it. (CVE-2009-2473)
  
  All neon users should upgrade to these updated packages, which contain
  backported patches to correct these issues. Applications using the neon
  HTTP and WebDAV client library, such as cadaver, must be restarted for this
  update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "neon on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-October/016252.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880713");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2009:1452");
  script_cve_id("CVE-2009-2473", "CVE-2009-2474");
  script_name("CentOS Update for neon CESA-2009:1452 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of neon");
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

  if ((res = isrpmvuln(pkg:"neon", rpm:"neon~0.25.5~10.el5_4.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"neon-devel", rpm:"neon-devel~0.25.5~10.el5_4.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
