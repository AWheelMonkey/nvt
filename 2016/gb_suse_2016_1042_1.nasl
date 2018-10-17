###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_1042_1.nasl 8047 2017-12-08 08:56:07Z santu $
#
# SuSE Update for java-1_7_0-openjdk openSUSE-SU-2016:1042-1 (java-1_7_0-openjdk)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851276");
  script_version("$Revision: 8047 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:56:07 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-04-15 05:17:34 +0200 (Fri, 15 Apr 2016)");
  script_cve_id("CVE-2016-0636");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for java-1_7_0-openjdk openSUSE-SU-2016:1042-1 (java-1_7_0-openjdk)");
  script_tag(name: "summary", value: "Check the version of java-1_7_0-openjdk");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for java-1_7_0-openjdk fixes the following issues:

  java-1_7_0-openjdk was updated to 2.6.5 - OpenJDK 7u99 (boo#972468)
  * Security fixes
  - S8152335, CVE-2016-0636: Improve MethodHandle consistency
  * Import of OpenJDK 7 u99 build 0
  - S6425769, PR2858: Allow specifying an address to bind JMX remote
  connector
  - S6961123: setWMClass fails to null-terminate WM_CLASS string
  - S8145982, PR2858: JMXInterfaceBindingTest is failing intermittently
  - S8146015, PR2858: JMXInterfaceBindingTest is failing intermittently
  for IPv6 addresses
  * Backports
  - S8028727, PR2814: [parfait] warnings from b116 for
  jdk.src.share.native.sun.security.ec: JNI pending exceptions
  - S8048512, PR2814: Uninitialised memory in
  jdk/src/share/native/sun/security/ec/ECC_JNI.cpp
  - S8071705. PR2819, RH1182694: Java application menu misbehaves when
  running multiple screen stacked vertically
  - S8150954, PR2866, RH1176206: AWT Robot not compatible with GNOME
  Shell
  * Bug fixes
  - PR2803: Make system CUPS optional
  - PR2886: Location of 'stap' executable is hard-coded
  - PR2893: test/tapset/jstaptest.pl should be executable
  - PR2894: Add missing test directory in make check.
  * CACAO
  - PR2781, CA195: typeinfo.cpp: typeinfo_merge_nonarrays: Assertion
  `dest &amp &amp  result &amp &amp  x.any &amp &amp  y.any' failed
  * AArch64 port
  - PR2852: Add support for large code cache
  - PR2852: Apply ReservedCodeCacheSize default limiting to AArch64
  only.
  - S8081289, PR2852: aarch64: add support for RewriteFrequentPairs in
  interpreter
  - S8131483, PR2852: aarch64: illegal stlxr instructions
  - S8133352, PR2852: aarch64: generates constrained unpredictable
  instructions
  - S8133842, PR2852: aarch64: C2 generates illegal instructions with
  int shifts  =32
  - S8134322, PR2852: AArch64: Fix several errors in C2 biased locking
  implementation
  - S8136615, PR2852: aarch64: elide DecodeN when followed by CmpP 0
  - S8138575, PR2852: Improve generated code for profile counters
  - S8138641, PR2852: Disable C2 peephole by default for aarch64
  - S8138966, PR2852: Intermittent SEGV running ParallelGC
  - S8143067, PR2852: aarch64: guarantee failure in javac
  - S8143285, PR2852: aarch64: Missing load acquire when checking if
  ConstantPoolCacheEntry is resolved
  - S8143584, PR2852: Load constant pool tag and class status with load
  acquire
  - S8144201, PR2852: aarch64:
  jdk/test/com/sun/net/httpserver/Test6a.java fails with
  --enable-unlimited-crypto
  - S8144582, PR2852: AArch64 does not generate correct branch profile
  data
  - S8146709, PR2852: AArch64: Inco ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "java-1_7_0-openjdk on openSUSE 13.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:1042_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk", rpm:"java-1_7_0-openjdk~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-accessibility", rpm:"java-1_7_0-openjdk-accessibility~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-debuginfo", rpm:"java-1_7_0-openjdk-debuginfo~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-debugsource", rpm:"java-1_7_0-openjdk-debugsource~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-demo", rpm:"java-1_7_0-openjdk-demo~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-demo-debuginfo", rpm:"java-1_7_0-openjdk-demo-debuginfo~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-devel", rpm:"java-1_7_0-openjdk-devel~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-devel-debuginfo", rpm:"java-1_7_0-openjdk-devel-debuginfo~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-headless", rpm:"java-1_7_0-openjdk-headless~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-headless-debuginfo", rpm:"java-1_7_0-openjdk-headless-debuginfo~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-src", rpm:"java-1_7_0-openjdk-src~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_7_0-openjdk-javadoc", rpm:"java-1_7_0-openjdk-javadoc~1.7.0.99~24.33.2", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
