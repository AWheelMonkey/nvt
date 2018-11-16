###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for quagga RHSA-2011:0406-01
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

tag_insight = "Quagga is a TCP/IP based routing software suite. The Quagga bgpd daemon
  implements the BGP (Border Gateway Protocol) routing protocol.

  A denial of service flaw was found in the way the Quagga bgpd daemon
  processed certain route metrics information. A BGP message with a
  specially-crafted path limit attribute would cause the bgpd daemon to reset
  its session with the peer through which this message was received.
  (CVE-2010-1675)

  A NULL pointer dereference flaw was found in the way the Quagga bgpd daemon
  processed malformed route extended communities attributes. A configured BGP
  peer could crash bgpd on a target system via a specially-crafted BGP
  message. (CVE-2010-1674)

  Users of quagga should upgrade to these updated packages, which contain
  backported patches to correct these issues. After installing the updated
  packages, the bgpd daemon must be restarted for the update to take effect.";

tag_affected = "quagga on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-March/msg00046.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870623");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-06-06 10:34:57 +0530 (Wed, 06 Jun 2012)");
  script_cve_id("CVE-2010-1674", "CVE-2010-1675");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2011:0406-01");
  script_name("RedHat Update for quagga RHSA-2011:0406-01");

  script_tag(name: "summary" , value: "Check for the Version of quagga");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"quagga", rpm:"quagga~0.99.15~5.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"quagga-debuginfo", rpm:"quagga-debuginfo~0.99.15~5.el6_0.2", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
