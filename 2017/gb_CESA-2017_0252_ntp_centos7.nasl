###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for ntp CESA-2017:0252 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882653");
  script_version("$Revision: 6659 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:52:22 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-02-07 05:45:01 +0100 (Tue, 07 Feb 2017)");
  script_cve_id("CVE-2016-7426", "CVE-2016-7429", "CVE-2016-7433", "CVE-2016-9310", 
                "CVE-2016-9311");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for ntp CESA-2017:0252 centos7 ");
  script_tag(name: "summary", value: "Check the version of ntp");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The Network Time Protocol (NTP) is used 
to synchronize a computer's time with another referenced time source. 
These packages include the ntpd service which continuously adjusts system time 
and utilities used to query and configure the ntpd service.

Security Fix(es):

* It was found that when ntp is configured with rate limiting for all
associations the limits are also applied to responses received from its
configured sources. A remote attacker who knows the sources can cause a
denial of service by preventing ntpd from accepting valid responses from
its sources. (CVE-2016-7426)

* A flaw was found in the control mode functionality of ntpd. A remote
attacker could send a crafted control mode packet which could lead to
information disclosure or result in DDoS amplification attacks.
(CVE-2016-9310)

* A flaw was found in the way ntpd implemented the trap service. A remote
attacker could send a specially crafted packet to cause a null pointer
dereference that will crash ntpd, resulting in a denial of service.
(CVE-2016-9311)

* A flaw was found in the way ntpd running on a host with multiple network
interfaces handled certain server responses. A remote attacker could use
this flaw which would cause ntpd to not synchronize with the source.
(CVE-2016-7429)

* A flaw was found in the way ntpd calculated the root delay. A remote
attacker could send a specially-crafted spoofed packet to cause denial of
service or in some special cases even crash. (CVE-2016-7433)
");
  script_tag(name: "affected", value: "ntp on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:0252");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-February/022267.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"ntp", rpm:"ntp~4.2.6p5~25.el7.centos.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ntpdate", rpm:"ntpdate~4.2.6p5~25.el7.centos.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ntp-doc", rpm:"ntp-doc~4.2.6p5~25.el7.centos.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ntp-perl", rpm:"ntp-perl~4.2.6p5~25.el7.centos.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sntp", rpm:"sntp~4.2.6p5~25.el7.centos.1", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
