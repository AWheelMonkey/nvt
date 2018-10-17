###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for fetchmail CESA-2009:1427 centos5 i386
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
tag_insight = "Fetchmail is a remote mail retrieval and forwarding utility intended for
  use over on-demand TCP/IP links, such as SLIP and PPP connections.

  It was discovered that fetchmail is affected by the previously published
  &quot;null prefix attack&quot;, caused by incorrect handling of NULL characters in
  X.509 certificates. If an attacker is able to get a carefully-crafted
  certificate signed by a trusted Certificate Authority, the attacker could
  use the certificate during a man-in-the-middle attack and potentially
  confuse fetchmail into accepting it by mistake. (CVE-2009-2666)
  
  A flaw was found in the way fetchmail handles rejections from a remote SMTP
  server when sending warning mail to the postmaster. If fetchmail sent a
  warning mail to the postmaster of an SMTP server and that SMTP server
  rejected it, fetchmail could crash. (CVE-2007-4565)
  
  A flaw was found in fetchmail. When fetchmail is run in double verbose
  mode (&quot;-v -v&quot;), it could crash upon receiving certain, malformed mail
  messages with long headers. A remote attacker could use this flaw to cause
  a denial of service if fetchmail was also running in daemon mode (&quot;-d&quot;).
  (CVE-2008-2711)
  
  Note: when using SSL-enabled services, it is recommended that the fetchmail
  &quot;--sslcertck&quot; option be used to enforce strict SSL certificate checking.
  
  All fetchmail users should upgrade to this updated package, which contains
  backported patches to correct these issues. If fetchmail is running in
  daemon mode, it must be restarted for this update to take effect (use the
  &quot;fetchmail --quit&quot; command to stop the fetchmail process).";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "fetchmail on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-October/016226.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880813");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_xref(name: "CESA", value: "2009:1427");
  script_cve_id("CVE-2007-4565", "CVE-2008-2711", "CVE-2009-2666");
  script_name("CentOS Update for fetchmail CESA-2009:1427 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of fetchmail");
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

  if ((res = isrpmvuln(pkg:"fetchmail", rpm:"fetchmail~6.3.6~1.1.el5_3.1", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
