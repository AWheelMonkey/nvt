# OpenVAS Vulnerability Test
# $Id: deb_3149.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3149-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703149");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2014-8126");
    script_name("Debian Security Advisory DSA 3149-1 (condor - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-02-02 00:00:00 +0100 (Mon, 02 Feb 2015)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3149.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "condor on Debian Linux");
    script_tag(name: "insight",   value: "Like other full-featured batch systems,
Condor provides a job queueing 0mechanism, scheduling policy, priority scheme,
resource monitoring, and resource management. Users submit their serial or
parallel jobs to Condor; Condor places them into a queue. It chooses when and
where to run the jobs based upon a policy, carefully monitors their progress,
and ultimately informs the user upon completion.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 7.8.2~dfsg.1-1+deb7u3.

For the upcoming stable distribution (jessie) and unstable
distribution (sid), this problem has been fixed in version
8.2.3~dfsg.1-6.

We recommend that you upgrade your condor packages.");
    script_tag(name: "summary",   value: "Florian Weimer, of Red Hat Product
Security, discovered an issue in condor, a distributed workload management system.
Upon job completion, it can optionally notify a user by sending an email; the mailx
invocation used in that process allowed for any authenticated user
able to submit jobs, to execute arbitrary code with the privileges of
the condor user.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"condor", ver:"7.8.2~dfsg.1-1+deb7u3", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"condor-dbg", ver:"7.8.2~dfsg.1-1+deb7u3", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"condor-dev", ver:"7.8.2~dfsg.1-1+deb7u3", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"condor-doc", ver:"7.8.2~dfsg.1-1+deb7u3", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libclassad-dev", ver:"7.8.2~dfsg.1-1+deb7u3", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libclassad3", ver:"7.8.2~dfsg.1-1+deb7u3", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
