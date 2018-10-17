###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for libvolume_id-095 CESA-2009:0427 centos5 i386
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
tag_insight = "udev provides a user-space API and implements a dynamic device directory,
  providing only the devices present on the system. udev replaces devfs in
  order to provide greater hot plug functionality. Netlink is a datagram
  oriented service, used to transfer information between kernel modules and
  user-space processes.

  It was discovered that udev did not properly check the origin of Netlink
  messages. A local attacker could use this flaw to gain root privileges via
  a crafted Netlink message sent to udev, causing it to create a
  world-writable block device file for an existing system block device (for
  example, the root file system). (CVE-2009-1185)
  
  Red Hat would like to thank Sebastian Krahmer of the SUSE Security Team for
  responsibly reporting this flaw.
  
  Users of udev are advised to upgrade to these updated packages, which
  contain a backported patch to correct this issue. After installing the
  update, the udevd daemon will be restarted automatically.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "libvolume_id-095 on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-April/015797.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880822");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2009:0427");
  script_cve_id("CVE-2009-1185");
  script_name("CentOS Update for libvolume_id-095 CESA-2009:0427 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of libvolume_id-095");
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

  if ((res = isrpmvuln(pkg:"libvolume_id-095", rpm:"libvolume_id-095~14.20.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvolume_id-devel-095", rpm:"libvolume_id-devel-095~14.20.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"udev-095", rpm:"udev-095~14.20.el5_3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
