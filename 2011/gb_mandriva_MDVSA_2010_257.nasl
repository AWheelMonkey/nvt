###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for kernel MDVSA-2010:257 (kernel)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://lists.mandriva.com/security-announce/2010-12/msg00018.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831290");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-01-04 09:11:34 +0100 (Tue, 04 Jan 2011)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"MDVSA", value:"2010:257");
  script_cve_id("CVE-2010-2240", "CVE-2010-3858", "CVE-2010-2963", "CVE-2010-3067", "CVE-2010-3442", "CVE-2010-3848", "CVE-2010-3849", "CVE-2010-3850");
  script_name("Mandriva Update for kernel MDVSA-2010:257 (kernel)");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'kernel'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release", re:"ssh/login/release=MNDK_(mes5|2009\.0)");
  script_tag(name:"affected", value:"kernel on Mandriva Linux 2009.0,
  Mandriva Linux 2009.0/X86_64,
  Mandriva Enterprise Server 5,
  Mandriva Enterprise Server 5/X86_64");
  script_tag(name:"insight", value:"A vulnerability was discovered and corrected in the Linux 2.6 kernel:

  The setup_arg_pages function in fs/exec.c in the Linux kernel before
  2.6.36, when CONFIG_STACK_GROWSDOWN is used, does not properly restrict
  the stack memory consumption of the (1) arguments and (2) environment
  for a 32-bit application on a 64-bit platform, which allows local
  users to cause a denial of service (system crash) via a crafted exec
  system call, a related issue to CVE-2010-2240. (CVE-2010-3858)

  drivers/media/video/v4l2-compat-ioctl32.c in the Video4Linux (V4L)
  implementation in the Linux kernel before 2.6.36 on 64-bit platforms
  does not validate the destination of a memory copy operation, which
  allows local users to write to arbitrary kernel memory locations,
  and consequently gain privileges, via a VIDIOCSTUNER ioctl call on a
  /dev/video device, followed by a VIDIOCSMICROCODE ioctl call on this
  device. (CVE-2010-2963)

  Integer overflow in the do_io_submit function in fs/aio.c in the
  Linux kernel before 2.6.36-rc4-next-20100915 allows local users to
  cause a denial of service or possibly have unspecified other impact
  via crafted use of the io_submit system call. (CVE-2010-3067)

  Multiple integer overflows in the snd_ctl_new function
  in sound/core/control.c in the Linux kernel before
  2.6.36-rc5-next-20100929 allow local users to cause a denial of
  service (heap memory corruption) or possibly have unspecified
  other impact via a crafted (1) SNDRV_CTL_IOCTL_ELEM_ADD or (2)
  SNDRV_CTL_IOCTL_ELEM_REPLACE ioctl call. (CVE-2010-3442)

  A kernel stack overflow, a bad pointer dereference and a missing
  permission check were corrected in the econet implementation
  (CVE-2010-3848) (CVE-2010-3849) (CVE-2010-3850).

  Additionally, the kernel has been updated to the stable upstream
  version 2.6.27.56.

  To update your kernel, please follow the directions in the referenced links.");

  script_xref(name:"URL", value:"http://www.mandriva.com/en/security/kernelupdate");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "MNDK_mes5")
{

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel", rpm:"drm-experimental-kernel~2.6.27.56~desktop~1mnb~2.3.0~2.20080912.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-2.6.27.56-desktop586-1mnb", rpm:"drm-experimental-kernel-2.6.27.56-desktop586-1mnb~2.3.0~2.20080912.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-2.6.27.56-server", rpm:"drm-experimental-kernel-2.6.27.56-server~1mnb~2.3.0~2.20080912.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-desktop586-latest", rpm:"drm-experimental-kernel-desktop586-latest~2.3.0~1.20101216.2.20080912.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-desktop-latest", rpm:"drm-experimental-kernel-desktop-latest~2.3.0~1.20101216.2.20080912.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-server-latest", rpm:"drm-experimental-kernel-server-latest~2.3.0~1.20101216.2.20080912.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-2.6.27.56-desktop-1mn", rpm:"fglrx-kernel-2.6.27.56-desktop-1mnb~8.522~3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-2.6.27.56-desktop586-1mnb", rpm:"fglrx-kernel-2.6.27.56-desktop586-1mnb~8.522~3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-2.6.27.56-server", rpm:"fglrx-kernel-2.6.27.56-server~1mnb~8.522~3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-desktop586-latest", rpm:"fglrx-kernel-desktop586-latest~8.522~1.20101216.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-desktop-latest", rpm:"fglrx-kernel-desktop-latest~8.522~1.20101216.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-server-latest", rpm:"fglrx-kernel-server-latest~8.522~1.20101216.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel", rpm:"iscsitarget-kernel~2.6.27.56~desktop~1mnb~0.4.16~4.1mdvmes5.1", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-2.6.27.56-desktop586-1mnb", rpm:"iscsitarget-kernel-2.6.27.56-desktop586-1mnb~0.4.16~4.1mdvmes5.1", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-2.6.27.56-server", rpm:"iscsitarget-kernel-2.6.27.56-server~1mnb~0.4.16~4.1mdvmes5.1", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-desktop586-latest", rpm:"iscsitarget-kernel-desktop586-latest~0.4.16~1.20101216.4.1mdvmes5.1", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-desktop-latest", rpm:"iscsitarget-kernel-desktop-latest~0.4.16~1.20101216.4.1mdvmes5.1", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-server-latest", rpm:"iscsitarget-kernel-server-latest~0.4.16~1.20101216.4.1mdvmes5.1", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop", rpm:"kernel-desktop~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586", rpm:"kernel-desktop586~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586-devel", rpm:"kernel-desktop586-devel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586-devel-latest", rpm:"kernel-desktop586-devel-latest~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586-latest", rpm:"kernel-desktop586-latest~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-devel", rpm:"kernel-desktop-devel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-devel-latest", rpm:"kernel-desktop-devel-latest~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-latest", rpm:"kernel-desktop-latest~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server", rpm:"kernel-server~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server-devel", rpm:"kernel-server-devel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server-devel-latest", rpm:"kernel-server-devel-latest~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server-latest", rpm:"kernel-server-latest~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source", rpm:"kernel-source~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source-latest", rpm:"kernel-source-latest~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel", rpm:"kqemu-kernel~2.6.27.56~desktop~1mnb~1.4.0pre1~0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-2.6.27.56-desktop586-1mnb", rpm:"kqemu-kernel-2.6.27.56-desktop586-1mnb~1.4.0pre1~0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-2.6.27.56-server~1mnb", rpm:"kqemu-kernel-2.6.27.56-server~1mnb~1.4.0pre1~0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-desktop586-latest", rpm:"kqemu-kernel-desktop586-latest~1.4.0pre1~1.20101216.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-desktop-latest", rpm:"kqemu-kernel-desktop-latest~1.4.0pre1~1.20101216.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-server-latest", rpm:"kqemu-kernel-server-latest~1.4.0pre1~1.20101216.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel", rpm:"libafs-kernel~2.6.27.56~desktop~1mnb~1.4.7~5.2mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-2.6.27.56-desktop586-1mnb", rpm:"libafs-kernel-2.6.27.56-desktop586-1mnb~1.4.7~5.2mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-2.6.27.56-server-1mnb", rpm:"libafs-kernel-2.6.27.56-server-1mnb~1.4.7~5.2mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-desktop586-latest", rpm:"libafs-kernel-desktop586-latest~1.4.7~1.20101216.5.2mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-desktop-latest", rpm:"libafs-kernel-desktop-latest~1.4.7~1.20101216.5.2mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-server-latest", rpm:"libafs-kernel-server-latest~1.4.7~1.20101216.5.2mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel", rpm:"madwifi-kernel~2.6.27.56~desktop~1mnb~0.9.4~3.r3835mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-2.6.27.56-desktop586-1mnb", rpm:"madwifi-kernel-2.6.27.56-desktop586-1mnb~0.9.4~3.r3835mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-2.6.27.56-server", rpm:"madwifi-kernel-2.6.27.56-server~1mnb~0.9.4~3.r3835mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-desktop586-latest", rpm:"madwifi-kernel-desktop586-latest~0.9.4~1.20101216.3.r3835mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-desktop-latest", rpm:"madwifi-kernel-desktop-latest~0.9.4~1.20101216.3.r3835mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-server-latest", rpm:"madwifi-kernel-server-latest~0.9.4~1.20101216.3.r3835mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel", rpm:"nvidia173-kernel~2.6.27.56~desktop~1mnb~173.14.12~4mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia173-kernel-2.6.27.56-desktop586-1mnb~173.14.12~4mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-desktop586-latest", rpm:"nvidia173-kernel-desktop586-latest~173.14.12~1.20101216.4mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-desktop-latest", rpm:"nvidia173-kernel-desktop-latest~173.14.12~1.20101216.4mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel", rpm:"nvidia71xx-kernel~2.6.27.56~desktop~1mnb~71.86.06~5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia71xx-kernel-2.6.27.56-desktop586-1mnb~71.86.06~5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-2.6.27.56-server-1mnb", rpm:"nvidia71xx-kernel-2.6.27.56-server-1mnb~71.86.06~5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-desktop586-latest", rpm:"nvidia71xx-kernel-desktop586-latest~71.86.06~1.20101216.5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-desktop-latest", rpm:"nvidia71xx-kernel-desktop-latest~71.86.06~1.20101216.5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-server-latest", rpm:"nvidia71xx-kernel-server-latest~71.86.06~1.20101216.5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel", rpm:"nvidia96xx-kernel~2.6.27.56~desktop~1mnb~96.43.07~5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia96xx-kernel-2.6.27.56-desktop586-1mnb~96.43.07~5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-2.6.27.56-server-1mnb", rpm:"nvidia96xx-kernel-2.6.27.56-server-1mnb~96.43.07~5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-desktop586-latest", rpm:"nvidia96xx-kernel-desktop586-latest~96.43.07~1.20101216.5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-desktop-latest", rpm:"nvidia96xx-kernel-desktop-latest~96.43.07~1.20101216.5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-server-latest", rpm:"nvidia96xx-kernel-server-latest~96.43.07~1.20101216.5mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-2.6.27.56-desktop-1mnb", rpm:"nvidia-current-kernel-2.6.27.56-desktop-1mnb~177.70~2.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia-current-kernel-2.6.27.56-desktop586-1mnb~177.70~2.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel", rpm:"nvidia-current-kernel~2.6.27.56~server~1mnb~177.70~2.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-desktop586-latest", rpm:"nvidia-current-kernel-desktop586-latest~177.70~1.20101216.2.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-desktop-latest", rpm:"nvidia-current-kernel-desktop-latest~177.70~1.20101216.2.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-server-latest", rpm:"nvidia-current-kernel-server-latest~177.70~1.20101216.2.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel", rpm:"vpnclient-kernel~2.6.27.56~desktop~1mnb~4.8.01.0640~3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-2.6.27.56-desktop586-1mnb", rpm:"vpnclient-kernel-2.6.27.56-desktop586-1mnb~4.8.01.0640~3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-2.6.27.56-server-1mnb", rpm:"vpnclient-kernel-2.6.27.56-server-1mnb~4.8.01.0640~3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-desktop586-latest", rpm:"vpnclient-kernel-desktop586-latest~4.8.01.0640~1.20101216.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-desktop-latest", rpm:"vpnclient-kernel-desktop-latest~4.8.01.0640~1.20101216.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-server-latest", rpm:"vpnclient-kernel-server-latest~4.8.01.0640~1.20101216.3mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.27.56~1mnb2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel", rpm:"libafs-kernel~2.6.27.56~desktop~1mnb~1.4.7~5.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-2.6.27.56-server-1mnb", rpm:"libafs-kernel-2.6.27.56-server-1mnb~1.4.7~5.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-desktop-latest", rpm:"libafs-kernel-desktop-latest~1.4.7~1.20101216.5.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libafs-kernel-server-latest", rpm:"libafs-kernel-server-latest~1.4.7~1.20101216.5.1mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel", rpm:"nvidia173-kernel~2.6.27.56~server~1mnb~173.14.12~4mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-server-latest", rpm:"nvidia173-kernel-server-latest~173.14.12~1.20101216.4mdv2009.0", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_2009.0")
{

  if ((res = isrpmvuln(pkg:"alsa_raoppcm-kernel", rpm:"alsa_raoppcm-kernel~2.6.27.56~desktop~1mnb~0.5.1~2mdv2008.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"alsa_raoppcm-kernel-2.6.27.56-desktop586-1mnb", rpm:"alsa_raoppcm-kernel-2.6.27.56-desktop586-1mnb~0.5.1~2mdv2008.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"alsa_raoppcm-kernel-2.6.27.56-server-1mnb", rpm:"alsa_raoppcm-kernel-2.6.27.56-server-1mnb~0.5.1~2mdv2008.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"alsa_raoppcm-kernel-desktop586-latest", rpm:"alsa_raoppcm-kernel-desktop586-latest~0.5.1~1.20101216.2mdv2008.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"alsa_raoppcm-kernel-desktop-latest", rpm:"alsa_raoppcm-kernel-desktop-latest~0.5.1~1.20101216.2mdv2008.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"alsa_raoppcm-kernel-server-latest", rpm:"alsa_raoppcm-kernel-server-latest~0.5.1~1.20101216.2mdv2008.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel", rpm:"drm-experimental-kernel~2.6.27.56~desktop~1mnb~2.3.0~2.20080912.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-2.6.27.56-desktop586-1mnb", rpm:"drm-experimental-kernel-2.6.27.56-desktop586-1mnb~2.3.0~2.20080912.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-2.6.27.56-server-1mnb", rpm:"drm-experimental-kernel-2.6.27.56-server-1mnb~2.3.0~2.20080912.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-desktop586-latest", rpm:"drm-experimental-kernel-desktop586-latest~2.3.0~1.20101216.2.20080912.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-desktop-latest", rpm:"drm-experimental-kernel-desktop-latest~2.3.0~1.20101216.2.20080912.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"drm-experimental-kernel-server-latest", rpm:"drm-experimental-kernel-server-latest~2.3.0~1.20101216.2.20080912.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"et131x-kernel", rpm:"et131x-kernel~2.6.27.56~desktop~1mnb~1.2.3~7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"et131x-kernel-2.6.27.56-desktop586-1mnb", rpm:"et131x-kernel-2.6.27.56-desktop586-1mnb~1.2.3~7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"et131x-kernel-2.6.27.56-server-1mnb", rpm:"et131x-kernel-2.6.27.56-server-1mnb~1.2.3~7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"et131x-kernel-desktop586-latest", rpm:"et131x-kernel-desktop586-latest~1.2.3~1.20101216.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"et131x-kernel-desktop-latest", rpm:"et131x-kernel-desktop-latest~1.2.3~1.20101216.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"et131x-kernel-server-latest", rpm:"et131x-kernel-server-latest~1.2.3~1.20101216.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fcpci-kernel", rpm:"fcpci-kernel~2.6.27.56~desktop~1mnb~3.11.07~7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fcpci-kernel-2.6.27.56-desktop586-1mnb", rpm:"fcpci-kernel-2.6.27.56-desktop586-1mnb~3.11.07~7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fcpci-kernel-2.6.27.56-server-1mnb", rpm:"fcpci-kernel-2.6.27.56-server-1mnb~3.11.07~7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fcpci-kernel-desktop586-latest", rpm:"fcpci-kernel-desktop586-latest~3.11.07~1.20101216.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fcpci-kernel-desktop-latest", rpm:"fcpci-kernel-desktop-latest~3.11.07~1.20101216.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fcpci-kernel-server-latest", rpm:"fcpci-kernel-server-latest~3.11.07~1.20101216.7mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel", rpm:"fglrx-kernel~2.6.27.56~desktop~1mnb~8.522~3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-2.6.27.56-desktop586-1mnb", rpm:"fglrx-kernel-2.6.27.56-desktop586-1mnb~8.522~3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-2.6.27.56-server-1mnb", rpm:"fglrx-kernel-2.6.27.56-server-1mnb~8.522~3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-desktop586-latest", rpm:"fglrx-kernel-desktop586-latest~8.522~1.20101216.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-desktop-latest", rpm:"fglrx-kernel-desktop-latest~8.522~1.20101216.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"fglrx-kernel-server-latest", rpm:"fglrx-kernel-server-latest~8.522~1.20101216.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnbd-kernel-2.6.27.56-desktop-1mnb", rpm:"gnbd-kernel-2.6.27.56-desktop-1mnb~2.03.07~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnbd-kernel-2.6.27.56-desktop586-1mnb", rpm:"gnbd-kernel-2.6.27.56-desktop586-1mnb~2.03.07~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnbd-kernel", rpm:"gnbd-kernel~2.6.27.56~server~1mnb~2.03.07~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnbd-kernel-desktop586-latest", rpm:"gnbd-kernel-desktop586-latest~2.03.07~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnbd-kernel-desktop-latest", rpm:"gnbd-kernel-desktop-latest~2.03.07~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnbd-kernel-server-latest", rpm:"gnbd-kernel-server-latest~2.03.07~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hcfpcimodem-kernel", rpm:"hcfpcimodem-kernel~2.6.27.56~desktop~1mnb~1.17~1.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hcfpcimodem-kernel-2.6.27.56-desktop586-1mnb", rpm:"hcfpcimodem-kernel-2.6.27.56-desktop586-1mnb~1.17~1.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hcfpcimodem-kernel-2.6.27.56-server-1mnb", rpm:"hcfpcimodem-kernel-2.6.27.56-server-1mnb~1.17~1.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hcfpcimodem-kernel-desktop586-latest", rpm:"hcfpcimodem-kernel-desktop586-latest~1.17~1.20101216.1.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hcfpcimodem-kernel-desktop-latest", rpm:"hcfpcimodem-kernel-desktop-latest~1.17~1.20101216.1.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hcfpcimodem-kernel-server-latest", rpm:"hcfpcimodem-kernel-server-latest~1.17~1.20101216.1.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hsfmodem-kernel", rpm:"hsfmodem-kernel~2.6.27.56~desktop~1mnb~7.68.00.13~1.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hsfmodem-kernel-2.6.27.56-desktop586-1mnb", rpm:"hsfmodem-kernel-2.6.27.56-desktop586-1mnb~7.68.00.13~1.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hsfmodem-kernel-2.6.27.56-server-1mnb", rpm:"hsfmodem-kernel-2.6.27.56-server-1mnb~7.68.00.13~1.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hsfmodem-kernel-desktop586-latest", rpm:"hsfmodem-kernel-desktop586-latest~7.68.00.13~1.20101216.1.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hsfmodem-kernel-desktop-latest", rpm:"hsfmodem-kernel-desktop-latest~7.68.00.13~1.20101216.1.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hsfmodem-kernel-server-latest", rpm:"hsfmodem-kernel-server-latest~7.68.00.13~1.20101216.1.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hso-kernel", rpm:"hso-kernel~2.6.27.56~desktop~1mnb~1.2~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hso-kernel-2.6.27.56-desktop586-1mnb", rpm:"hso-kernel-2.6.27.56-desktop586-1mnb~1.2~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hso-kernel-2.6.27.56-server-1mnb", rpm:"hso-kernel-2.6.27.56-server-1mnb~1.2~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hso-kernel-desktop586-latest", rpm:"hso-kernel-desktop586-latest~1.2~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hso-kernel-desktop-latest", rpm:"hso-kernel-desktop-latest~1.2~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"hso-kernel-server-latest", rpm:"hso-kernel-server-latest~1.2~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel", rpm:"iscsitarget-kernel~2.6.27.56~desktop~1mnb~0.4.16~4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-2.6.27.56-desktop586-1mnb", rpm:"iscsitarget-kernel-2.6.27.56-desktop586-1mnb~0.4.16~4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-2.6.27.56-server-1mnb", rpm:"iscsitarget-kernel-2.6.27.56-server-1mnb~0.4.16~4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-desktop586-latest", rpm:"iscsitarget-kernel-desktop586-latest~0.4.16~1.20101216.4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-desktop-latest", rpm:"iscsitarget-kernel-desktop-latest~0.4.16~1.20101216.4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"iscsitarget-kernel-server-latest", rpm:"iscsitarget-kernel-server-latest~0.4.16~1.20101216.4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop", rpm:"kernel-desktop~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586", rpm:"kernel-desktop586~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586-devel", rpm:"kernel-desktop586-devel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586-devel-latest", rpm:"kernel-desktop586-devel-latest~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop586-latest", rpm:"kernel-desktop586-latest~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-devel", rpm:"kernel-desktop-devel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-devel-latest", rpm:"kernel-desktop-devel-latest~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-desktop-latest", rpm:"kernel-desktop-latest~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server", rpm:"kernel-server~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server-devel", rpm:"kernel-server-devel~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server-devel-latest", rpm:"kernel-server-devel-latest~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-server-latest", rpm:"kernel-server-latest~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source", rpm:"kernel-source~2.6.27.56~1mnb~1~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-source-latest", rpm:"kernel-source-latest~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel", rpm:"kqemu-kernel~2.6.27.56~desktop~1mnb~1.4.0pre1~0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-2.6.27.56-desktop586-1mnb", rpm:"kqemu-kernel-2.6.27.56-desktop586-1mnb~1.4.0pre1~0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-2.6.27.56-server-1mnb", rpm:"kqemu-kernel-2.6.27.56-server-1mnb~1.4.0pre1~0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-desktop586-latest", rpm:"kqemu-kernel-desktop586-latest~1.4.0pre1~1.20101216.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-desktop-latest", rpm:"kqemu-kernel-desktop-latest~1.4.0pre1~1.20101216.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kqemu-kernel-server-latest", rpm:"kqemu-kernel-server-latest~1.4.0pre1~1.20101216.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lirc-kernel", rpm:"lirc-kernel~2.6.27.56~desktop~1mnb~0.8.3~4.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lirc-kernel-2.6.27.56-desktop586-1mnb", rpm:"lirc-kernel-2.6.27.56-desktop586-1mnb~0.8.3~4.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lirc-kernel-2.6.27.56-server-1mnb", rpm:"lirc-kernel-2.6.27.56-server-1mnb~0.8.3~4.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lirc-kernel-desktop586-latest", rpm:"lirc-kernel-desktop586-latest~0.8.3~1.20101216.4.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lirc-kernel-desktop-latest", rpm:"lirc-kernel-desktop-latest~0.8.3~1.20101216.4.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lirc-kernel-server-latest", rpm:"lirc-kernel-server-latest~0.8.3~1.20101216.4.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lzma-kernel", rpm:"lzma-kernel~2.6.27.56~desktop~1mnb~4.43~24mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lzma-kernel-2.6.27.56-desktop586-1mnb", rpm:"lzma-kernel-2.6.27.56-desktop586-1mnb~4.43~24mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lzma-kernel-2.6.27.56-server-1mnb", rpm:"lzma-kernel-2.6.27.56-server-1mnb~4.43~24mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lzma-kernel-desktop586-latest", rpm:"lzma-kernel-desktop586-latest~4.43~1.20101216.24mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lzma-kernel-desktop-latest", rpm:"lzma-kernel-desktop-latest~4.43~1.20101216.24mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lzma-kernel-server-latest", rpm:"lzma-kernel-server-latest~4.43~1.20101216.24mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel", rpm:"madwifi-kernel~2.6.27.56~desktop~1mnb~0.9.4~3.r3835mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-2.6.27.56-desktop586-1mnb", rpm:"madwifi-kernel-2.6.27.56-desktop586-1mnb~0.9.4~3.r3835mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-2.6.27.56-server-1mnb", rpm:"madwifi-kernel-2.6.27.56-server-1mnb~0.9.4~3.r3835mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-desktop586-latest", rpm:"madwifi-kernel-desktop586-latest~0.9.4~1.20101216.3.r3835mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-desktop-latest", rpm:"madwifi-kernel-desktop-latest~0.9.4~1.20101216.3.r3835mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"madwifi-kernel-server-latest", rpm:"madwifi-kernel-server-latest~0.9.4~1.20101216.3.r3835mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel", rpm:"nvidia173-kernel~2.6.27.56~desktop~1mnb~173.14.12~4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia173-kernel-2.6.27.56-desktop586-1mnb~173.14.12~4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-desktop586-latest", rpm:"nvidia173-kernel-desktop586-latest~173.14.12~1.20101216.4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-desktop-latest", rpm:"nvidia173-kernel-desktop-latest~173.14.12~1.20101216.4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel", rpm:"nvidia71xx-kernel~2.6.27.56~desktop~1mnb~71.86.06~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia71xx-kernel-2.6.27.56-desktop586-1mnb~71.86.06~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-2.6.27.56-server-1mnb", rpm:"nvidia71xx-kernel-2.6.27.56-server-1mnb~71.86.06~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-desktop586-latest", rpm:"nvidia71xx-kernel-desktop586-latest~71.86.06~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-desktop-latest", rpm:"nvidia71xx-kernel-desktop-latest~71.86.06~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia71xx-kernel-server-latest", rpm:"nvidia71xx-kernel-server-latest~71.86.06~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel", rpm:"nvidia96xx-kernel~2.6.27.56~desktop~1mnb~96.43.07~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia96xx-kernel-2.6.27.56-desktop586-1mnb~96.43.07~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-2.6.27.56-server-1mnb", rpm:"nvidia96xx-kernel-2.6.27.56-server-1mnb~96.43.07~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-desktop586-latest", rpm:"nvidia96xx-kernel-desktop586-latest~96.43.07~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-desktop-latest", rpm:"nvidia96xx-kernel-desktop-latest~96.43.07~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia96xx-kernel-server-latest", rpm:"nvidia96xx-kernel-server-latest~96.43.07~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel", rpm:"nvidia-current-kernel~2.6.27.56~desktop~1mnb~177.70~2.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-2.6.27.56-desktop586-1mnb", rpm:"nvidia-current-kernel-2.6.27.56-desktop586-1mnb~177.70~2.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-2.6.27.56-server", rpm:"nvidia-current-kernel-2.6.27.56-server~1mnb~177.70~2.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-desktop586-latest", rpm:"nvidia-current-kernel-desktop586-latest~177.70~1.20101216.2.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-desktop-latest", rpm:"nvidia-current-kernel-desktop-latest~177.70~1.20101216.2.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia-current-kernel-server-latest", rpm:"nvidia-current-kernel-server-latest~177.70~1.20101216.2.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omfs-kernel", rpm:"omfs-kernel~2.6.27.56~desktop~1mnb~0.8.0~1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omfs-kernel-2.6.27.56-desktop586-1mnb", rpm:"omfs-kernel-2.6.27.56-desktop586-1mnb~0.8.0~1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omfs-kernel-2.6.27.56-server-1mnb", rpm:"omfs-kernel-2.6.27.56-server-1mnb~0.8.0~1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omfs-kernel-desktop586-latest", rpm:"omfs-kernel-desktop586-latest~0.8.0~1.20101216.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omfs-kernel-desktop-latest", rpm:"omfs-kernel-desktop-latest~0.8.0~1.20101216.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omfs-kernel-server-latest", rpm:"omfs-kernel-server-latest~0.8.0~1.20101216.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omnibook-kernel", rpm:"omnibook-kernel~2.6.27.56~desktop~1mnb~20080513~0.274.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omnibook-kernel-2.6.27.56-desktop586-1mnb", rpm:"omnibook-kernel-2.6.27.56-desktop586-1mnb~20080513~0.274.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omnibook-kernel-2.6.27.56-server-1mnb", rpm:"omnibook-kernel-2.6.27.56-server-1mnb~20080513~0.274.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omnibook-kernel-desktop586-latest-20080513", rpm:"omnibook-kernel-desktop586-latest-20080513~1.20101216.0.274.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omnibook-kernel-desktop-latest-20080513", rpm:"omnibook-kernel-desktop-latest-20080513~1.20101216.0.274.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"omnibook-kernel-server-latest-20080513", rpm:"omnibook-kernel-server-latest-20080513~1.20101216.0.274.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opencbm-kernel", rpm:"opencbm-kernel~2.6.27.56~desktop~1mnb~0.4.2a~1mdv2008.1", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opencbm-kernel-2.6.27.56-desktop586-1mnb", rpm:"opencbm-kernel-2.6.27.56-desktop586-1mnb~0.4.2a~1mdv2008.1", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opencbm-kernel-2.6.27.56-server-1mnb", rpm:"opencbm-kernel-2.6.27.56-server-1mnb~0.4.2a~1mdv2008.1", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opencbm-kernel-desktop586-latest", rpm:"opencbm-kernel-desktop586-latest~0.4.2a~1.20101216.1mdv2008.1", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opencbm-kernel-desktop-latest", rpm:"opencbm-kernel-desktop-latest~0.4.2a~1.20101216.1mdv2008.1", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"opencbm-kernel-server-latest", rpm:"opencbm-kernel-server-latest~0.4.2a~1.20101216.1mdv2008.1", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ov51x-jpeg-kernel", rpm:"ov51x-jpeg-kernel~2.6.27.56~desktop~1mnb~1.5.9~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ov51x-jpeg-kernel-2.6.27.56-desktop586-1mnb", rpm:"ov51x-jpeg-kernel-2.6.27.56-desktop586-1mnb~1.5.9~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ov51x-jpeg-kernel-2.6.27.56-server-1mnb", rpm:"ov51x-jpeg-kernel-2.6.27.56-server-1mnb~1.5.9~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ov51x-jpeg-kernel-desktop586-latest", rpm:"ov51x-jpeg-kernel-desktop586-latest~1.5.9~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ov51x-jpeg-kernel-desktop-latest", rpm:"ov51x-jpeg-kernel-desktop-latest~1.5.9~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ov51x-jpeg-kernel-server-latest", rpm:"ov51x-jpeg-kernel-server-latest~1.5.9~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qc-usb-kernel", rpm:"qc-usb-kernel~2.6.27.56~desktop~1mnb~0.6.6~6mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qc-usb-kernel-2.6.27.56-desktop586-1mnb", rpm:"qc-usb-kernel-2.6.27.56-desktop586-1mnb~0.6.6~6mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qc-usb-kernel-2.6.27.56-server-1mnb", rpm:"qc-usb-kernel-2.6.27.56-server-1mnb~0.6.6~6mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qc-usb-kernel-desktop586-latest", rpm:"qc-usb-kernel-desktop586-latest~0.6.6~1.20101216.6mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qc-usb-kernel-desktop-latest", rpm:"qc-usb-kernel-desktop-latest~0.6.6~1.20101216.6mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qc-usb-kernel-server-latest", rpm:"qc-usb-kernel-server-latest~0.6.6~1.20101216.6mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2860-kernel", rpm:"rt2860-kernel~2.6.27.56~desktop~1mnb~1.7.0.0~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2860-kernel-2.6.27.56-desktop586-1mnb", rpm:"rt2860-kernel-2.6.27.56-desktop586-1mnb~1.7.0.0~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2860-kernel-2.6.27.56-server-1mnb", rpm:"rt2860-kernel-2.6.27.56-server-1mnb~1.7.0.0~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2860-kernel-desktop586-latest", rpm:"rt2860-kernel-desktop586-latest~1.7.0.0~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2860-kernel-desktop-latest", rpm:"rt2860-kernel-desktop-latest~1.7.0.0~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2860-kernel-server-latest", rpm:"rt2860-kernel-server-latest~1.7.0.0~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2870-kernel", rpm:"rt2870-kernel~2.6.27.56~desktop~1mnb~1.3.1.0~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2870-kernel-2.6.27.56-desktop586-1mnb", rpm:"rt2870-kernel-2.6.27.56-desktop586-1mnb~1.3.1.0~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2870-kernel-2.6.27.56-server-1mnb", rpm:"rt2870-kernel-2.6.27.56-server-1mnb~1.3.1.0~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2870-kernel-desktop586-latest", rpm:"rt2870-kernel-desktop586-latest~1.3.1.0~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2870-kernel-desktop-latest", rpm:"rt2870-kernel-desktop-latest~1.3.1.0~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rt2870-kernel-server-latest", rpm:"rt2870-kernel-server-latest~1.3.1.0~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rtl8187se-kernel", rpm:"rtl8187se-kernel~2.6.27.56~desktop~1mnb~1016.20080716~1.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rtl8187se-kernel-2.6.27.56-desktop586-1mnb", rpm:"rtl8187se-kernel-2.6.27.56-desktop586-1mnb~1016.20080716~1.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rtl8187se-kernel-2.6.27.56-server-1mnb", rpm:"rtl8187se-kernel-2.6.27.56-server-1mnb~1016.20080716~1.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rtl8187se-kernel-desktop586-latest", rpm:"rtl8187se-kernel-desktop586-latest~1016.20080716~1.20101216.1.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rtl8187se-kernel-desktop-latest", rpm:"rtl8187se-kernel-desktop-latest~1016.20080716~1.20101216.1.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"rtl8187se-kernel-server-latest", rpm:"rtl8187se-kernel-server-latest~1016.20080716~1.20101216.1.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"slmodem-kernel", rpm:"slmodem-kernel~2.6.27.56~desktop~1mnb~2.9.11~0.20080817.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"slmodem-kernel-2.6.27.56-desktop586-1mnb", rpm:"slmodem-kernel-2.6.27.56-desktop586-1mnb~2.9.11~0.20080817.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"slmodem-kernel-2.6.27.56-server-1mnb", rpm:"slmodem-kernel-2.6.27.56-server-1mnb~2.9.11~0.20080817.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"slmodem-kernel-desktop586-latest", rpm:"slmodem-kernel-desktop586-latest~2.9.11~1.20101216.0.20080817.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"slmodem-kernel-desktop-latest", rpm:"slmodem-kernel-desktop-latest~2.9.11~1.20101216.0.20080817.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"slmodem-kernel-server-latest", rpm:"slmodem-kernel-server-latest~2.9.11~1.20101216.0.20080817.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"squashfs-lzma-kernel", rpm:"squashfs-lzma-kernel~2.6.27.56~desktop~1mnb~3.3~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"squashfs-lzma-kernel-2.6.27.56-desktop586-1mnb", rpm:"squashfs-lzma-kernel-2.6.27.56-desktop586-1mnb~3.3~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"squashfs-lzma-kernel-2.6.27.56-server-1mnb", rpm:"squashfs-lzma-kernel-2.6.27.56-server-1mnb~3.3~5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"squashfs-lzma-kernel-desktop586-latest", rpm:"squashfs-lzma-kernel-desktop586-latest~3.3~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"squashfs-lzma-kernel-desktop-latest", rpm:"squashfs-lzma-kernel-desktop-latest~3.3~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"squashfs-lzma-kernel-server-latest", rpm:"squashfs-lzma-kernel-server-latest~3.3~1.20101216.5mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tp_smapi-kernel", rpm:"tp_smapi-kernel~2.6.27.56~desktop~1mnb~0.37~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tp_smapi-kernel-2.6.27.56-desktop586-1mnb", rpm:"tp_smapi-kernel-2.6.27.56-desktop586-1mnb~0.37~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tp_smapi-kernel-2.6.27.56-server-1mnb", rpm:"tp_smapi-kernel-2.6.27.56-server-1mnb~0.37~2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tp_smapi-kernel-desktop586-latest", rpm:"tp_smapi-kernel-desktop586-latest~0.37~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tp_smapi-kernel-desktop-latest", rpm:"tp_smapi-kernel-desktop-latest~0.37~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"tp_smapi-kernel-server-latest", rpm:"tp_smapi-kernel-server-latest~0.37~1.20101216.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxadd-kernel", rpm:"vboxadd-kernel~2.6.27.56~desktop~1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxadd-kernel-2.6.27.56-desktop586-1mnb", rpm:"vboxadd-kernel-2.6.27.56-desktop586-1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxadd-kernel-2.6.27.56-server-1mnb", rpm:"vboxadd-kernel-2.6.27.56-server-1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxadd-kernel-desktop586-latest", rpm:"vboxadd-kernel-desktop586-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxadd-kernel-desktop-latest", rpm:"vboxadd-kernel-desktop-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxadd-kernel-server-latest", rpm:"vboxadd-kernel-server-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxvfs-kernel", rpm:"vboxvfs-kernel~2.6.27.56~desktop~1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxvfs-kernel-2.6.27.56-desktop586-1mnb", rpm:"vboxvfs-kernel-2.6.27.56-desktop586-1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxvfs-kernel-2.6.27.56-server-1mnb", rpm:"vboxvfs-kernel-2.6.27.56-server-1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxvfs-kernel-desktop586-latest", rpm:"vboxvfs-kernel-desktop586-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxvfs-kernel-desktop-latest", rpm:"vboxvfs-kernel-desktop-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vboxvfs-kernel-server-latest", rpm:"vboxvfs-kernel-server-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vhba-kernel", rpm:"vhba-kernel~2.6.27.56~desktop~1mnb~1.0.0~1.svn304.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vhba-kernel-2.6.27.56-desktop586-1mnb", rpm:"vhba-kernel-2.6.27.56-desktop586-1mnb~1.0.0~1.svn304.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vhba-kernel-2.6.27.56-server-1mnb", rpm:"vhba-kernel-2.6.27.56-server-1mnb~1.0.0~1.svn304.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vhba-kernel-desktop586-latest", rpm:"vhba-kernel-desktop586-latest~1.0.0~1.20101216.1.svn304.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vhba-kernel-desktop-latest", rpm:"vhba-kernel-desktop-latest~1.0.0~1.20101216.1.svn304.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vhba-kernel-server-latest", rpm:"vhba-kernel-server-latest~1.0.0~1.20101216.1.svn304.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"virtualbox-kernel", rpm:"virtualbox-kernel~2.6.27.56~desktop~1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"virtualbox-kernel-2.6.27.56-desktop586-1mnb", rpm:"virtualbox-kernel-2.6.27.56-desktop586-1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"virtualbox-kernel-2.6.27.56-server-1mnb", rpm:"virtualbox-kernel-2.6.27.56-server-1mnb~2.0.2~2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"virtualbox-kernel-desktop586-latest", rpm:"virtualbox-kernel-desktop586-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"virtualbox-kernel-desktop-latest", rpm:"virtualbox-kernel-desktop-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"virtualbox-kernel-server-latest", rpm:"virtualbox-kernel-server-latest~2.0.2~1.20101216.2.2mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel", rpm:"vpnclient-kernel~2.6.27.56~desktop~1mnb~4.8.01.0640~3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-2.6.27.56-desktop586-1mnb", rpm:"vpnclient-kernel-2.6.27.56-desktop586-1mnb~4.8.01.0640~3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-2.6.27.56-server-1mnb", rpm:"vpnclient-kernel-2.6.27.56-server-1mnb~4.8.01.0640~3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-desktop586-latest", rpm:"vpnclient-kernel-desktop586-latest~4.8.01.0640~1.20101216.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-desktop-latest", rpm:"vpnclient-kernel-desktop-latest~4.8.01.0640~1.20101216.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"vpnclient-kernel-server-latest", rpm:"vpnclient-kernel-server-latest~4.8.01.0640~1.20101216.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.27.56~1mnb2", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel", rpm:"nvidia173-kernel~2.6.27.56~server~1mnb~173.14.12~4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nvidia173-kernel-server-latest", rpm:"nvidia173-kernel-server-latest~173.14.12~1.20101216.4mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
