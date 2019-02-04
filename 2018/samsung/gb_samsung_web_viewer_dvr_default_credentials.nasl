###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_samsung_web_viewer_dvr_default_credentials.nasl 12738 2018-12-10 10:32:47Z cfischer $
#
# Samsung Web Viewer DVR Default Credentials
#
# Authors:
# Thorsten Passfeld <thorsten.passfeld@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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
  script_oid("1.3.6.1.4.1.25623.1.0.114047");
  script_version("$Revision: 12738 $");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-12-10 11:32:47 +0100 (Mon, 10 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-11-12 19:25:24 +0100 (Mon, 12 Nov 2018)");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Default Accounts");
  script_name("Samsung Web Viewer DVR Default Credentials");
  script_dependencies("gb_samsung_web_viewer_dvr_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("samsung/web_viewer/dvr/detected");

  script_xref(name:"URL", value:"https://customvideosecurity.com/blog/tag/default-password-axis/");

  script_tag(name:"summary", value:"The remote installation of Samsung Web Viewer DVR is prone to
  a default account authentication bypass vulnerability.");

  script_tag(name:"impact", value:"This issue may be exploited by a remote attacker to gain access
  to sensitive information or modify system configuration.");

  script_tag(name:"insight", value:"The installation of Samsung Web Viewer DVR is lacking a proper
  password configuration, which makes critical information and actions accessible for people with knowledge
  of the default credentials.");

  script_tag(name:"vuldetect", value:"Checks if a successful login to Samsung Web Viewer DVR is possible.");

  script_tag(name:"solution", value:"Change the passwords for user and admin access.");

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("host_details.inc");
include("misc_func.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("dump.inc");

CPE = "cpe:/a:samsung:web_viewer_dvr";

if(!port = get_app_port(cpe: CPE)) exit(0);
if(!get_app_location(cpe: CPE, port: port)) exit(0); # nb: Unused but added to have a reference to the Detection-NVT in the GSA

#Because we can't use multiple keys, the first part(key) is the password and the second part(value) is the username.
creds = make_array("4321", "admin",
                   "111111", "admin",
                   "admin", "root");

url = "/cgi-bin/webviewer_login_page?loginvalue=0&port=0";
loginUrl = "/cgi-bin/webviewer_cgi_login2";

res = http_get_cache(port: port, item: url);

func = eregmatch(pattern: "(function [sS]et[Cc]ookie\(\)\{[^\}]+\})", string: res);
if(isnull(func[1])) exit(99);
funcSetCookie = func[1];

#Identification of the host's specific authentication mechanism based on the source code
if("document.login_page_submit.data2.value = do_encrypt(document.login_page.data2.value);" >< funcSetCookie) {
  authType = "RSA";
}
else if("document.login_page_submit.data2.value = sha256_digest(document.login_page.data2.value);" >< funcSetCookie) {
  authType = "SHA256"; #Values are random
}
else if("'&PWD='+encode64(document.login_page.pwd.value)" >< funcSetCookie) {
  authType = "Base64";
  loginUrl = "/cgi-bin/webviewer_cgi_login";
}
else if("document.login_page_submit.data2.value = hex_func_five(document.login_page.data2.value);" >< funcSetCookie) {
  authType = "MD5";
}
else {
  exit(99);
}

foreach cred(keys(creds)) {

  #To avoid confusion with previous scripts, because of the reversed order:
  username = creds[cred];
  password = cred;

  #GET request to acquire current random values if they are provided
  req = http_get_req(port: port, url: url);
  res = http_send_recv(port: port, data: req);

  func = eregmatch(pattern: "(function [sS]et[Cc]ookie\(\)\{[^\}]+\})", string: res);
  #No need to check, it is guaranteed to match at this point.
  funcSetCookie = func[1];

  #Generation of random values for data3
  #Case1: Value has to be generated by the user
  if("document.login_page_submit.data3.value = val_rand;" >< funcSetCookie) {
    data3Num = "0." + rand_str(charset:"0123456789", length:16);
  } #Case 2: Value can be extracted
  else if((randNum = eregmatch(pattern: "document.login_page_submit.data3.value\s*=\s*([0-9.]+);", string: funcSetCookie)) && authType != "RSA") {
    data3Num = randNum[1];
  } #Case 3: Value has to be generated by the user and was expected in the url from before
  else if("document.login_page_submit.data3.value" >< funcSetCookie) { #Value can be extracted
    data3Num = "0." + rand_str(charset:"0123456789", length:16);
  } #Case 4: None of the criteria apply - just generate a random number
  else {
    data3Num = "0." + rand_str(charset:"0123456789", length:16);
  }
  if(authType == "RSA") {
    #Generation of random values for data4
    #Case 1: Value has to be generated by the user
    if("document.login_page_submit.data4.value = val_rand;" >< funcSetCookie) {
      data4Num = "0." + rand_str(charset:"0123456789", length:16);
    } #Case 2: Value can be extracted
    else if(randNum = eregmatch(pattern: "document.login_page_submit.data4.value\s*=\s*([0-9.]+);", string: funcSetCookie)) {
      data4Num = randNum[1];
    } #Case 3: Value has to be generated by the user and was expected in the url from before
    else if("document.login_page_submit.data4.value" >< funcSetCookie) { #Value can be extracted
      data4Num = "0." + rand_str(charset:"0123456789", length:16);
    } #Case 4: None of the criteria apply - just generate a random number
    else {
      data4Num = "0." + rand_str(charset:"0123456789", length:16);
    }
  }

  if(authType == "RSA") {

    # nb: Available since r25570 of libs 9.0
    if(!defined_func("rsa_public_encrypt")) exit(0);

    #Acquiring both the RSA modulus based on our random string, as well as the RSA exponent
    url = "/cgi-bin/webviewer_login_page?lang=en&loginvalue=3&port=0&data3=" + data3Num;

    req = http_get_req(port: port, url: url, add_headers: make_array("Accept-Encoding", "gzip, deflate",
                                                                     "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"));

    res = http_keepalive_send_recv(port: port, data: req);

    #var rsa_modulus='CB21A70D02393C18CD551468E473A06DD85EA13C91CF51CAB5A39C1E33B1C62B55E7B10D2A4BD304B69C2C11CF84EF3CB36E30DB6CA0D0CC0C68E63B17C3293F';
    modu = eregmatch(pattern: "var rsa_modulus='([0-9a-zA-Z]+)';", string: res);
    if(isnull(modu[1])) continue;
    rsa_modulus = hex2raw(s:modu[1]);

    #var rsa_exponent='010001';
    exp = eregmatch(pattern: "var rsa_exponent='([0-9]+)';", string: res);
    if(isnull(exp[1])) continue;
    rsa_exponent = hex2raw(s: exp[1]);

    #<input type=hidden name=remote_addr value=1.2.3.4>
    rem_addr = eregmatch(pattern: "<input type=hidden name=remote_addr\s*value=([0-9.]+)>", string: res);
    if(isnull(rem_addr[1])) continue;
    remote_address = rem_addr[1];

    #If there's ever a problem with false negatives of hosts running the RSA authentication,
    #the problem likely lies here. As it now stands, our RSA function uses PKCS#1 for padding,
    #which the Samsung Web Viewer also uses. It's hard to verify if the generated hashes are as
    #expected, though. So if there's a problem, the function might need to get corrected or upgraded.
    pass = hexstr(rsa_public_encrypt(data: password, e: rsa_exponent, n: rsa_modulus, pad: TRUE));

    data = "lang=en&port=0&close_user_session=0&data1=" + base64(str: username) + "%3D&data2=" + pass + "&data3=" + data3Num + "&data4=" + data4Num + "&remote_addr=" + remote_address;

    req = http_post_req(port: port, url: loginUrl, data: data, add_headers: make_array("Accept-Encoding", "gzip, deflate",
                                                                                       "User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
                                                                                       "Cache-Control", "max-age=0",
                                                                                       "Upgrade-Insecure-Requests", "1",
                                                                                       "Content-Type", "application/x-www-form-urlencoded",
                                                                                       "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"));
    res = http_send_recv(port: port, data: req);
  }
  else if(authType == "SHA256") {
    #<input type=hidden name=remote_addr value=1.2.3.4>
    rem_addr = eregmatch(pattern: "<input type=hidden name=remote_addr\s*value=([0-9.]+)>", string: res);
    if(isnull(rem_addr[1])) continue;
    remote_address = rem_addr[1];

    #lang=en&port=0&close_user_session=0&data1=YWRtaW4%3D&data2=...SHA256(password)&data3=0.34000497427989473&data4=0.34000497427989473&remote_addr=1.2.3.4
    data = "lang=en&port=0&close_user_session=0&data1=" + base64(str: username) + "%3D&data2=" + hexstr(SHA256(password))
    + "&data3=" + data3Num + "&data4=" + data3Num + "&remote_addr=" + remote_address;

    req = http_post_req(port: port, url: loginUrl, data: data, add_headers: make_array("Accept-Encoding", "gzip, deflate",
                                                                                       "Cache-Control", "max-age=0",
                                                                                       "Upgrade-Insecure-Requests", "1",
                                                                                       "Content-Type", "application/x-www-form-urlencoded",
                                                                                       "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"));
    res = http_send_recv(port: port, data: req);
  }
  else if(authType == "Base64") {
    #The sessionID is data3 or 4
    #close_user_session=0&lang=en&port=0&id=admin&pwd=4321
    data = "close_user_session=0&lang=en&port=0&id=" + username + "&pwd=" + password;

    #ID=YWRtaW4=&PWD=NDMyMQ==&SessionID=0.5762652428478185
    auth =  "ID=" + base64(str: username) + "=&PWD=" + base64(str: password) + "==&SessionID=" + data3Num;

    req = http_post_req(port: port, url: loginUrl, data: data, add_headers: make_array("Accept-Encoding", "gzip, deflate",
                                                                                       "Cache-Control", "max-age=0",
                                                                                       "Upgrade-Insecure-Requests", "1",
                                                                                       "Content-Type", "application/x-www-form-urlencoded",
                                                                                       "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
                                                                                       "Cookie", auth));
    res = http_send_recv(port: port, data: req);
  }
  else if(authType == "MD5") {
    #lang=en&port=0&close_user_session=0&data1=YWRtaW4%3D&data2=21232f297a57a5a743894a0e4a801fc3
    data = "lang=en&port=0&close_user_session=0&data1=" + base64(str: username) + "%3D&data2=" +  hexstr(MD5(password));

    #DATA1=YWRtaW4=&DATA2=YWRtaW4=&SDATA3=0.4896536714730517
    auth = "DATA1=" + base64(str: username) + "&DATA2=" + base64(str: password) + "&SDATA3=" + data3Num;

    req = http_post_req(port: port, url: loginUrl, data: data, add_headers: make_array("Accept-Encoding", "gzip, deflate",
                                                                                       "Cache-Control", "max-age=0",
                                                                                       "Upgrade-Insecure-Requests", "1",
                                                                                       "Content-Type", "application/x-www-form-urlencoded",
                                                                                       "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
                                                                                       "Cookie", auth));
    res = http_send_recv(port: port, data: req);
  }

  if(res =~ "top.document.location.href='../index.htm\?port=[0-9]+';" && !(res =~ "<\s*body\s*onload\s*=\s*'movetoauth\(\)'\s*>")) {
    VULN = TRUE;
    report += '\nusername: "' + username + '", password: "' + password + '"';
  }
}

if(VULN) {
  report = "It was possible to login with the following default credentials: " + report;
  security_message(port: port, data: report);
  exit(0);
}

exit(99);