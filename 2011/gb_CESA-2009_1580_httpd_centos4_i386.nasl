###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for httpd CESA-2009:1580 centos4 i386
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
tag_insight = "The Apache HTTP Server is a popular Web server.

  A flaw was found in the way the TLS/SSL (Transport Layer Security/Secure
  Sockets Layer) protocols handle session renegotiation. A man-in-the-middle
  attacker could use this flaw to prefix arbitrary plain text to a client's
  session (for example, an HTTPS connection to a website). This could force
  the server to process an attacker's request as if authenticated using the
  victim's credentials. This update partially mitigates this flaw for SSL
  sessions to HTTP servers using mod_ssl by rejecting client-requested
  renegotiation. (CVE-2009-3555)
  
  Note: This update does not fully resolve the issue for HTTPS servers. An
  attack is still possible in configurations that require a server-initiated
  renegotiation. Refer to the following Knowledgebase article for further
  information: http://kbase.redhat.com/faq/docs/DOC-20491
  
  A denial of service flaw was found in the Apache mod_deflate module. This
  module continued to compress large files until compression was complete,
  even if the network connection that requested the content was closed before
  compression completed. This would cause mod_deflate to consume large
  amounts of CPU if mod_deflate was enabled for a large file. (CVE-2009-1891)
  
  A NULL pointer dereference flaw was found in the Apache mod_proxy_ftp
  module. A malicious FTP server to which requests are being proxied could
  use this flaw to crash an httpd child process via a malformed reply to the
  EPSV or PASV commands, resulting in a limited denial of service.
  (CVE-2009-3094)
  
  A second flaw was found in the Apache mod_proxy_ftp module. In a reverse
  proxy configuration, a remote attacker could use this flaw to bypass
  intended access restrictions by creating a carefully-crafted HTTP
  Authorization header, allowing the attacker to send arbitrary commands to
  the FTP server. (CVE-2009-3095)
  
  All httpd users should upgrade to these updated packages, which contain
  backported patches to correct these issues. After installing the updated
  packages, the httpd daemon must be restarted for the update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "httpd on CentOS 4";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-November/016318.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880691");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2009:1580");
  script_cve_id("CVE-2009-1891", "CVE-2009-3094", "CVE-2009-3095", "CVE-2009-3555");
  script_name("CentOS Update for httpd CESA-2009:1580 centos4 i386");

  script_tag(name:"summary", value:"Check for the Version of httpd");
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"httpd", rpm:"httpd~2.0.52~41.ent.6.centos4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-devel", rpm:"httpd-devel~2.0.52~41.ent.6.centos4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-manual", rpm:"httpd-manual~2.0.52~41.ent.6.centos4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpd-suexec", rpm:"httpd-suexec~2.0.52~41.ent.6.centos4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mod_ssl", rpm:"mod_ssl~2.0.52~41.ent.6.centos4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
