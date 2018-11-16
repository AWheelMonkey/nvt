###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2521_1.nasl 12283 2018-11-09 11:21:17Z cfischer $
#
# SuSE Update for nextcloud openSUSE-SU-2018:2521-1 (nextcloud)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851868");
  script_version("$Revision: 12283 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 12:21:17 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-08-27 07:20:43 +0200 (Mon, 27 Aug 2018)");
  script_cve_id("CVE-2018-3780");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for nextcloud openSUSE-SU-2018:2521-1 (nextcloud)");
  script_tag(name:"summary", value:"Check the version of nextcloud");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update for nextcloud to version 13.0.5 fixes the following issues:

  Security issues fixed:

  - CVE-2018-3780: Fixed a missing sanitization of search results for an
  autocomplete field that could lead to a stored XSS requiring
  user-interaction. The missing sanitization only affected user names,
  hence malicious search results could only be crafted by authenticated
  users. (boo#1105598)


  Other bugs fixed:

  - Fix highlighting of the upload drop zone

  - Apply ldapUserFilter on members of group

  - Make the DELETION of groups match greedy on the groupID

  - Add parent index to share table

  - Log full exception in cron instead of only the message

  - Properly lock the target file on dav upload when not using part files

  - LDAP backup server should not be queried when auth fails

  - Fix filenames in sharing integration tests

  - Lower log level for quota manipulation cases

  - Let user set avatar in nextcloud if LDAP provides invalid image data

  - Improved logging of smb connection errors

  - Allow admin to disable fetching of avatars as well as a specific
  attribute

  - Allow to disable encryption

  - Update message shown when unsharing a file

  - Fixed English grammatical error on Settings page.

  - Request a valid property for DAV opendir

  - Allow updating the token on session regeneration

  - Prevent lock values from going negative with memcache backend

  - Correctly handle users with numeric user ids

  - Correctly parse the subject parameters for link (un)shares of calendars

  - Fix 'parsing' of email-addresses in comments and chat messages

  - Sanitize parameters in createSessionToken() while logging

  - Also retry rename operation on InvalidArgumentException

  - Improve url detection in comments

  - Only bind to ldap if configuration for the first server is set

  - Use download manager from PDF.js to download the file

  - Fix trying to load removed scripts

  - Only pull for new messages if the session is allowed to be kept alive

  - Always push object data

  - Add prioritization for Talk


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-936=1

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-936=1");
  script_tag(name:"affected", value:"nextcloud on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:2521_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-08/msg00078.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"nextcloud", rpm:"nextcloud~13.0.5~12.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
