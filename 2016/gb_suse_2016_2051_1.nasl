###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_2051_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# SuSE Update for java-1_8_0-openjdk openSUSE-SU-2016:2051-1 (java-1_8_0-openjdk)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851379");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-08-12 05:48:20 +0200 (Fri, 12 Aug 2016)");
  script_cve_id("CVE-2016-3458", "CVE-2016-3485", "CVE-2016-3498", "CVE-2016-3500",
                "CVE-2016-3503", "CVE-2016-3508", "CVE-2016-3511", "CVE-2016-3550",
                "CVE-2016-3552", "CVE-2016-3587", "CVE-2016-3598", "CVE-2016-3606",
                "CVE-2016-3610");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for java-1_8_0-openjdk openSUSE-SU-2016:2051-1 (java-1_8_0-openjdk)");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'java-1_8_0-openjdk'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for java-1_8_0-openjdk fixes the following issues:

  - Upgrade to version jdk8u101 (icedtea 3.1.0)

  - New in release 3.1.0 (2016-07-25):

  * Security fixes

  - S8079718, CVE-2016-3458: IIOP Input Stream Hooking (bsc#989732)

  - S8145446, CVE-2016-3485: Perfect pipe placement (Windows
  only) (bsc#989734)

  - S8146514: Enforce GCM limits

  - S8147771: Construction of static protection domains under Javax
  custom policy

  - S8148872, CVE-2016-3500: Complete name checking (bsc#989730)

  - S8149070: Enforce update ordering

  - S8149962, CVE-2016-3508: Better delineation of XML processing
  (bsc#989731)

  - S8150752: Share Class Data

  - S8151925: Font reference improvements

  - S8152479, CVE-2016-3550: Coded byte streams (bsc#989733)

  - S8153312: Constrain AppCDS behavior

  - S8154475, CVE-2016-3587: Clean up lookup visibility (bsc#989721)

  - S8155981, CVE-2016-3606: Bolster bytecode verification (bsc#989722)

  - S8155985, CVE-2016-3598: Persistent Parameter Processing (bsc#989723)

  - S8158571, CVE-2016-3610: Additional method handle validation
  (bsc#989725)

  - CVE-2016-3552 (bsc#989726)

  - CVE-2016-3511 (bsc#989727)

  - CVE-2016-3503 (bsc#989728)

  - CVE-2016-3498 (bsc#989729)

  * New features

  - S8145547, PR1061: [AWT/Swing] Conditional support for GTK 3
  on Linux

  - PR2821: Support building OpenJDK with --disable-headful

  - PR2931, G478960: Provide Infinality Support via fontconfig

  - PR3079: Provide option to build Shenandoah on x86_64

  * Import of OpenJDK 8 u92 build 14

  - S6869327: Add new C2 flag to keep safepoints in counted loops.

  - S8022865: [TESTBUG] Compressed Oops testing needs to be revised

  - S8029630: Thread id should be displayed as a hex number in error
  report

  - S8029726: On OS X some dtrace probe names are mismatched with Solaris

  - S8029727: On OS X dtrace probes Call type MethodA/Call type MethodV
  are not fired.

  - S8029728: On OS X dtrace probes SetStaticBooleanField are not fired

  - S8038184: XMLSignature throws StringIndexOutOfBoundsException if ID
  attribute value is empty String

  - S8038349: Signing XML with DSA throws Exception when key is larger
  than 1024 bits

  - S8041501: ImageIO reader is not capable of reading JPEGs without
  JFIF header

  - S8041900: [macosx] Java forces the use of discrete GPU

  - S8044363: Remove special build options for unpack200 executable

  - S8046471: Use OPENJDK_TARGET_CPU_ARCH instead of legacy value for
  hotspot ARCH

  - S8046611: Build errors with gcc on sparc/fastdebug

  - S8047763: Recognize sparc64 as a sparc platform

  - S8048232: Fix for 8046471 breaks PPC64 build

  - ...

  Description truncated, please see the referenced URL(s) for more information.");
  script_tag(name:"affected", value:"java-1_8_0-openjdk on openSUSE Leap 42.1");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2016:2051_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.1");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk", rpm:"java-1_8_0-openjdk~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-accessibility", rpm:"java-1_8_0-openjdk-accessibility~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-debuginfo", rpm:"java-1_8_0-openjdk-debuginfo~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-debugsource", rpm:"java-1_8_0-openjdk-debugsource~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-demo", rpm:"java-1_8_0-openjdk-demo~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-demo-debuginfo", rpm:"java-1_8_0-openjdk-demo-debuginfo~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-devel", rpm:"java-1_8_0-openjdk-devel~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-devel-debuginfo", rpm:"java-1_8_0-openjdk-devel-debuginfo~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-headless", rpm:"java-1_8_0-openjdk-headless~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-headless-debuginfo", rpm:"java-1_8_0-openjdk-headless-debuginfo~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-src", rpm:"java-1_8_0-openjdk-src~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-javadoc", rpm:"java-1_8_0-openjdk-javadoc~1.8.0.101~15.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
