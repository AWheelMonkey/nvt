###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_1442_1.nasl 12164 2018-10-30 09:02:07Z asteins $
#
# SuSE Update for pdns openSUSE-SU-2018:1442-1 (pdns)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852059");
  script_version("$Revision: 12164 $");
  script_cve_id("CVE-2018-1046");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-30 10:02:07 +0100 (Tue, 30 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:40:20 +0200 (Fri, 26 Oct 2018)");
  script_name("SuSE Update for pdns openSUSE-SU-2018:1442-1 (pdns)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");

  script_xref(name:"openSUSE-SU", value:"2018:1442_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-05/msg00109.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'pdns'
  package(s) announced via the openSUSE-SU-2018:1442_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"
  This update for pdns fixes the following issues:

  Security issues fixed:

  - CVE-2018-1046: Fix an issue with replaying a specially crafted PCAP file
  that can trigger a stack-based buffer overflow, leading to a crash and
  potentially arbitrary code execution (bsc#1092540).


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-532=1");

  script_tag(name:"affected", value:"pdns on openSUSE Leap 15.0.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "openSUSELeap15.0")
{

  if ((res = isrpmvuln(pkg:"pdns", rpm:"pdns~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-geoip", rpm:"pdns-backend-geoip~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-geoip-debuginfo", rpm:"pdns-backend-geoip-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-godbc", rpm:"pdns-backend-godbc~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-godbc-debuginfo", rpm:"pdns-backend-godbc-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-ldap", rpm:"pdns-backend-ldap~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-ldap-debuginfo", rpm:"pdns-backend-ldap-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-lua", rpm:"pdns-backend-lua~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-lua-debuginfo", rpm:"pdns-backend-lua-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-mydns", rpm:"pdns-backend-mydns~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-mydns-debuginfo", rpm:"pdns-backend-mydns-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-mysql", rpm:"pdns-backend-mysql~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-mysql-debuginfo", rpm:"pdns-backend-mysql-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-postgresql", rpm:"pdns-backend-postgresql~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-postgresql-debuginfo", rpm:"pdns-backend-postgresql-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-remote", rpm:"pdns-backend-remote~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-remote-debuginfo", rpm:"pdns-backend-remote-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-sqlite3", rpm:"pdns-backend-sqlite3~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-backend-sqlite3-debuginfo", rpm:"pdns-backend-sqlite3-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-debuginfo", rpm:"pdns-debuginfo~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pdns-debugsource", rpm:"pdns-debugsource~4.1.2~lp150.3.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
