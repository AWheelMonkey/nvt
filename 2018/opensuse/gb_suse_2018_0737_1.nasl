###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_0737_1.nasl 11044 2018-08-18 15:12:40Z cfischer $
#
# SuSE Update for MozillaFirefox openSUSE-SU-2018:0737-1 (MozillaFirefox)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851721");
  script_version("$Revision: 11044 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-18 17:12:40 +0200 (Sat, 18 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-03-19 08:26:34 +0100 (Mon, 19 Mar 2018)");
  script_cve_id("CVE-2018-5146", "CVE-2018-5147");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for MozillaFirefox openSUSE-SU-2018:0737-1 (MozillaFirefox)");
  script_tag(name: "summary", value: "Check the version of MozillaFirefox");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for Mozilla Firefox to version 52.7.2esr fixes security issues
  and bugs.

  Security issues fixed:

  - CVE-2018-5146: Specially crafted vorbis files could have been used to
  execute arbitrary code via an Out of bounds memory write (bsc#1085671,
  MFSA 2018-08)
  - CVE-2018-5147: Specially crafted vorbis files could have been used to
  execute arbitrary code via an Out of bounds memory write - used on ARM
  platforms (bsc#1085671, MFSA 2018-08)

  The following bug fixes are included:

  - Stability improvements in the Italian locale");
  script_tag(name: "affected", value: "MozillaFirefox on openSUSE Leap 42.3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2018:0737_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2018-03/msg00048.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-branding-upstream", rpm:"MozillaFirefox-branding-upstream~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-buildsymbols", rpm:"MozillaFirefox-buildsymbols~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-debuginfo", rpm:"MozillaFirefox-debuginfo~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-debugsource", rpm:"MozillaFirefox-debugsource~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-devel", rpm:"MozillaFirefox-devel~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations-common", rpm:"MozillaFirefox-translations-common~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations-other", rpm:"MozillaFirefox-translations-other~52.7.2~81.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
