###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for openswan CESA-2009:0402 centos5 i386
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
tag_insight = "Openswan is a free implementation of Internet Protocol Security (IPsec)
  and Internet Key Exchange (IKE). IPsec uses strong cryptography to provide
  both authentication and encryption services. These services allow you to
  build secure tunnels through untrusted networks. Everything passing through
  the untrusted network is encrypted by the IPsec gateway machine, and
  decrypted by the gateway at the other end of the tunnel. The resulting
  tunnel is a virtual private network (VPN).

  Gerd v. Egidy discovered a flaw in the Dead Peer Detection (DPD) in
  Openswan's pluto IKE daemon. A remote attacker could use a malicious DPD
  packet to crash the pluto daemon. (CVE-2009-0790)
  
  It was discovered that Openswan's livetest script created temporary files
  in an insecure manner. A local attacker could use this flaw to overwrite
  arbitrary files owned by the user running the script. (CVE-2008-4190)
  
  Note: The livetest script is an incomplete feature and was not
  automatically executed by any other script distributed with Openswan, or
  intended to be used at all, as was documented in its man page. In these
  updated packages, the script only prints an informative message and exits
  immediately when run.
  
  All users of openswan are advised to upgrade to these updated packages,
  which contain backported patches to correct these issues. After installing
  this update, the ipsec service will be restarted automatically.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "openswan on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-April/015746.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880853");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2009:0402");
  script_cve_id("CVE-2008-4190", "CVE-2009-0790");
  script_name("CentOS Update for openswan CESA-2009:0402 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of openswan");
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

  if ((res = isrpmvuln(pkg:"openswan", rpm:"openswan~2.6.14~1.el5_3.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openswan-doc", rpm:"openswan-doc~2.6.14~1.el5_3.2", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
