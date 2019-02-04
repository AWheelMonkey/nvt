###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_4032_1.nasl 12755 2018-12-11 10:50:43Z santu $
#
# SuSE Update for apache2-mod_jk openSUSE-SU-2018:4032-1 (apache2-mod_jk)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852158");
  script_version("$Revision: 12755 $");
  script_cve_id("CVE-2018-11759");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-11 11:50:43 +0100 (Tue, 11 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-10 07:36:32 +0100 (Mon, 10 Dec 2018)");
  script_name("SuSE Update for apache2-mod_jk openSUSE-SU-2018:4032-1 (apache2-mod_jk)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2018:4032_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2018-12/msg00010.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'apache2-mod_jk'
  package(s) announced via the openSUSE-SU-2018:4032_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for apache2-mod_jk fixes the following issue:

  Security issue fixed:

  - CVE-2018-11759: Fixed connector path traversal due to mishandled HTTP
  requests in httpd (bsc#1114612).

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-1510=1");

  script_tag(name:"affected", value:"apache2-mod_jk on openSUSE Leap 15.0.");

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

  if ((res = isrpmvuln(pkg:"apache2-mod_jk", rpm:"apache2-mod_jk~1.2.43~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-mod_jk-debuginfo", rpm:"apache2-mod_jk-debuginfo~1.2.43~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apache2-mod_jk-debugsource", rpm:"apache2-mod_jk-debugsource~1.2.43~lp150.2.3.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
