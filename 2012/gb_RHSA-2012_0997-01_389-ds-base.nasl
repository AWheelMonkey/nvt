###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for 389-ds-base RHSA-2012:0997-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2012-June/msg00040.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870770");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-06-22 10:26:17 +0530 (Fri, 22 Jun 2012)");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:N/A:N");
  script_cve_id("CVE-2012-2678", "CVE-2012-2746");
  script_xref(name:"RHSA", value:"2012:0997-01");
  script_name("RedHat Update for 389-ds-base RHSA-2012:0997-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the '389-ds-base'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name:"affected", value:"389-ds-base on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"The 389 Directory Server is an LDAPv3 compliant server. The base packages
  include the Lightweight Directory Access Protocol (LDAP) server and
  command-line utilities for server administration.

  A flaw was found in the way 389 Directory Server handled password changes.
  If an LDAP user has changed their password, and the directory server has
  not been restarted since that change, an attacker able to bind to the
  directory server could obtain the plain text version of that user's
  password via the &quot;unhashed#user#password&quot; attribute. (CVE-2012-2678)

  It was found that when the password for an LDAP user was changed, and audit
  logging was enabled (it is disabled by default), the new password was
  written to the audit log in plain text form. This update introduces a new
  configuration parameter, &quot;nsslapd-auditlog-logging-hide-unhashed-pw&quot;, which
  when set to &quot;on&quot; (the default option), prevents 389 Directory Server from
  writing plain text passwords to the audit log. This option can be
  configured in &quot;/etc/dirsrv/slapd-[ID]/dse.ldif&quot;. (CVE-2012-2746)

  All users of 389-ds-base are advised to upgrade to these updated packages,
  which resolve these issues. After installing this update, the 389 server
  service will be restarted automatically.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"389-ds-base", rpm:"389-ds-base~1.2.10.2~18.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-debuginfo", rpm:"389-ds-base-debuginfo~1.2.10.2~18.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"389-ds-base-libs", rpm:"389-ds-base-libs~1.2.10.2~18.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
