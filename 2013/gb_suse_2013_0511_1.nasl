###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2013_0511_1.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# SuSE Update for pidgin openSUSE-SU-2013:0511-1 (pidgin)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850547");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-12-10 13:21:25 +0530 (Tue, 10 Dec 2013)");
  script_cve_id("CVE-2013-0271", "CVE-2013-0272", "CVE-2013-0273", "CVE-2013-0274");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("SuSE Update for pidgin openSUSE-SU-2013:0511-1 (pidgin)");

  tag_insight = "
  Pidgin was updated to 2.10.7 to fix various security issues
  and the bug that IRC did not work at all in 12.3.

  Changes:
  - Add pidgin-irc-sasl.patch: link irc module to SASL.
  Allows the IRC module to be loaded (bnc#806975).

  - Update to version 2.10.7 (bnc#804742):
  + Alien hatchery:
  - No changes
  + General:
  - The configure script will now exit with status 1 when
  specifying invalid protocol plugins using the
  --with-static-prpls and --with-dynamic-prpls
  arguments. (pidgin.im#15316)
  + libpurple:
  - Fix a crash when receiving UPnP responses with
  abnormally long values. (CVE-2013-0274)
  - Don't link directly to libgcrypt when building with
  GnuTLS support. (pidgin.im#15329)
  - Fix UPnP mappings on routers that return empty
   URLBase/  elements in their response. (pidgin.im#15373)
  - Tcl plugin uses saner, race-free plugin loading.
  - Fix the Tcl signals-test plugin for
  savedstatus-changed. (pidgin.im#15443)
  + Pidgin:
  - Make Pidgin more friendly to non-X11 GTK+, such as
  MacPorts' +no_x11 variant.
  + Gadu-Gadu:
  - Fix a crash at startup with large contact list.
  Avatar support for buddies will be disabled until 3.0.0.
  (pidgin.im#15226, pidgin.im#14305)
  + IRC:
  - Support for SASL authentication. (pidgin.im#13270)
  - Print topic setter information at channel join.
  (pidgin.im#13317)
  + MSN:
  - Fix SSL certificate issue when signing into MSN for
  some users.
  - Fix a crash when removing a user before its icon is
  loaded. (pidgin.im#15217)
  + MXit:
  - Fix a bug where a remote MXit user could possibly
  specify a local file path to be written to. (CVE-2013-0271)
  - Fix a bug where the MXit server or a
  man-in-the-middle could potentially send specially crafted
  data that could overflow a buffer and lead to a crash or
  remote code execution. (CVE-2013-0272)
  - Display farewell messages in a different colour to
  distinguish them from normal messages.
  - Add support for typing notification.
  - Add support for the Relationship Status profile
  attribute.
  - Remove all reference to Hidden Number.
  - Ignore new invites to join a GroupChat if you're
  already joined, or still have a pending invite.
  - The buddy's name was not centered vertically in the
  buddy-list if they did not have a status-message or mood
  set.
  - Fix decoding of font-size changes in the markup of
  received messages.
  - Increase the maximum file size that can be
  transferred to 1 MB.
  - When setting an avatar image, no longer downscale it
  to 96x96.
  + Sametime:
  - Fix a crash in Sametime when a malicious server sends
  us an abnormally long user ID. (CVE-2013 ...

  Description truncated, for more information please check the Reference URL";

  tag_affected = "pidgin on openSUSE 12.3";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "openSUSE-SU", value: "2013:0511_1");
  script_tag(name: "summary" , value: "Check for the Version of pidgin");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE12.3")
{

  if ((res = isrpmvuln(pkg:"finch", rpm:"finch~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch-debuginfo", rpm:"finch-debuginfo~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch-devel", rpm:"finch-devel~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple", rpm:"libpurple~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-debuginfo", rpm:"libpurple-debuginfo~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-devel", rpm:"libpurple-devel~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-meanwhile", rpm:"libpurple-meanwhile~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-meanwhile-debuginfo", rpm:"libpurple-meanwhile-debuginfo~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-tcl", rpm:"libpurple-tcl~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-tcl-debuginfo", rpm:"libpurple-tcl-debuginfo~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin", rpm:"pidgin~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-debuginfo", rpm:"pidgin-debuginfo~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-debugsource", rpm:"pidgin-debugsource~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-devel", rpm:"pidgin-devel~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-branding-upstream", rpm:"libpurple-branding-upstream~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-lang", rpm:"libpurple-lang~2.10.7~4.4.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
