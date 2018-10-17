###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for net-snmp CESA-2013:0124 centos5 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "These packages provide various libraries and tools for the Simple Network
  Management Protocol (SNMP).

  An out-of-bounds buffer read flaw was found in the net-snmp agent. A remote
  attacker with read privileges to a Management Information Base (MIB)
  subtree handled by the &quot;extend&quot; directive (in &quot;/etc/snmp/snmpd.conf&quot;) could
  use this flaw to crash snmpd via a crafted SNMP GET request.
  (CVE-2012-2141)
  
  Bug fixes:
  
  * Devices that used certain file systems were not reported in the
  &quot;HOST-RESOURCES-MIB::hrStorageTable&quot; table. As a result, the snmpd daemon
  did not recognize devices using tmpfs, ReiserFS, and Oracle Cluster File
  System (OCFS2) file systems. This update recognizes these devices and
  reports them in the &quot;HOST-RESOURCES-MIB::hrStorageTable&quot; table.
  (BZ#754652, BZ#755958, BZ#822061)
  
  * The snmptrapd (8) man page did not correctly describe how to load
  multiple configuration files using the &quot;-c&quot; option. This update describes
  correctly that multiple configuration files must be separated by a comma.
  (BZ#760001)
  
  * Integers truncated from 64 to 32-bit were not correctly evaluated. As a
  consequence, the snmpd daemon could enter an endless loop when encoding the
  truncated integers to network format. This update modifies the underlying
  code so that snmpd correctly checks truncated 64-bit integers. Now, snmpd
  avoids an endless loop. (BZ#783892)
  
  * snmpd did not correctly check for interrupted system calls when
  enumerating existing IPv6 network prefixes during startup. As a
  consequence, snmpd could prematurely exit when receiving a signal during
  this enumeration. This update checks the network prefix enumeration code
  for interrupted system calls. Now, snmpd no longer terminates when a signal
  is received. (BZ#799699)
  
  * snmpd used the wrong length of COUNTER64 values in the AgentX protocol.
  As a consequence, snmpd could not decode two consecutive COUNTER64 values
  in one AgentX packet. This update uses the correct COUNTER64 size and can
  process two or mode COUNTER64 values in AgentX communication. (BZ#803585)
  
  * snmpd ignored the &quot;-e&quot; parameter of the &quot;trapsess&quot; option in the snmpd
  configuration file. As a result, outgoing traps were incorrectly sent with
  the default EngineID of snmpd when configuring &quot;trapsess&quot; with an explicit
  EngineID. This update modifies the underlying code to send outgoing traps
  using the EngineID as specified in the &quot;trapsess -e&quot; parameter in the
  configuration file. (BZ#805689)
  
  * snmpd did not cor ... 

  Description truncated, for more information please check the Reference URL";


tag_affected = "net-snmp on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-January/019127.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881563");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-01-21 09:39:45 +0530 (Mon, 21 Jan 2013)");
  script_cve_id("CVE-2012-2141");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2013:0124");
  script_name("CentOS Update for net-snmp CESA-2013:0124 centos5 ");

  script_tag(name: "summary" , value: "Check for the Version of net-snmp");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"net-snmp", rpm:"net-snmp~5.3.2.2~20.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-devel", rpm:"net-snmp-devel~5.3.2.2~20.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-libs", rpm:"net-snmp-libs~5.3.2.2~20.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-perl", rpm:"net-snmp-perl~5.3.2.2~20.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"net-snmp-utils", rpm:"net-snmp-utils~5.3.2.2~20.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
