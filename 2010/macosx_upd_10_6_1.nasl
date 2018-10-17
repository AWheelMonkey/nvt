###################################################################
# OpenVAS Vulnerability Test
# $Id: macosx_upd_10_6_1.nasl 10091 2018-06-06 08:42:19Z cfischer $
#
# Mac OS X 10.6.1 Update
#
# LSS-NVT-2010-026
#
# Developed by LSS Security Team <http://security.lss.hr>
#
# Copyright (C) 2010 LSS <http://www.lss.hr>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public
# License along with this program. If not, see
# <http://www.gnu.org/licenses/>.
###################################################################

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.102037");
 script_version("$Revision: 10091 $");
 script_tag(name:"last_modification", value:"$Date: 2018-06-06 10:42:19 +0200 (Wed, 06 Jun 2018) $");
 script_tag(name:"creation_date", value:"2010-05-12 14:48:44 +0200 (Wed, 12 May 2010)");
 script_cve_id("CVE-2009-1862", "CVE-2009-1863", "CVE-2009-1864", "CVE-2009-1865", "CVE-2009-1866",
               "CVE-2009-1867", "CVE-2009-1868", "CVE-2009-1869", "CVE-2009-1870");
 script_name("Mac OS X 10.6.1 Update");
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_category(ACT_GATHER_INFO);
 script_copyright("Copyright (C) 2010 LSS");
 script_family("Mac OS X Local Security Checks");
 script_require_ports("Services/ssh", 22);
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");

 script_xref(name:"URL", value:"http://support.apple.com/kb/HT3864");

 script_tag(name:"summary", value:"The remote host is missing Mac OS X 10.6.1 Update.");

 script_tag(name:"affected", value:"One or more of the following components are affected:

 Flash Player plug-in");

 script_tag(name:"solution", value:"Update your Mac OS X operating system.

 For more information see:
 http://support.apple.com/kb/HT3864");

 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");

 exit(0);
}

include("pkg-lib-macosx.inc");
include("version_func.inc");

ssh_osx_name = get_kb_item("ssh/login/osx_name");
if (!ssh_osx_name) exit (0);

ssh_osx_ver = get_kb_item("ssh/login/osx_version");
if (!ssh_osx_ver || ssh_osx_ver !~ "^10\.") exit (0);

ssh_osx_rls = ssh_osx_name + ' ' + ssh_osx_ver;

pkg_for_ver = make_list("Mac OS X 10.6","Mac OS X Server 10.6");

if (osx_rls_name(rls:ssh_osx_rls) == osx_rls_name(rls:"Mac OS X 10.6")) {
    if (version_is_less(version:osx_ver(ver:ssh_osx_rls), test_version:"10.6.1")) { security_message(0); exit(0); }
}
if (osx_rls_name(rls:ssh_osx_rls) == osx_rls_name(rls:"Mac OS X Server 10.6")) {
    if (version_is_less(version:osx_ver(ver:ssh_osx_rls), test_version:"10.6.1")) { security_message(0); exit(0); }
}
