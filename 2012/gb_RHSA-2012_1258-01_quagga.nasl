###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for quagga RHSA-2012:1258-01
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
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2012-September/msg00014.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870833");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-09-17 16:42:09 +0530 (Mon, 17 Sep 2012)");
  script_cve_id("CVE-2010-1674", "CVE-2011-3323", "CVE-2011-3324", "CVE-2011-3325",
                "CVE-2011-3326", "CVE-2011-3327", "CVE-2012-0249", "CVE-2012-0250");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"RHSA", value:"2012:1258-01");
  script_name("RedHat Update for quagga RHSA-2012:1258-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'quagga'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_5");
  script_tag(name:"affected", value:"quagga on Red Hat Enterprise Linux (v. 5 server)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Quagga is a TCP/IP based routing software suite. The Quagga bgpd daemon
  implements the BGP (Border Gateway Protocol) routing protocol. The Quagga
  ospfd and ospf6d daemons implement the OSPF (Open Shortest Path First)
  routing protocol.

  A heap-based buffer overflow flaw was found in the way the bgpd daemon
  processed malformed Extended Communities path attributes. An attacker could
  send a specially-crafted BGP message, causing bgpd on a target system to
  crash or, possibly, execute arbitrary code with the privileges of the user
  running bgpd. The UPDATE message would have to arrive from an explicitly
  configured BGP peer, but could have originated elsewhere in the BGP
  network. (CVE-2011-3327)

  A NULL pointer dereference flaw was found in the way the bgpd daemon
  processed malformed route Extended Communities attributes. A configured
  BGP peer could crash bgpd on a target system via a specially-crafted BGP
  message. (CVE-2010-1674)

  A stack-based buffer overflow flaw was found in the way the ospf6d daemon
  processed malformed Link State Update packets. An OSPF router could use
  this flaw to crash ospf6d on an adjacent router. (CVE-2011-3323)

  Description truncated, please see the referenced URL(s) for more information.");
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

  if ((res = isrpmvuln(pkg:"quagga", rpm:"quagga~0.98.6~7.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"quagga-contrib", rpm:"quagga-contrib~0.98.6~7.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"quagga-debuginfo", rpm:"quagga-debuginfo~0.98.6~7.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"quagga-devel", rpm:"quagga-devel~0.98.6~7.el5_8.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
