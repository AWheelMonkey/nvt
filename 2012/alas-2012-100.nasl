###############################################################################
# OpenVAS Vulnerability Test
# $Id: alas-2012-100.nasl 6578 2017-07-06 13:44:33Z cfischer$
#
# Amazon Linux security check
#
# Authors:
# Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.120263");
  script_version("$Revision: 11703 $");
  script_tag(name:"creation_date", value:"2015-09-08 13:21:54 +0200 (Tue, 08 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 10:05:31 +0200 (Mon, 01 Oct 2018) $");
  script_name("Amazon Linux Local Check: ALAS-2012-100");
  script_tag(name:"insight", value:"A flaw was found in the way the Linux kernel's Event Poll (epoll) subsystem handled large, nested epoll structures. A local, unprivileged user could use this flaw to cause a denial of service.A malicious Network File System version 4 (NFSv4) server could return a crafted reply to a GETACL request, causing a denial of service on the client.The rds_ib_xmit function in net/rds/ib_send.c in the Reliable Datagram Sockets (RDS) protocol implementation in the Linux kernel 3.7.4 and earlier allows local users to cause a denial of service (BUG_ON and kernel panic) by establishing an RDS connection with the source IP address equal to the IPoIB interface's own IP address, as demonstrated by rds-ping.");
  script_tag(name:"solution", value:"Run yum update kernel to update your system.  You will need to reboot your system in order for the new kernel to be running.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://alas.aws.amazon.com/ALAS-2012-100.html");
  script_cve_id("CVE-2012-2372", "CVE-2011-1083", "CVE-2011-4131");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
  script_copyright("Eero Volotinen");
  script_family("Amazon Linux Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"kernel-tools-debuginfo", rpm:"kernel-tools-debuginfo~3.2.22~35.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~3.2.22~35.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~3.2.22~35.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.2.22~35.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~3.2.22~35.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.2.22~35.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~3.2.22~35.60.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99);
  exit(0);
}
