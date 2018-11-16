###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2013_0274_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for libvirt openSUSE-SU-2013:0274-1 (libvirt)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2013-02/msg00001.html");
  script_oid("1.3.6.1.4.1.25623.1.0.850395");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-03-11 18:29:50 +0530 (Mon, 11 Mar 2013)");
  script_cve_id("CVE-2012-4423", "CVE-2013-0170");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name:"openSUSE-SU", value:"2013:0274_1");
  script_name("SuSE Update for libvirt openSUSE-SU-2013:0274-1 (libvirt)");

  script_tag(name:"summary", value:"Check for the Version of libvirt");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSE12\.1");
  script_tag(name:"affected", value:"libvirt on openSUSE 12.1");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_tag(name:"insight", value:"libvirt was updated to fix some bugs and security issues:

  Security issues fixed:

  - Fix crash on error paths of message dispatching,
  CVE-2013-0170 bnc#800976

  - security: Fix libvirtd crash possibility CVE-2012-4423
  bnc#780432

  Also bugs were fixed:

  - qemu: Fix probing for guest capabilities bnc#772586

  - xen-xm: Generate UUID if not specified bnc#773626

  - xenParseXM: don't dereference NULL pointer when script is
  empty bnc#773621");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSE12.1")
{

  if ((res = isrpmvuln(pkg:"libvirt", rpm:"libvirt~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-client", rpm:"libvirt-client~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-client-debuginfo", rpm:"libvirt-client-debuginfo~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-debuginfo", rpm:"libvirt-debuginfo~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-debugsource", rpm:"libvirt-debugsource~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-devel", rpm:"libvirt-devel~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-doc", rpm:"libvirt-doc~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-python", rpm:"libvirt-python~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-python-debuginfo", rpm:"libvirt-python-debuginfo~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-client-32bit", rpm:"libvirt-client-32bit~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-client-debuginfo-32bit", rpm:"libvirt-client-debuginfo-32bit~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-devel-32bit", rpm:"libvirt-devel-32bit~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-client-debuginfo-x86", rpm:"libvirt-client-debuginfo-x86~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-client-x86", rpm:"libvirt-client-x86~0.9.6~3.13.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
